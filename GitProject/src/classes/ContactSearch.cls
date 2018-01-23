public class ContactSearch {
    public static List<Contact> searchForContacts(String name , String postalCode){
        String lName = name;
        String pCode = postalCode;
        Contact[] conList = [select FirstName,LastName,Phone,MailingPostalCode from Contact where LastName=:lName and MailingPostalCode =:pCode ];
        return conList;
    }

}