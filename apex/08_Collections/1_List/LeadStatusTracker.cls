public class LeadStatusTracker {
    public static void manageLeads() {
        List<String> leadStatuses = new List<String>{'New', 'Contacted', 'Qualified', 'Disqualified', 'Follow-up'};
        System.debug('Before Update: ' + leadStatuses);

        leadStatuses.set(1,'Converted');
        
        leadStatuses.remove(3);

        for (String status : leadStatuses) {
            System.debug('Lead Status: ' + status);
        }
    }
}