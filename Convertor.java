package utills;

import items.Account;
import items.mineBook;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class Convertor {
    public static Map<String,String> stringToMap(String str){
        Map<String,String> result=new HashMap<>();

        for(String s:str.split(",")){
            result.put(s.split(":")[0],s.split(":")[1]);
        }
        return result;
    }
    public static String AccountToMapID(Account account){
        StringBuilder result=new StringBuilder();
        result.append(account.username).append(",");
        result.append(account.email).append(",");
        result.append(account.password).append(",");
        return result.toString();
    }
    public static String listOfStringToString(List<String> list){

        StringBuilder stringBuilder=new StringBuilder();
        if(list.size()==0){
            return "nothing to show";
        }
        stringBuilder.append(list.get(0));
        for(int i=1;i<list.size();i++){
            stringBuilder.append("\n");
            stringBuilder.append(list.get(i));
        }
        return stringBuilder.toString();
    }
    public static String MultipleLinesToString(String line){
        Scanner scanner=new Scanner(line);
        String result="";
        while(scanner.hasNextLine()){
            if(result.length()==0){
                result+=scanner.nextLine();
            }else{
                result +="(\\n)";
                result +=scanner.nextLine();
            }
        }
        return result;
    }

}
