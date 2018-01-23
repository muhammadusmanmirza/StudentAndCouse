trigger AddRelatedRecord on Account (after insert , after update) {

    List<Opportunity> oppList = new List<Opportunity>();
    Map<Id,Account> acctWithOpps = new Map<Id,Account>(
    [Select id , (select id from Opportunities) from Account where Id IN : Trigger.New]);
    
    for(Account a : Trigger.New){
        
        System.debug('acctsWithOpps.get(a.Id).Opportunities.size()='+ acctWithOpps.get(a.Id).Opportunities.size());
        if(acctWithOpps.get(a.Id).Opportunities.size()==0){
            
            oppList.add(new Opportunity(Name = a.Name+'Opportunity',
                                       StageName = 'Propecting',
                                       CloseDate = System.today().addMonths(1),
                                        AccountId = a.Id));}
                        
                        
    }
   if(oppList.size()>0)
   {
       insert oppList;
   }
}