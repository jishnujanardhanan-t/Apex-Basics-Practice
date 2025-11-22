public class BookingSystem {
    public Integer totalRooms;       // Total rooms available in the hotel/property
    public Integer availableRooms;   // Rooms currently available for booking

    // Constructor initializes total and available rooms
    public BookingSystem(Integer totalRooms) {
        this.totalRooms = totalRooms;
        this.availableRooms = totalRooms;
    }

    // Method to reserve rooms
    public String reserveRoom(Integer reservedRooms) {
        // Validate input
        if (reservedRooms <= 0) {
            return 'Invalid input.';
        }
        // Check room availability
        else if (reservedRooms > availableRooms) {
            return 'Not enough rooms available. Only ' + availableRooms + ' left.';
        }
        else {
            // Confirm reservation
            availableRooms -= reservedRooms;
            return reservedRooms + ' room(s) reserved successfully. Available rooms: ' + availableRooms;
        }
    }

    // Method to cancel a room reservation
    public String cancelReservation(Integer canceledRooms) {
        // Only cancel if some rooms were previously booked
        if (availableRooms < totalRooms) {
            availableRooms += canceledRooms;

            // Ensure available rooms do not exceed total
            if (availableRooms > totalRooms) {
                availableRooms = totalRooms;
            }

            return 'Reservation canceled for ' + canceledRooms + ' room(s). Available rooms: ' + availableRooms;
        } 
        else {
            return 'All rooms are already available.';
        }
    }
}
