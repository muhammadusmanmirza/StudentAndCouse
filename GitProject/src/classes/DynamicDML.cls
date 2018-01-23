public class DynamicDML {


    public void retrievingForeignKey(){
        Sobject s = Database.query('Select id,FirstName,AccountId,Account.Name From Contact Limit 1');
        System.debug(s);
        sObject a = s.getSObject('Account');
        System.debug(a);
    }
    Public void retrieveingForeignKeyInParentToChildRelationship(){
        String query = 'Select Id, Name , (Select FirstName,LastName from Contacts Limit 1) From Account';
        sObject[] parentQuery = database.query(query);
        For(sObject obj : parentQuery){
            Object parentFieldValue = obj.get('Name');
            sObject[] childRecordFromParents = obj.getSObjects('Contacts');
            For(sObject childRecordField : childRecordFromParents){
                Object childRecordField1 = childRecordField.get('FirstName');
                Object childRecordField2 = childRecordField.get('LastName');
                System.debug('Account Name :'+parentFieldValue+'Contact Name:'+childRecordField1+childRecordField2);
            }
        }
        
    }
}