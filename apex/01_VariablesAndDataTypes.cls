public class VariablesAndDataTypes {

    public static void integerAndDecimal() {
        Integer a = 10;
        Decimal b = 30.5;
        System.debug('Integer: ' + a + ', Decimal: ' + b);
    }

    public static void booleanAndString() {
        Boolean isActive = true;
        String name = 'Apex';
        System.debug('Boolean: ' + isActive + ', String: ' + name);
    }

    public static void dateAndDatetime() {
        Date today = Date.today();
        Datetime now = Datetime.now();
        System.debug('Date: ' + today + ', Datetime: ' + now);
    }

}
