
package calculatrice;

import java.util.HashMap;
import java.util.ArrayList;

public class Calculatrice{

    private HashMap<String,Integer> symboleTable ;
    private HashMap<String,ArrayList<Integer>> symboleTableTab;


   public Calculatrice(){
    symboleTable = new HashMap<String,Integer>();
    symboleTableTab = new HashMap<String,ArrayList<Integer>>();
   }

   public String toStringTab(ArrayList<Integer> tableau) {

      String tab = "Tableau [";
      if (tableau.size() !=0)
        tab = tab + tableau.get(0);
        for(int i=1; i<tableau.size(); i++){
            tab = tab +", " + tableau.get(i) ;
        }
        tab = tab + "]";
      return tab;
   }

   public String toStringFromSymbolVar(String key) {
      if(symboleTable.get(key)==null) return "null";
      String affect = key + " = Entier " + symboleTable.get(key);
      return affect;
   }

   public String toStringFromSymbolTab(String key) {
      if(symboleTableTab.get(key).size()==0) return "null";
      String affect = key + " = " + toStringTab(symboleTableTab.get(key));
      return affect;
   }

   public void print(){
        System.out.println("les valeurs des variables sont :");
        for (String s : this.symboleTable.keySet()) {
            System.out.println(toStringFromSymbolVar(s));
        }
        for (String s : this.symboleTableTab.keySet()) {
            System.out.println(toStringFromSymbolTab(s));
        }
    }  
    
    public HashMap<String,ArrayList<Integer>> getSymboleTableTab(){
        return this.symboleTableTab;
    }

    public HashMap<String,Integer> getSymboleTable(){
        return this.symboleTable;
    }
 }





