public class SwitchExample {

    public static void dayOfWeek(Integer dayNum) {
        switch on dayNum {
            when 1 { System.debug('Sunday'); }
            when 2 { System.debug('Monday'); }
            when 3 { System.debug('Tuesday'); }
            when else { System.debug('Other Day'); }
        }
    }

    public static void ticketStatus(String status) {
        switch on status {
            when 'Open' { System.debug('Ticket is Open'); }
            when 'Closed' { System.debug('Ticket is Closed'); }
            when else { System.debug('Unknown Status'); }
        }
    }

    public static void trafficLight(String color) {
        switch on color {
            when 'Red' { System.debug('Stop'); }
            when 'Yellow' { System.debug('Caution'); }
            when 'Green' { System.debug('Go'); }
            when else { System.debug('Invalid Color'); }
        }
    }

}
