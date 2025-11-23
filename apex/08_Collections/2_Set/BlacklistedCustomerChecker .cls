public class BlacklistedCustomerChecker {

    public static Set<String> getBlockedCustomers(Set<String> allCustomers, Set<String> blacklisted) {
        
        // Clone so original isn't changed
        Set<String> blocked = allCustomers.clone();

        // Remove all non-blacklisted customers → keep only blacklisted
        blocked.retainAll(blacklisted);

        return blocked;
    }
}

/**Set<String> customers = new Set<String>{ 'C001', 'C002', 'C003', 'C004', 'C005' };
Set<String> blacklisted = new Set<String>{ 'C002', 'C005' };

System.debug( BlacklistedCustomerChecker.getBlockedCustomers(customers, blacklisted) );
 */