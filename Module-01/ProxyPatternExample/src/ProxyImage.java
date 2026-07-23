public class ProxyImage implements Image{
    private RealImage realImage;
    private String imageUrl;
    public ProxyImage(String imageUrl){
        this.imageUrl=imageUrl;
    }
    @Override
    public void display() {
        if (realImage == null) {
            realImage = new RealImage(imageUrl);
        }
        realImage.display();
    }
}
