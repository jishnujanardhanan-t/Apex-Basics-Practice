public class SOQLCondition {
    public static Integer getAccountCount() {
        List<Account> accountCountList = [SELECT Id FROM Account LIMIT 7];
        if(accountCountList.isEmpty()) {
            System.debug('No record found');
            return 0;
        } else {
            return accountCountList.size();
        }
    }
    public static String getFirstAccountName() {
        List<Account> accountList = [SELECT Name FROM Account ORDER BY CreatedDate ASC LIMIT 1];
        if(accountList.isEmpty()) {
            return 'No record found';
        } else {
            return accountList[0].Name;
        }
    }
    public static List<String> getAllContactNames() {
        List<Contact> contacts = [SELECT LastName FROM Contact];
        if(contacts.isEmpty()) {
            return new List<String>();
        } else {
            List<String> names = new List<String>();
            
            for(Contact c : contacts){
                names.add(c.LastName);
            }
            return names;
        }
    }
    public static String  getSecondAccountname() {
        List<Account> accountList = [SELECT Name FROM Account];
        if (accountList.size() < 2) {
            return 'Not enough records';
        } else {
            return accountList[1].Name;
        }
    }
    public static String getFirstOpportunityName() {
        List<Opportunity> opportunityList = [SELECT Name FROM Opportunity];
        if(opportunityList.isEmpty()) {
            return 'No Opportunities found';
        } 
        else {
            return opportunityList[0].Name;
        }
    }
    public static List<String> getAccountPhones() {
        List<Account> accountList = [SELECT Id, Phone FROM Account];
        List<String> phoneList = new List<String>();
        
        if(!accountList.isEmpty()) 
            
        {
            for(Account acc : accountList){
                phoneList.add(acc.Phone);
            }
                           
        }
         return phoneList;
    }
    public static Integer getContactCount() {
        Integer contactCount = [SELECT COUNT() FROM Contact];
        return contactCount;
    }
    public static List<String> getClosedWonOpportunityNames() {
        List<Opportunity> oppList = [SELECT Name FROM Opportunity WHERE StageName = 'Closed Won'];
        List<String> names = new List<String>();        
        for (Opportunity opp : oppList) {
            names.add(opp.Name);
        }        
        return names; 
    }
    public static String getSecondAccountIdAndName() {
        List<Account> accList = [SELECT Id, Name FROM Account];
        
        if (accList.size() < 2) {
            return 'Not enough accounts';
        }
        
        Account secondAcc = accList[1];
        return secondAcc.Id + ' - ' + secondAcc.Name;
    }
    public static string getAccountName() {
        Account acc = [SELECT Id, Name FROM Account LIMIT 1];
        return acc.Name;
    }
}