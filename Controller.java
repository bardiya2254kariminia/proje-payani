package controller;

import database.DataBase;
import items.Account;
import utills.Convertor;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Controller {
    public String  login (String data ) throws IOException {

        Map<String,String> map= Convertor.stringToMap(data);
        if(DataBase.getInstance().isLoginValid(map)==null){
            return "no";
        }
        return DataBase.getInstance().isLoginValid(map);
    }
    public String signup(String data) throws IOException {
        Map<String ,String > map=Convertor.stringToMap(data);
        if(DataBase.getInstance().isLoginValidforAllItems(map)==null){
            DataBase.getInstance().insertAccount(new Account(map.get("username"),map.get("email"),map.get("password")));
            return "yes";
        }
        return "no";
    }
    private String getBooksAndAudio(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        switch (map.get("genre")){
            case "all":{
                List<String> books=DataBase.getInstance().getAllBooksAndAudios(map);
                if(books.size()==0){
                    return "noBooksOrAudios";
                }
                return Convertor.listOfStringToString(books);
            }
            default:{
                List<String> books=DataBase.getInstance().getAllSpecifiedGenreBookOrAudios(map);
                if(books.size()==0){
                    return "noBooksOrAudios";
                }
                return Convertor.listOfStringToString(books);
            }

        }
    }
    private String getTop5(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        if(map.containsKey("genre")){
            List<String> books=DataBase.getInstance().getAllSpecifiedGenreBookOrAudios(map);
            books=books.stream().limit(5).collect(Collectors.toList());
            if(books.size()==0){
                return "noBooksOrAudios";
            }
            return Convertor.listOfStringToString(books);
        }else{
            //contains type
            switch (map.get("kind")){
                case "topSelling":{
                    List<String> books=DataBase.getInstance().getTop5Selling(map);
                    books=books.stream().limit(5).collect(Collectors.toList());
                    if(books.size()==0){
                        return "noBooksOrAudios";
                    }
                    return Convertor.listOfStringToString(books);
                }
                case "newRelease":{
                    List<String> books=DataBase.getInstance().getTop5NewReleased(map);
                    books=books.stream().limit(5).collect(Collectors.toList());
                    if(books.size()==0){
                        return "noBooksOrAudios";
                    }
                    return Convertor.listOfStringToString(books);
                }

            }
        }
        return "";
    }
    private String purchase(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        return DataBase.getInstance().purchaseBook(map);
    }
    private String addFavorite(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        return DataBase.getInstance().addFavorite(map);
    }
    private String changeAccountInfo(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);

        return DataBase.getInstance().changeAccountInfo(map);
    }

    private String addItem(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
            return DataBase.getInstance().addMoney(map);
    }

    private String addSightAccount(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        return DataBase.getInstance().addSightAccount(map);
    }

    private String submitComment(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        map.put("message",Convertor.MultipleLinesToString(map.get("message")));
        return DataBase.getInstance().submitComment(map);
    }
    private String getComments(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        String result= Convertor.listOfStringToString(DataBase.getInstance().getComments(map));
        if(result.length()>=4){
            return result;
        }else{
            return "no comments";
        }
    }
    private String getFavorites(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        String result= Convertor.listOfStringToString(DataBase.getInstance().getFavorites(map));
        if(result.equals(" ")){
            return "nothing found";
        }
        return result;
    }

    private String getPurchased(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        String result= Convertor.listOfStringToString(DataBase.getInstance().getPurchased(map));
        if(result.equals(" ")){
            return "nothing found";
        }
        return result;
    }
    private String removeFavorite(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        return DataBase.getInstance().removeFavorite(map);
    }

    private String addReadLater(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        return DataBase.getInstance().addReadLater(map);
    }

    private String removeReadLater(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        return DataBase.getInstance().removeReadLater(map);
    }

    private String getReadLater(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        String result= Convertor.listOfStringToString(DataBase.getInstance().getReadLater(map));
        if(result.equals(" ")){
            return "nothing found";
        }
        return result;
    }
    public String run(String command,String data) throws IOException {
//        System.out.println(command);
        switch (command){
            case "login":{
                return login(data);
            }
            case "signup":{
              return signup(data);
            }
            case "getBookAndAudio":{
                return getBooksAndAudio(data);
            }
            case "getTop5":{
                return getTop5(data);
            }
            case "purchase":{
                return purchase(data);

            }
            case "addFavorite":{
                return addFavorite(data);
            }
            case "getFavorite":{
                return getFavorites(data);
            }
            case "getPurchased":{
                return getPurchased(data);
            }
            case "changeAccountInfo":{
                return changeAccountInfo(data);
            }
            case "addMoney":{
                return addItem(data);
            }
            case "addSightAccount":{
                return addSightAccount(data);
            }
            case "submitComment":{
                return submitComment(data);
            }
            case "getComment":{
                return getComments(data);
            }
            case "removeFavorite":{
                return removeFavorite(data);
            }
            case "addReadLater":{
                return addReadLater(data);
            }
            case "removeReadLater":{
                return removeReadLater(data);
            }
            case "getReadLater":{
                return getReadLater(data);
            }
        }
        return "";
    }



}
//getBooks
//genre:all  ya genre:Romance ya books
//top5
//genre:Romance ya type:(masalan))Trends
//purchase
//username:...,email:...,password:...,book:shomarash