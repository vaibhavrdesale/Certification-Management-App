public with sharing class FetchData {

    @AuraEnabled(Cacheable=true)
    public static List<Employee__c> empData() {
        return [ SELECT Id, Name, Emp_Name__c, Primary_Skill__c, Secondary_Skill__c, Experience__c, Comments__c FROM Employee__c ORDER BY Id LIMIT 10];
    }

    @AuraEnabled(Cacheable=true)
    public static List<Certification__c> certData(){
        return [ SELECT Id, Name, Comments__c FROM Certification__c ORDER BY Id LIMIT 10 ];
    }

    @AuraEnabled(Cacheable=true)
    public static List<Voucher__c> vouData(){
        return [ SELECT Name, Active__c, Certification__r.Name, Comments__c, Id, Validity__c, Voucher_Cost__c FROM Voucher__c ORDER BY Id ASC NULLS FIRST LIMIT 10 ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Certification_Request__c> getCertificationRequestData(){
        return [ SELECT  Id, Name, Certification__r.Name, Employee__r.Emp_Name__c, Status__c, Voucher__r.Name FROM Certification_Request__c];
    }

}