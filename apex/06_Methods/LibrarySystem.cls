public class LibrarySystem {

    public static Integer issue(Integer currentBookCount, Integer quantity) {
        if (currentBookCount >= quantity) {
            return currentBookCount - quantity;
        } else {
            System.debug('No book available');
            return currentBookCount;
        }
    }

    public static Integer returnBook(Integer currentBookCount, Integer quantity) {
        return currentBookCount + quantity;
    }
}
