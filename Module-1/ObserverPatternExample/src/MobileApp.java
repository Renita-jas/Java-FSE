public class MobileApp implements Observer{
    @Override
    public void update(float price){
        System.out.println("Mobile App: Stock price updated to " + price);
    }
}
