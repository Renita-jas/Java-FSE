public class Main{
    public static void main(String[] args){
        Product[] products={
                new Product(101, "Keyboard", "Electronics"),
                new Product(102, "Laptop", "Electronics"),
                new Product(103, "Mouse", "Electronics"),
                new Product(104, "Monitor", "Electronics"),
                new Product(105, "Printer", "Electronics")
        };

        Product result1=SearchOperations.linearSearch(products, 104);
        if (result1!=null){
            System.out.println("Linear Search Found: " + result1);
        }
        Product result2=SearchOperations.binarySearch(products, 104);
        if (result2!=null){
            System.out.println("Binary Search Found: " + result2);
        }
    }
}
