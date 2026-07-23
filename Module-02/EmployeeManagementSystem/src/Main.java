public class Main{
    public static void main(String[] args){
        EmployeeManagementSystem ems=new EmployeeManagementSystem(10);
        ems.addEmployee(new Employee(101, "John", "Manager", 60000));
        ems.addEmployee(new Employee(102, "Alice", "Developer", 50000));
        ems.addEmployee(new Employee(103, "Bob", "Tester", 40000));
        System.out.println("All Employees:");
        ems.traverseEmployees();
        System.out.println("\nSearching Employee 102:");
        Employee e=ems.searchEmployee(102);
        if (e!=null)
            e.display();
        else
            System.out.println("Not Found");
        System.out.println("\nDeleting Employee 102");
        ems.deleteEmployee(102);
        System.out.println("\nEmployees After Deletion:");
        ems.traverseEmployees();
    }
}
