public with sharing class SOQLVariableBindingService {
    
    /**
     * Scenario 1:
     * Bind List<Id> to SOQL
     * Returns Accounts by Ids
     */
    public static List<Account> getAccountsByIds(List<Id> accountIds) {
        
        if (accountIds == null || accountIds.isEmpty()) {
            return new List<Account>();
        }
        
        return [
            SELECT Id, Name, Industry
            FROM Account
            WHERE Id IN :accountIds
        ];
    }
    
    
    /**
     * Scenario 2:
     * Bind a single String variable (dynamic LIKE pattern)
     * Returns Contacts whose Email ends with a domain
     */
    public static List<Contact> getContactsByDomain(String emailDomain) {
        
        if (String.isBlank(emailDomain)) {
            return new List<Contact>();
        }
        
        String pattern = '%' + emailDomain;
        
        return [
            SELECT Id, LastName, Email
            FROM Contact
            WHERE Email LIKE :pattern
        ];
    }
    
    
    /**
     * Scenario 3:
     * Bind a Set and a Date together
     * Returns Opportunities based on Stages and CloseDate
     */
    public static List<Opportunity> getOpportunitiesByStageAndDate(
        Set<String> stageNames, 
        Date minCloseDate
    ) {
        
        if (stageNames == null || stageNames.isEmpty() || minCloseDate == null) {
            return new List<Opportunity>();
        }
        
        return [
            SELECT Id, Name, StageName, Amount, CloseDate
            FROM Opportunity
            WHERE StageName IN :stageNames
            AND CloseDate >= :minCloseDate
        ];
    }
}
