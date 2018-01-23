public class DMLOperations {
    Account acc = new Account();
    public void insertNewRecord(){
        acc.Name='Muhammad Usman';
        acc.Phone='0336-4042101';
        acc.NumberOfEmployees=100;
        Insert acc;
        System.debug('Record Successfully Entered');
    }
    public void getId(){
        ID accid = acc.Id;
        System.debug('ID ='+ accid);
    }

}