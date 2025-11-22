public class CarConstructor {
    public String carBrandName;
    public String carModelName;
        
    public CarConstructor(String carBrandName, String carModelName) {
        this.carBrandName = carBrandName;
        this.carModelName = carModelName;
    }

    public String startStop(String carState) {
        if (carState.equalsIgnoreCase('Start')) {
            System.debug('Car starting...');
            return carBrandName + ' ' + carModelName + ' is starting';
        }
        else if (carState.equalsIgnoreCase('Stop')) {
            System.debug('Car stopping...');
            return carBrandName + ' ' + carModelName + ' is stopping';
        }
        else {
            System.debug('Invalid car state provided.');
            return 'Invalid state';
        }
    }
}
