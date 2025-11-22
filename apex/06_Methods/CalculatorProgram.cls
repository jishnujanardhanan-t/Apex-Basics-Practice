public class CalculatorProgram
{   
    // Method that returns the sum of two numbers
    public Decimal add(Integer a, Integer b)
    {
        Decimal result = a + b;
        return result;
    }

    // Displays addition result (void method example)
    public void addition(Integer a, Integer b)
    {
        Integer result = a + b;
        System.debug('Result : ' + result);
    }

    // Subtracts second number from first
    public void subtraction(Integer a, Integer b)
    {
        Integer result = a - b;
        System.debug('Result : ' + result);
    }

    // Multiplies two numbers
    public void multipliaction(Integer a, Integer b)
    {
        Integer result = a * b;
        System.debug('Result : ' + result);
    }

    // Divides two numbers and prints result + remainder
    public void division(Integer a, Integer b)
    {
        // Prevent division by zero
        if (b == 0)
        {
            System.debug('Division is not possible with 0');
        }
        else
        {
            Integer result = a / b;
            Integer remainder = Math.mod(a, b);

            System.debug('Result : ' + result);
            System.debug('Remainder : ' + remainder);
        }
    }
}
