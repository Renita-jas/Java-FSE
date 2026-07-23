public class EmployeeManagementSystem{
    private Employee[] employees;
    private int count;
    public EmployeeManagementSystem(int size){
        employees=new Employee[size];
        count=0;
    }
    public void addEmployee(Employee employee){
        if (count<employees.length){
            employees[count]=employee;
            count++;
            System.out.println("Employee Added");
        } else{
            System.out.println("Array Full");
        }
    }
    public Employee searchEmployee(int id){
        for (int i=0;i<count;i++){
            if (employees[i].employeeId==id) {
                return employees[i];
            }
        }
        return null;
    }
    public void traverseEmployees(){
        for (int i=0;i<count;i++){
            employees[i].display();
        }
    }
    public void deleteEmployee(int id){
        int index =-1;
        for (int i=0;i<count;i++){
            if (employees[i].employeeId==id) {
                index = i;
                break;
            }
        }
        if (index==-1) {
            System.out.println("Employee Not Found");
            return;
        }
        for (int i=index; i<count - 1;i++){
            employees[i]=employees[i + 1];
        }
        employees[count - 1]=null;
        count--;
        System.out.println("Employee Deleted");
    }
}
