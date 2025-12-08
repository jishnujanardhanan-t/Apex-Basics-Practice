public class VariableBindingMapExamples {

    /*
     * ============================================================
     *  SCENARIO 1:
     *  Get Accounts by Industry → Use Set<String> from Map → Bind in SOQL
     * ============================================================
     */
    public static Map<String, List<Account>> getAccountsByIndustry(Map<String, Boolean> industryFilterMap) {

        // Extract industries WHERE the Boolean = true
        Set<String> industries = new Set<String>();
        for (String ind : industryFilterMap.keySet()) {
            if (industryFilterMap.get(ind) == true) {
                industries.add(ind);
            }
        }

        // If nothing to query
        if (industries.isEmpty()) return new Map<String, List<Account>>();

        // SOQL variable binding -> :industries
        List<Account> accList = [
            SELECT Id, Name, Industry
            FROM Account
            WHERE Industry IN :industries
        ];

        // Group result into Map<Industry, List<Account>>
        Map<String, List<Account>> result = new Map<String, List<Account>>();
        for (Account acc : accList) {
            if (!result.containsKey(acc.Industry)) {
                result.put(acc.Industry, new List<Account>());
            }
            result.get(acc.Industry).add(acc);
        }

        return result;
    }



    /*
     * ============================================================
     *  SCENARIO 2:
     *  Get Contacts for given Accounts → Use Map<Id, ??> keys → Bind in SOQL
     * ============================================================
     */
    public static Map<Id, List<Contact>> getContactsByAccount(Map<Id, Decimal> accountRatingMap) {

        Set<Id> accountIds = accountRatingMap.keySet();   // Variable binding

        if (accountIds.isEmpty()) return new Map<Id, List<Contact>>();

        List<Contact> conList = [
            SELECT Id, Name, Email, AccountId
            FROM Contact
            WHERE AccountId IN :accountIds
        ];

        // Organize contacts account-wise
        Map<Id, List<Contact>> result = new Map<Id, List<Contact>>();
        for (Contact con : conList) {
            if (!result.containsKey(con.AccountId)) {
                result.put(con.AccountId, new List<Contact>());
            }
            result.get(con.AccountId).add(con);
        }

        return result;
    }



    /*
     * ============================================================
     *  SCENARIO 3:
     *  Get Opportunity Total Amount by Stage for given Stage Filters
     *  Using Aggregation + Typecasting + Map Output
     * ============================================================
     */
    public static Map<String, Decimal> getOpportunityAmountByStage(Map<String, Boolean> stageFilterMap) {

        Set<String> stages = new Set<String>();
        for (String stg : stageFilterMap.keySet()) {
            if (stageFilterMap.get(stg) == true) {
                stages.add(stg);
            }
        }

        if (stages.isEmpty()) return new Map<String, Decimal>();

        // Aggregate Query with variable binding
        List<AggregateResult> arList = [
            SELECT StageName stage, SUM(Amount) total
            FROM Opportunity
            WHERE StageName IN :stages
            GROUP BY StageName
        ];

        // Convert AggregateResult into Map<Stage, Sum(Amount)>
        Map<String, Decimal> result = new Map<String, Decimal>();

        for (AggregateResult ar : arList) {
            String stage = (String) ar.get('stage');         // typecast required
            Decimal totalAmount = (Decimal) ar.get('total'); // typecast required
            result.put(stage, totalAmount);
        }

        return result;
    }

}
