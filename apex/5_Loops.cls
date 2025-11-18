public class LoopsExample {

    public static void forLoop() {
        for(Integer i = 1; i <= 5; i++) {
            System.debug(i);
        }
    }

    public static void whileLoop() {
        Integer i = 5;
        while(i > 0) {
            System.debug(i);
            i--;
        }
    }

    public static void doWhileLoop() {
        Integer i = 10;
        do {
            System.debug('This runs at least once');
            i--;
        } while(i > 10);
    }

}
