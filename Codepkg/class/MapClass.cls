public class MapClass 
{
     public static void myMethod()
     {
         Map<Integer,String> m =new Map<Integer,String>();
         m.put(1,'Bhavna');
         m.put(2,'Sapna');
         m.put(3,'Divya');
         m.put(4,'Bhavya');
         m.put(3,'Divya');
         System.debug(m);
         
         Map<Integer,String> n =new Map<Integer,String>();
         m.put(3,'Divya');
         m.put(4,'Bhavya');
        // m.put(5,'Avay');
         m.putAll(n);
         System.debug(m);
         System.debug(m.get(1));
         
         List<String> l = new List<String>();
         l=m.values();
         System.debug(l);
         
         Map<Integer,String> o =new Map<Integer,String>();
         o=m.clone();
         System.debug(o);
         System.debug(m.keySet());
         
         
     }

}