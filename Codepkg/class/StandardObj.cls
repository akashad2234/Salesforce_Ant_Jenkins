public class StandardObj 
{
    public static void myMethod()
    {
       // Account acc =new Account(Name = 'Disney');
        //insert acc;
        
        sObject s  = new Account();
        s.put('Name','Cyntexa Labs');
            
            Object obj = s.get('Name');
        System.debug(obj); 
          decimal d = 1.233;
          integer i = (integer)d; 
        System.debug(d);
        
        
    }
    
}