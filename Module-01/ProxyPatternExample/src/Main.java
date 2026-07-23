public class Main{
    public static void main(String[] args){
        Image image=new ProxyImage("https://share.google/jwxckiZn7qG4b7sRj");
        System.out.println("Image object created.");
        System.out.println("\nFirst Display:");
        image.display();
        System.out.println("\nSecond Display:");
        image.display();
    }
}
