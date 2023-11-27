package items;

import database.DataBase;

import java.io.Serializable;
import java.util.ArrayList;

public class Account implements Serializable {
    public String username;
    public String email;
    public String password;
    public String cardId=" ";
    public double money=0;
    public boolean isSightAccount=false;
    public ArrayList<mineBook> purchasedBook;
    public ArrayList<mineBook> favoriteBook;
    public Account(){}
    public Account(String username,String email,String password){
        this.username=username;
        this.email=email;
        this.password=password;
        purchasedBook=new ArrayList<mineBook>();
        favoriteBook=new ArrayList<mineBook>();

    }

    @Override
    public String toString() {
        return username+email+password;
    }
}
