public class Mixed_DML {

    public  void call(){
        Profile p=[select id from profile where name='MyProfile'];
        UserRole r =[select id from UserRole where name ='coo'];
        
        User u = new User(alias='viki' ,email='salesforcebatch3@gmail.com',
        emailencodingkey='UTF-8' ,lastname ='BN',
        languagelocalekey='en_US',localesidkey='en_US',profileid=p.Id ,userroleid=r.Id,
         timezonesidkey='America/Los_Angeles',                 
        username='vikram@322.com');
        insert u;
        invoke();
            
    }
    
    @future
    public static void invoke(){
        Account acc = new Account();
        acc.Name='Testing DML';
        acc.Phone='235897';
        insert acc;
    }
    
}