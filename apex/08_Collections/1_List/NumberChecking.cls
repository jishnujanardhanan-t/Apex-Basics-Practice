public class NumberChecking {
    
    //Method to check numbers are odd or even.
    public static List<String> checkOddEven(Integer startNum, Integer endNum) {
        List<Integer> oddNumbers = new List<Integer>();
        List<Integer> evenNumbers = new List<Integer>();
        
        for(Integer i = startNum; i <= endNum; i++) {
            if(Math.mod(i,2) == 0) {
                evenNumbers.add(i);
            } else {
                oddNumbers.add(i);
            }
        }
        List<String> result = new List<string>();
        result.add('Odd Numbers: ' + oddNumbers);
        result.add('Even Numbers: ' + evenNumbers);
        return result;
    }
}