public class RealImage implements Image{
    private String imageUrl;
    public RealImage(String imageUrl){
        this.imageUrl=imageUrl;
        loadFromServer();
    }
    private void loadFromServer() {
        System.out.println("Downloading image from: " + imageUrl);
    }
    @Override
    public void display(){
        System.out.println("Displaying image from: " + imageUrl);
    }
}
