trigger AccountDeletion on Account (before insert) {
    
    for(Account a : [Select id from account
                    where id in (Select AccountId from Opportunity
                                ) And Id in : Trigger.old]){
                                    Trigger.OldMap.get(a.id).addError('Cannot delete Account with related Oppotunity');
                                }

}