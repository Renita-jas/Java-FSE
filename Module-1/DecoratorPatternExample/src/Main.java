public class Main{
    public static void main(String[] args){
        Notifier notifier=new EmailNotifier();
        System.out.println("Email Notification:");
        notifier.send();
        System.out.println();
        Notifier emailAndSMS=new SMSNotifierDecorator(new EmailNotifier());
        System.out.println("Email + SMS Notification:");
        emailAndSMS.send();
        System.out.println();
        Notifier emailSMSAndSlack=new SlackNotifierDecorator(new SMSNotifierDecorator(new EmailNotifier()));
        System.out.println("Email + SMS + Slack Notification:");
        emailSMSAndSlack.send();
    }
}
