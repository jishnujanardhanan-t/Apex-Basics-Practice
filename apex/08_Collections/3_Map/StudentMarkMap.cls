public class StudentMarkMap {

    public static Map<String, List<String>> studentsNameAndMark(Map<String, Integer> studentMarks, Integer passMark) {
        List<String> passedStudents = new List<String>();
        List<String> failedStudents = new List<String>();
        
        for(String studentName : studentMarks.keySet()) {
            Integer marks = studentMarks.get(studentName);
            
            if(marks >= passMark) {
                passedStudents.add(studentName);
            } else {
                failedStudents.add(studentName);
            }
        }
        
        Map<String, List<String>> result = new Map<String, List<String>>{
            'Passed' => passedStudents,
            'Failed' => failedStudents
        };
        
        return result;
    }
}
/**Map<String, Integer> students = new Map<String, Integer>{
    'Student A' => 75,
    'Student B' => 55,
    'Student C' => 90,
    'Student D' => 40
};

Map<String, List<String>> results = StudentMarkMap.studentsNameAndMark(students, 60);
System.debug('Passed Students: ' + results.get('Passed'));
System.debug('Failed Students: ' + results.get('Failed'));*/