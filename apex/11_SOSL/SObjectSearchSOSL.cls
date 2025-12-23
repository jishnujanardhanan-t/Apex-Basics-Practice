public class SObjectSearchSOSL {

    public static List<List<SObject>> getSearchWord(String word) {
        List<List<SObject>> searchResults = [FIND :word RETURNING Account(Name), Contact(LastName), Opportunity(Name)];
        return searchResults;
    }
    
    public static List<List<SObject>> getSearchWords(String word) {
        List<List<SObject>> searchResults = [FIND :word IN NAME FIELDS RETURNING Account(Name), Lead(Name)];
        return searchResults;
    }
    
    public static void getSearchingWord(String word) {
        List<List<SObject>> searchResults = [FIND :word IN ALL FIELDS RETURNING Account(Name), Contact(Name)];
        List<Account> accounts = (List<Account>) searchResults[0];
        List<Contact> contacts = (List<Contact>) searchResults[1];
        System.debug(accounts);
        System.debug(contacts);
    }
}
/** List<List<SObject>> results = SObjectSearchSOSL.getSearchWord('United Oil');
System.debug(results);*/

/** List<List<SObject>> results = SObjectSearchSOSL.getSearchWords('Pyramid');
List<Account> accounts = (List<Account>) results[0];
for (Account acc : accounts) {
    System.debug(acc.Name);
}*/

/** SObjectSearchSOSL.getSearchingWord('Burlington');*/