public class OnlineOrders {
    public class Order {
        public String orderId;
        public String customerName;
        public Decimal amount;

        public Order(String orderId, String customerName, Decimal amount) {
            this.orderId = orderId;
            this.customerName = customerName;
            this.amount = amount;
        }
    }

    public static void manageOrders() {
        List<Order> orders = new List<Order>{
            new Order('O001', 'John', 7500),
            new Order('O002', 'Sarah', 4500),
            new Order('O003', 'John', 10000),
            new Order('O004', 'Michael', 3000),
            new Order('O005', 'John', 6000)
        };

        System.debug('Orders with Amount > 5000');
        for (Order o : orders) {
            if (o.amount > 5000) {
                System.debug('Order ID: ' + o.orderId + ', Customer: ' + o.customerName + ', Amount: ' + o.amount);
            }
        }

        Integer johnCount = 0;
        for (Order o : orders) {
            if (o.customerName == 'John') {
                johnCount++;
            }
        }

        System.debug('Total Orders Placed by John: ' + johnCount);
    }
}