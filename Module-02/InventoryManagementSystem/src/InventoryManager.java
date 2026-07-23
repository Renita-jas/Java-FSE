import java.util.HashMap;
public class InventoryManager{
    private HashMap<Integer, Product> inventory;
    public InventoryManager(){
        inventory=new HashMap<>();
    }
    public void addProduct(Product product){
        inventory.put(product.getProductId(), product);
        System.out.println("Product Added");
    }
    public void updateProduct(int productId, int quantity, double price){
        Product product=inventory.get(productId);
        if (product!=null){
            product.setQuantity(quantity);
            product.setPrice(price);
            System.out.println("Product Updated");
        } else{
            System.out.println("Product Not Found");
        }
    }
    public void deleteProduct(int productId){
        if (inventory.remove(productId)!=null){
            System.out.println("Product Deleted");
        } else{
            System.out.println("Product Not Found");
        }
    }
    public void displayProducts(){
        for (Product product : inventory.values()){
            System.out.println(product);
        }
    }
}
