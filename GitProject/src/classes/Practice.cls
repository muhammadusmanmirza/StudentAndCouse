public class Practice {
    public static void func(){
        List<String> list1 = new List<String>{'Red','Blue','Green'};
        List<String> list2 = new List<String>();
         list2.add('Red');
         list2.add('Blue');
        String str1 = list1.get(0);
        String str2 = list2[0];
        System.assertEquals(str1, str2);
            for(Integer i=0; i<list1.size();i++)
     		   {
                System.debug(list1[i]);
                             } 
        }
            
      
    }