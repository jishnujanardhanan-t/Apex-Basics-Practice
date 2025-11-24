public class ProjectTaskManager {

    // Map<ProjectName, List<TaskName-Status>>
    private Map<String, List<TaskWrapper>> projectTasks;

    // Constructor
    public ProjectTaskManager() {
        projectTasks = new Map<String, List<TaskWrapper>>();
    }

    // Inner class to store Task Name + Status
    public class TaskWrapper {
        public String taskName { get; set; }
        public String status { get; set; }

        public TaskWrapper(String taskName, String status) {
            this.taskName = taskName;
            this.status = status;
        }
    }

    // Add a task to a project
    public void addTask(String projectName, String taskName) {
        if (String.isBlank(projectName) || String.isBlank(taskName)) {
            System.debug('Project name or Task name cannot be blank.');
            return;
        }

        if (!projectTasks.containsKey(projectName)) {
            projectTasks.put(projectName, new List<TaskWrapper>());
        }

        projectTasks.get(projectName).add(new TaskWrapper(taskName, 'Not Started'));
        System.debug('Task "' + taskName + '" added to project "' + projectName + '" with status Not Started.');
    }

    // Update task status
    public void updateTaskStatus(String projectName, String taskName, String newStatus) {
        if (!projectTasks.containsKey(projectName)) {
            System.debug('Project "' + projectName + '" does not exist.');
            return;
        }

        Boolean found = false;
        for (TaskWrapper task : projectTasks.get(projectName)) {
            if (task.taskName == taskName) {
                task.status = newStatus;
                found = true;
                System.debug('Task "' + taskName + '" status updated to "' + newStatus + '"');
                break;
            }
        }

        if (!found) {
            System.debug('Task "' + taskName + '" not found in project "' + projectName + '"');
        }
    }

    // Get tasks by status for a project
    public List<String> getTasksByStatus(String projectName, String status) {
        List<String> result = new List<String>();
        if (!projectTasks.containsKey(projectName)) return result;

        for (TaskWrapper task : projectTasks.get(projectName)) {
            if (task.status == status) {
                result.add(task.taskName);
            }
        }
        return result;
    }

    // Project summary report
    public void showProjectSummary(String projectName) {
        if (!projectTasks.containsKey(projectName)) {
            System.debug('Project "' + projectName + '" does not exist.');
            return;
        }

        Integer total = projectTasks.get(projectName).size();
        Integer completed = 0;
        Integer inProgress = 0;
        Integer notStarted = 0;

        for (TaskWrapper task : projectTasks.get(projectName)) {
            if (task.status == 'Completed') completed++;
            else if (task.status == 'In Progress') inProgress++;
            else notStarted++;
        }

        System.debug('--- Project Summary: ' + projectName + ' ---');
        System.debug('Total Tasks: ' + total);
        System.debug('Completed: ' + completed + ', In Progress: ' + inProgress + ', Not Started: ' + notStarted);
    }

    // Show all tasks for all projects
    public void showAllProjects() {
        for (String proj : projectTasks.keySet()) {
            System.debug('Project: ' + proj);
            for (TaskWrapper task : projectTasks.get(proj)) {
                System.debug('  Task: ' + task.taskName + ', Status: ' + task.status);
            }
        }
    }
}
