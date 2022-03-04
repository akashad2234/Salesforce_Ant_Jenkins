public class Future_Example_1 {
    @future
    public static void call()
    {
        System.debug('Call 1');
        System.debug('Call 2');
        System.debug('Call 3');
    }
    @future
     public static void invoke()
    {
        System.debug('Invoke 1');
        System.debug('Invoke 2');
        System.debug('Invoke 3');
    }
    
    public void show(){
         
        System.debug('Show 1');
        System.debug('Show 2');
        call();
        System.debug('show 3');
        System.debug('show 4');
        invoke();
        System.debug('show 5');
        
    
    }

}