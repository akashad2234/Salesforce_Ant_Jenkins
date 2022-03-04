public class ListClass {
    public static void myMethod()
    {
        List<List<Integer>> lList = new  List<List<Integer>>();
List<Integer> l1 = new List<Integer>{11,20,33};
List<Integer> l2 = new List<Integer>{12,40,22};
List<Integer> l3 = new List<Integer>{13,50,11};
lList.add(l1);
lList.add(l2);
lList.add(l3); 
        
        System.debug(lList);
        
   List<String> nameList = new String[4];
        nameList[0]='Bhavaya';
        nameList[1]='Bhavna';
        nameList[2]='Swati';
        Integer listSize= nameList.size();
        System.debug(nameList[0]);
        System.debug(listSize);
        

    }

}