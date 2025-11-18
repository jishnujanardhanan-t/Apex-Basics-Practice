public class ConditionalsExample {

    public static void simpleIf() {
        Integer score = 55;
        if(score >= 50) System.debug('Pass');
    }

    public static void ifElse() {
        Integer score = 40;
        if(score >= 50) System.debug('Pass');
        else System.debug('Fail');
    }

    public static void nestedIfElse() {
        Integer score = 78;
        if(score >= 90) System.debug('Grade A');
        else if(score >= 75) System.debug('Grade B');
        else if(score >= 50) System.debug('Grade C');
        else System.debug('Fail');
    }

}
