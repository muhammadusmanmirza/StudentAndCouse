public class DescribeClass {

    public DescribeClass(){
        //create new Account object of genreic type
sObject sobj = new Account();
// verify sobject is account object
//System.debug(schema.student__c.sObjectType);
If(sobj.getsObjectType() == Account.sObjectType){
   
    }
//  Get the sObject describe result for the Account object
Schema.DescribeSObjectResult dor = Account.sObjectType.getDescribe();
//System.debug(dor);
//System.debug(dor.Name);
// Get the field describe result for the Name field on the Account object
Schema.DescribeFieldResult dFR = Schema.SObjectType.Account.Fields.Name;
System.debug(dFR);
//verify that Field token is token of Name Field of Account
if(dFR.getSObjectField()==Account.Name){
  //  System.debug('Get the Field'+dFR.getSObjectField());
}
dFR = dFR.getSObjectField().getDescribe();
System.debug(dFR);
    }
}