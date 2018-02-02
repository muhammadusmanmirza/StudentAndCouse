trigger SendEmail on Course__c (after Insert) {

    StudentClass Obje = new StudentClass();
    obje.sendMail('usman786424143@gmail.com','This Mail send From Trigger', 'Hello World') ;   

}