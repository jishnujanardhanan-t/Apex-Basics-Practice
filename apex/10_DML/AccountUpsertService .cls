public class AccountUpsertService {

    public static void upsertAccounts(List<Account> inputAccounts) {

        if (inputAccounts == null || inputAccounts.isEmpty()) {
            System.debug('No accounts provided. Exiting method.');
            return;
        }

        List<Account> validAccounts = new List<Account>();

        for (Account acc : inputAccounts) {
            if (acc.AccountNumber != null && acc.Name != null) {
                validAccounts.add(acc);
            } else {
                System.debug('Skipping invalid account: ' + acc);
            }
        }

        if (validAccounts.isEmpty()) {
            System.debug('No valid accounts to upsert.');
            return;
        }

        upsert validAccounts AccountNumber;

        System.debug('Upsert completed successfully.');
    }
}
