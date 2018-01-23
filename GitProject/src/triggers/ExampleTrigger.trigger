trigger ExampleTrigger on Contact (after insert, after delete) {
    if(Trigger.isInsert){
        Integer recordCount = Trigger.New.Size();
        EmailManager.sendMail('usman786424143@gmail.com','Trail Head Trigger Example', recordCount+'Contactwere Inserted');
    }
    else if(Trigger.isDelete){
        
    }

}