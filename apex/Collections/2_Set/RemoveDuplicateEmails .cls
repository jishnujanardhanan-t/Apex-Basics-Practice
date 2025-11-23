public class RemoveDuplicateEmails {
    public static List<String> getUniqueEmails(List<String> emailList) {
        
        // Set automatically removes duplicates
        Set<String> uniqueEmailSet = new Set<String>(emailList);
        
        // Convert back to List (useful for UI/response)
        return new List<String>(uniqueEmailSet);
    }
}

/**List<String> emails = new List<String>{
    'a@gmail.com', 'b@gmail.com', 'a@gmail.com', 'c@gmail.com', 'b@gmail.com'
};

System.debug( RemoveDuplicateEmails.getUniqueEmails(emails) );
 */