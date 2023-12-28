trigger TriggerOnCertificationRequest on Certification_Request__c (after update, before insert) {

    //To Assign Voucher automatically on the basis of status
    if (Trigger.isAfter) {
        Boolean act = true;
        List<Certification_Request__c> certRequest = [ SELECT Certification__c, Voucher__c, Status__c FROM Certification_Request__c WHERE Status__c =: 'Approved' AND Voucher__c =: NUll ];
        List<Voucher__c> vouchList = [SELECT Voucher_Id__c, Active__c, Certification__c FROM Voucher__c] ;

        for (Certification_Request__c i : certRequest) {
          for (Voucher__c voucher : vouchList) {
            if (voucher.Certification__c == i.Certification__c && voucher.Active__c == act) {
                i.Voucher__c = voucher.Id;
                voucher.Active__c = false;
                update i;
                update voucher;
            }
          }
        }

    }

    //To Check that same Employee is create request for same Certification
    if (Trigger.isInsert) {
        List<Certification_Request__c> empList = [SELECT Id, Employee__c, Certification__c FROM Certification_Request__c ];
        
        for (Certification_Request__c obj : Trigger.new ) {
            for (Certification_Request__c request : empList) {
                if (request.Employee__c == obj.Employee__c && request.Certification__c == obj.Certification__c) {
                    obj.Employee__c.addError(' Certification Request for this Employee already exists !');
                }
            }
            
        }
    }


    // To Check duplication of previos request
    if ( Trigger.isInsert ) {
        List<Certification_Request__c> reqList = [SELECT Id,Certification__c, Voucher__c FROM Certification_Request__c ];
        for( Certification_Request__c obj : Trigger.new ) {
            if ( obj.Voucher__c != NULL ) {
                for (Certification_Request__c req : reqList) {
                    if (req.Certification__c == obj.Certification__c && req.Voucher__c == obj.Voucher__c) {
                        obj.addError('Cannot Use Same Certification and Voucher Details Again, Request Already Pending !');
                    }
                }

            }
        }
    }

      //To change the status from approved to assigned after assigning voucher
      if (Trigger.isAfter) {
        Boolean act = true;
        List<Certification_Request__c> reqList = [ SELECT Certification__c, Voucher__c, Status__c FROM Certification_Request__c ];
        if ( !reqList.isEmpty() ) {
            for ( Certification_Request__c i : reqList ) {
                if (i.Status__c == 'Approved' && i.Voucher__c != NUll) {
                    i.Status__c = 'Assigned ';
                    update i;
                } 
            }
        }
    }
    
}