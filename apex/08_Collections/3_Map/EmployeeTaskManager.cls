public class EmployeeTaskManager {

    private Map<String, List<String>> employeeTaskMap;

    public EmployeeTaskManager(Map<String, List<String>> initialMap) {
        if (initialMap != null) {
            this.employeeTaskMap = initialMap;
        } else {
            this.employeeTaskMap = new Map<String, List<String>>();
        }
    }

    // Add a task for an employee (creates new employee if not exists)
    public void addTask(String empName, String newTask) {
        if (String.isBlank(empName) || String.isBlank(newTask)) {
            System.debug('Employee name or task cannot be blank.');
            return;
        }

        // Add task dynamically
        if (!employeeTaskMap.containsKey(empName)) {
            employeeTaskMap.put(empName, new List<String>());
        }

        employeeTaskMap.get(empName).add(newTask);
        System.debug('Task "' + newTask + '" added to ' + empName);
    }

    // Remove a task for an employee
    public void removeTask(String empName, String task) {
        if (!employeeTaskMap.containsKey(empName)) {
            System.debug('Employee ' + empName + ' does not exist.');
            return;
        }

        List<String> tasks = employeeTaskMap.get(empName);
        if (tasks.remove(task)) {
            System.debug('Task "' + task + '" removed from ' + empName);
        } else {
            System.debug('Task "' + task + '" not found for ' + empName);
        }

        // Remove employee if no tasks left
        if (tasks.isEmpty()) {
            employeeTaskMap.remove(empName);
            System.debug(empName + ' removed from the map (no remaining tasks).');
        }
    }

    // Get tasks for a specific employee
    public List<String> getTasks(String empName) {
        if (employeeTaskMap.containsKey(empName)) {
            return new List<String>(employeeTaskMap.get(empName)); // return a copy
        }
        return new List<String>(); // return empty list if employee not found
    }

    // Show all tasks for all employees
    public void showAllTasks() {
        if (employeeTaskMap.isEmpty()) {
            System.debug('No employees or tasks found.');
            return;
        }

        for (String empName : employeeTaskMap.keySet()) {
            List<String> tasks = employeeTaskMap.get(empName);
            tasks.sort(); // Sort tasks alphabetically
            System.debug(empName + ' : ' + tasks);
        }
    }

    // Get total number of tasks across all employees
    public Integer getTotalTasks() {
        Integer count = 0;
        for (List<String> tasks : employeeTaskMap.values()) {
            count += tasks.size();
        }
        return count;
    }
}
