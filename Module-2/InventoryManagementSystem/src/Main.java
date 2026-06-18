public class Main{
    public static void main(String[] args){
        InventoryManager manager=new InventoryManager();
        manager.addProduct(new Product(101, "Laptop", 10, 50000));
        manager.addProduct(new Product(102, "Mouse", 50, 500));
        manager.displayProducts();
        manager.updateProduct(101, 15, 52000);
        manager.deleteProduct(102);
        System.out.println("\nFinal Inventory:");
        manager.displayProducts();
    }
}
