public class Main{
    public static void main(String[] args){
        LibraryManagementSystem library=new LibraryManagementSystem(10);
        library.addBook(new Book(101, "C++", "Bjarne"));
        library.addBook(new Book(102, "DBMS", "Korth"));
        library.addBook(new Book(103, "Java", "James Gosling"));
        library.addBook(new Book(104, "Python", "Guido"));
        System.out.println("Linear Search:");
        Book b1=library.linearSearch("Java");
        if (b1!=null)
            b1.display();
        else
            System.out.println("Book Not Found");
        System.out.println();
        System.out.println("Binary Search:");
        Book b2=library.binarySearch("Java");
        if (b2!=null)
            b2.display();
        else
            System.out.println("Book Not Found");
    }
}