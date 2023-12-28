import { LightningElement} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import ReqCertName from '@salesforce/schema/Certification_Request__c.Certification__c';
import ReqEmpName from '@salesforce/schema/Certification_Request__c.Employee__c';
import ReqDueDate from '@salesforce/schema/Certification_Request__c.Due_Date__c';
import ReqStatus from '@salesforce/schema/Certification_Request__c.Status__c';
import ReqVouchName from '@salesforce/schema/Certification_Request__c.Voucher__c';
import ReqComm from '@salesforce/schema/Certification_Request__c.Comments__c';
import { NavigationMixin } from 'lightning/navigation';

export default class EmployeeCertRequest extends NavigationMixin(LightningElement) {
    
    fields = [ReqCertName, ReqEmpName, ReqDueDate, ReqStatus, ReqComm, ReqVouchName];

    handleSuccess(event) {

        this.dispatchEvent(new ShowToastEvent({
            title: 'Certification',
            message: 'Request Created !',
            variant: 'success'
        }));
         // location.reload();
       
        let componentDef = {
            componentDef: "c:thankYouPage",
        };

        let encodeComponentDef = btoa(JSON.stringify(componentDef));

        // Navigate to the Thank You page
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: '/one/one.app#' + encodeComponentDef
            }
        });

    }

}