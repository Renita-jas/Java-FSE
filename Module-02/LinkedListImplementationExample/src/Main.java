public class Main{
    public static void main(String[] args){
        TaskManagementSystem tms=new TaskManagementSystem();
        tms.addTask(new Task(1, "Design UI", "Pending"));
        tms.addTask(new Task(2, "Develop Backend", "In Progress"));
        tms.addTask(new Task(3, "Testing", "Pending"));
        System.out.println("All Tasks:");
        tms.traverseTasks();
        System.out.println("\nSearching Task 2:");
        Task task=tms.searchTask(2);
        if (task!=null){
            System.out.println(task.taskId + " " + task.taskName + " " + task.status);
        }
        System.out.println("\nDeleting Task 2");
        tms.deleteTask(2);
        System.out.println("\nTasks After Deletion:");
        tms.traverseTasks();
    }
}