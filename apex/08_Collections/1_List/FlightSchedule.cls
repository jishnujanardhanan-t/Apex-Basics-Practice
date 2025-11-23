public class FlightSchedulingSystem {

    // MODEL CLASS (Represents a Single Flight)

    public class Flight {
        public String flightNumber;
        public String route;
        public String timing;
        public Decimal price;
        public Boolean isAvailable;

        public Flight(String flightNumber, String route, String timing, Decimal price, Boolean isAvailable) {
            this.flightNumber = flightNumber;
            this.route = route;
            this.timing = timing;
            this.price = price;
            this.isAvailable = isAvailable;
        }
    }

    // METHOD: Returns all flights (realistic flight schedule)

    public static List<Flight> getAllFlights() {

        List<Flight> flights = new List<Flight>{
            new Flight('AI101', 'Chennai - Delhi', 'Morning',    6500, true),
            new Flight('AI205', 'Chennai - Delhi', 'Afternoon',  7200, true),
            new Flight('AI309', 'Chennai - Delhi', 'Evening',    7900, false),

            new Flight('IN441', 'Mumbai - Bangalore', 'Morning',   5500, true),
            new Flight('IN776', 'Mumbai - Bangalore', 'Afternoon', 6200, true),
            new Flight('IN889', 'Mumbai - Bangalore', 'Evening',   6800, true),

            new Flight('EK501', 'Hyderabad - Dubai', 'Morning',    15000, false),
            new Flight('EK502', 'Hyderabad - Dubai', 'Afternoon',  17000, true),
            new Flight('EK503', 'Hyderabad - Dubai', 'Evening',    19000, true)
        };

        return flights;
    }

    // METHOD: Display All Flights in a Clean Format

    public static void displayAllFlights() {
        List<Flight> flights = getAllFlights();

        System.debug('--------- FLIGHT SCHEDULE ---------');

        for (Flight f : flights) {
            System.debug(
                'Flight: ' + f.flightNumber +
                ' | Route: ' + f.route +
                ' | Time: ' + f.timing +
                ' | Price: ₹' + f.price +
                ' | Available: ' + f.isAvailable
            );
        }
    }

    // METHOD: Search flights by route

    public static List<Flight> searchByRoute(String routeName) {
        List<Flight> results = new List<Flight>();

        for (Flight f : getAllFlights()) {
            if (f.route == routeName) {
                results.add(f);
            }
        }
        return results;
    }

    // METHOD: Filter only available flights

    public static List<Flight> getAvailableFlights() {
        List<Flight> available = new List<Flight>();

        for (Flight f : getAllFlights()) {
            if (f.isAvailable) {
                available.add(f);
            }
        }
        return available;
    }

    // METHOD: Search flights by budget

    public static List<Flight> searchWithinBudget(Decimal maxBudget) {

        List<Flight> filtered = new List<Flight>();

        for (Flight f : getAllFlights()) {
            if (f.price <= maxBudget) {
                filtered.add(f);
            }
        }
        return filtered;
    }
}
