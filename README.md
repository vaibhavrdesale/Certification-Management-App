# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)

## Certification Management App

Introduction: Certification Management App is a platform to track and manage salesforce certification vouchers issued to all practice members.
Type of Users:
1.	App Admin
2.	App User
Use Cases:
1.	App Admin will be able to add, edit and track Certification and Voucher details.	
2.	App User should be able to raise employee voucher request in the system (LWC Component)
3.	App User should not be able to raise same certification voucher request again if one already exist in the system. 
4.	Employee should get notified once their request is submitted. 
5.	App User submitted request should automatically go to App Admin further approve or reject. 
6.	Once certification request is approved or rejected then notification should be sent to Employee and App User. 
7.	Comments should be mandatory in case request is rejected by App Admin. 
8.	 An active Voucher should be assigned automatically to the Certification Request once it is approved.  
9.	Certification request status should be automatically changed to Assigned once voucher is assigned to the certification request, 
10.	Only One Voucher can be assigned to 1 Certification request. 
Create LWC Component for certification voucher request, once request is raised it should navigate to Thank you page. Request Voucher should take all input parameters required for raising voucher request per fields created in the custom object. Once request is raised record should be stored in salesforce.




Object & Fields:
Object	Fields
Employee	Emp ID
	Emp Name
	Primary Skill
	Secondary Skill
	Experience
Comments
	
Certification	Cert Id
	Cert Name
	Comments
Certification Request	Certification (Master-Detail)
	Employee (Master-Detail)
	Voucher (lookup)
Due Date
Status (Picklist)
  Draft,
  Approved
  Rejected
  Passed
  Failed
Comments
	
Voucher	Voucher Id
	Voucher Cost
	Certification (Lookup)
	Validity (Date)
	Active (Boolean- Y/N)
Comments



