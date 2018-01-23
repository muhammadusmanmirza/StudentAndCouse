public class EmailManager {
    
    Public static void sendMail(String address , String subject , String body){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toaddress = new String[] {address};
            mail.setToAddresses(toaddress);
            mail.setSubject(subject);
            mail.setPlainTextBody(body);
        Messaging.SendEmailResult[] result = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        inspectResults(result);
        
    }
    public static boolean inspectResults(Messaging.SendEmailResult[] result){
        boolean sendresult = true;
        for(Messaging.SendEmailResult res : result){
            if(res.isSuccess()){
                System.debug('Email Send Successful');
            }
            else{
                sendresult = false;
                System.debug('The Following Errors' + res.getErrors());
            }
        }
    return sendresult;
    }

}