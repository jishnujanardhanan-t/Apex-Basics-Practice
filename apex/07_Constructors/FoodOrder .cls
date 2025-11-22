public class FoodOrder {

    public String customerName;
    public String foodItem;
    public Integer quantity;
    public Decimal pricePerItem;
    public Decimal deliveryCharge;

    // Constructor
    public FoodOrder(String customerName, String foodItem, Integer quantity, Decimal pricePerItem) {
        this.customerName = customerName;
        this.foodItem = foodItem;
        this.quantity = quantity;
        this.pricePerItem = pricePerItem;
        this.deliveryCharge = 40; // default charge
    }

    // Method to calculate total amount
    public Decimal calculateTotal() {
        Decimal foodTotal = quantity * pricePerItem;
        return foodTotal + deliveryCharge;
    }

    // Method to print details
    public void printOrderDetails() {
        System.debug('Customer: ' + customerName);
        System.debug('Item: ' + foodItem);
        System.debug('Quantity: ' + quantity);
        System.debug('Total Amount: ' + calculateTotal());
    }
}
