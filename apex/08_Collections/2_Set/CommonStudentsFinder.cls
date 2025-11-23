public class CommonStudentsFinder {

    public static Set<String> getCommonStudents(Set<String> batchA, Set<String> batchB) {

        // Clone Set to avoid modifying original
        Set<String> result = batchA.clone();

        // Retain only common items
        result.retainAll(batchB);

        return result;
    }
}

/**Set<String> batchA = new Set<String>{ 'John', 'David', 'Arun', 'Sarah' };
Set<String> batchB = new Set<String>{ 'Arun', 'Vijay', 'John', 'Priya' };

System.debug( CommonStudentsFinder.getCommonStudents(batchA, batchB) );*/