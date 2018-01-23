trigger ClosedOpportunityTrigger on Opportunity (after insert,after Update) {

   
    List<Task> objTask = new List<Task>();
    for(Opportunity op : Trigger.New)
    {
        if(op.StageName =='Close Won'){
            Task t=new Task (Subject='Follow Up Test Task',WhatId = op.Id);
            ObjTask.add(t);
        }
    }
    
        insert ObjTask;
    
}