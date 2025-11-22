public class ExamResultCounter {

    public static Integer totalPass = 0;
    public static Integer totalFail = 0;

    public static void checkResult(Integer marks) {

        if (marks == null || marks < 0) {
            System.debug('Invalid marks');
            return;
        }

        if (marks >= 40) {
            totalPass++;
            System.debug('Student Passed');
        } else {
            totalFail++;
            System.debug('Student Failed');
        }

        System.debug('Total Passed: ' + totalPass +
                     ', Total Failed: ' + totalFail);
    }
}
