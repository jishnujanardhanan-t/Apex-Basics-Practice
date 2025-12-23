public class UpdateAccountsForOpportunities {
    
    public static List<Account> updateAccountsOpps(Map<Id, Opportunity> oppMap) {
        
        Set<Id> accountIds = new Set<Id>();
        for (Opportunity opp : oppMap.values()) {
            if (opp.AccountId != null) {
                accountIds.add(opp.AccountId);
            }
        }
        
        List<Account> accList = [SELECT Id, Type, BillingState
                                 FROM Account
                                 WHERE Id IN :accountIds
                                 AND BillingState = 'CA'];
        
        for (Account acc : accList) {
            acc.Type = 'Customer - Direct';
        }
        if(!accList.isEmpty()) {
            update accList;
        }
        
        return accList;
    }
    
    public static List<Account> updateAccountsOpportunities(Map<Id, Opportunity> oppMap, String billingState, String type) {
        
        Set<Id> accountIds = new Set<Id>();
        for (Opportunity opp : oppMap.values()) {
            if (opp.AccountId != null) {
                accountIds.add(opp.AccountId);
            }
        }
        
        List<Account> accList = [SELECT Id, Type, BillingState
                                 FROM Account
                                 WHERE Id IN :accountIds
                                 AND BillingState = :billingState];
        
        for (Account acc : accList) {
            acc.Type = type;
        }
        if(!accList.isEmpty()) {
            update accList;
        }
        
        return accList;
    }
}

/**Map<Id, Opportunity> oppMap = new Map<Id, Opportunity>([SELECT Name, StageName, AccountId FROM Opportunity], 'CA');
System.debug(UpdateAccountsForOpportunities.updateAccountsOpps(oppMap));*/