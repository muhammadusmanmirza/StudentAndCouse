trigger SoqlTriggerNotBulk on Account (after update) {
    for(Account a : Trigger.New){
        Opportunity[] oppr = [Select id , Name ,CloseDate 
                             From Opportunity
                             where AccountId =:a.Id];
    }
}