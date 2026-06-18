public class Main{
    public static void main(String[] args){
        Order[] orders={
                new Order(101, "Alice", 2500),
                new Order(102, "Bob", 1000),
                new Order(103, "Charlie", 4000),
                new Order(104, "David", 1500)
        };
        QuickSort.quickSort(orders, 0, orders.length - 1);
        System.out.println("Sorted Orders:");
        for (Order order : orders){
            System.out.println(order);
        }
    }
}