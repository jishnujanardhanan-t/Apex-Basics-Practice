public class BankAccount {

    public Decimal balance;

    // Constructor
    public BankAccount(Decimal openingBalance) {
        this.balance = openingBalance;
    }

    public void deposit(Decimal amount) {
        if(amount > 0) {
            balance += amount;
            System.debug('Deposited: ' + amount);
        } else {
            System.debug('Invalid deposit amount');
        }
    }

    public void withdraw(Decimal amount) {
        if(amount <= 0) {
            System.debug('Invalid withdraw amount');
        }
        else if(amount > balance) {
            System.debug('Insufficient funds');
        }
        else {
            balance -= amount;
            System.debug('Withdrawn: ' + amount);
        }
    }

    public void checkBalance() {
        System.debug('Current Balance: ' + balance);
    }
}
