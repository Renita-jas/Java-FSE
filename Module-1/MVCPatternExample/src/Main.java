public class Main{
    public static void main(String[] args){
        Student student=new Student("Alice", 101, "A");
        StudentView view=new StudentView();
        StudentController controller=new StudentController(student, view);
        controller.updateView();
        controller.setStudentName("Bob");
        controller.setStudentGrade("A+");
        System.out.println("\nUpdating student details...\n");
        controller.updateView();
    }
}