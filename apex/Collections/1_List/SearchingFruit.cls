public class SearchingFruit {
    
    public static String searchFruit(List<String> fruits, String fruitName) {
        if(!fruits.isEmpty() && fruits.contains(fruitName)) {
            return 'Fruit is Found';
        } else if (fruits.isEmpty()) {
            return 'List is Empty';
        } else {
            return 'Fruit not Found';
        }
    }
}
/**List<String> fruits = new List<String>{'Apple', 'Orange', 'Mango'};
System.debug(SearchingFruit.searchFruit(fruits, 'Grapes'));*/