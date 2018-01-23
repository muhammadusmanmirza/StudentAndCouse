public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String name){
        String na = name;
        List<List<sObject>> searchContactLeadObject = [Find :na In ALL FIELDS Returning Contact(FirstName,LastName),Lead(Name)];
        return searchContactLeadObject;
    }

}