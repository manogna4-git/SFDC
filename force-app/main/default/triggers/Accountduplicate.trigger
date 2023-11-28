trigger Accountduplicate on Account (before insert,before update) {
    for(Account a:Trigger.New){
        List<Account> acc = [select id, name from Account where name=: a.name];
        if(acc.size()>0){
            a.name.addError('duplicate record found');
        }
    }
}