import java.util.ArrayList;
import java.util.List;
public class StockMarket implements Stock{
    private List<Observer> observers=new ArrayList<>();
    private float price;
    @Override
    public void registerObserver(Observer observer){
        observers.add(observer);
    }
    @Override
    public void removeObserver(Observer observer){
        observers.remove(observer);
    }
    @Override
    public void notifyObservers(){
        for (Observer observer : observers){
            observer.update(price);
        }
    }
    public void setPrice(float price){
        this.price=price;
        System.out.println("\nStock price updated: " + price);
        notifyObservers();
    }
}
