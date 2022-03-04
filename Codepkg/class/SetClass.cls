public class SetClass {
    public static void myMethod()
    {
        Set<String> s = new Set<String> ();
    s.add('abc');
    s.add('cba');
    System.debug(s);
        List<String> l = new List<String>();
        l.add('abc');
        l.add('DEF');
        s.addAll(l);
        System.debug(s);
       // s.clear();
        //System.debug(s.addAll(l));
        Set<String> s2 = s.clone();
        System.debug(s2);
      Boolean result = s.contains('abc');
        System.debug(result);
       Boolean result2 = s.containsAll(l);
        System.debug(result2);
        System.debug(s.size());
        
        s.add('ghi');
        System.debug(s);
        s.retainAll(l);
        System.debug(s);
    
    }

}