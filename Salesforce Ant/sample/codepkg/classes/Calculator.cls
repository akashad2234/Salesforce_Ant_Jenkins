public class Calculator {
 public Decimal amount {set;get;}
    public Decimal year {set;get;}
    public Decimal rate {set;get;}
    public Decimal intrest {set;get;}
    
    public Calculator(){
        amount =5000;
        rate=10;
        year=1;
        
    }
    public void oneYear(){
        intrest =(amount*year*rate)/100;
    }
    public void twoYear(){
        year=2;
        intrest =(amount*year*rate)/100;
    }
    
}