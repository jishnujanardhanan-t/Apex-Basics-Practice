public class Product {

    public String productName;
    public String category;
    public Decimal price;

    public Product(String productName, String category, Decimal price) {
        this.productName = productName;
        this.category = category;
        this.price = price;
    }

    public static void manageProducts() {

        List<Product> productList = new List<Product>();

        productList.add(new Product('Laptop', 'Electronics', 55000));
        productList.add(new Product('Mobile', 'Electronics', 35000));
        productList.add(new Product('Headphone', 'Charger', 500));
        productList.add(new Product('Tablet', 'Electronics', 15000));

        System.debug('Products with Price more than 1000');
        for (Product p : productList) {
            if (p.price > 1000) {
                System.debug(p.productName + ' - ' + p.price);
            }
        }

        Integer count = 0;
        for (Product p : productList) {
            if (p.category == 'Electronics') {
                count++;
            }
        }

        System.debug('Total Electronics Products: ' + count);
    }
}