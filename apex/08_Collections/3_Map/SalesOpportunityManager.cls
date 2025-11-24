public class SalesOpportunityManager {
    Map<String, List<String>> salesOppMap;
    
    public SalesOpportunityManager(Map<String, List<String>> salesOppMap) {
        this.salesOppMap = salesOppMap;
    }
    
    public void addOpportunity(String salesPerson, String newOpp) {
        if (salesOppMap.containsKey(salesPerson)) {
            salesOppMap.get(salesPerson).add(newOpp);
        } else {
            System.debug('Salesperson ' + salesPerson + ' does not exist');
        }
    }
    
    public void showOpportunities() {
        for (String salesPerson : salesOppMap.keySet()) {
            System.debug(salesPerson + ' : ' + salesOppMap.get(salesPerson));
        }
    }
}
    