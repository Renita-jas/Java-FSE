public class Main{
    public static double predictFutureValue(double currentValue,double growthRate,int years){
        if (years==0){
            return currentValue;
        }
        return predictFutureValue(currentValue, growthRate,years - 1) * (1 + growthRate);
    }
    public static void main(String[] args){
        double presentValue=10000;
        double growthRate=0.10;
        int years=3;
        double futureValue=predictFutureValue(presentValue,growthRate,years);
        System.out.println("Predicted Future Value = " + futureValue);
    }
}
