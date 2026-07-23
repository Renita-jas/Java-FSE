public class Main{
    public static void main(String[] args){
        StockMarket stockMarket=new StockMarket();
        Observer mobileApp=new MobileApp();
        Observer webApp=new WebApp();
        stockMarket.registerObserver(mobileApp);
        stockMarket.registerObserver(webApp);
        stockMarket.setPrice(2500.50f);
        stockMarket.setPrice(2600.75f);
        stockMarket.removeObserver(mobileApp);
        stockMarket.setPrice(2700.00f);
    }
}
