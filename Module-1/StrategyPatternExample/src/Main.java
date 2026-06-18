public class Main{
    public static void main(String[] args){
        PaymentContext context=new PaymentContext();
        context.setPaymentStrategy(new CreditCardPayment());
        context.executePayment(500);
        context.setPaymentStrategy(new PayPalPayment());
        context.executePayment(1200);
        context.setPaymentStrategy(new CreditCardPayment());
        context.executePayment(300);
    }
}