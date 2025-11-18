public class OperatorsExample {

    public static void arithmeticOperators() {
        Integer a = 10;
        Integer b = 5;
        System.debug('Sum: ' + (a + b) + ', Difference: ' + (a - b));
    }

    public static void comparisonOperators() {
        Integer x = 8;
        Integer y = 12;
        if(x > y) System.debug(x + ' is greater than ' + y);
        else if(x == y) System.debug(x + ' is equal to ' + y);
        else System.debug(x + ' is less than ' + y);
    }

    public static void logicalOperators() {
        Boolean isAdmin = true;
        Boolean isActive = false;
        if(isAdmin && isActive) System.debug('Access Granted');
        else System.debug('Access Denied');
    }

}
