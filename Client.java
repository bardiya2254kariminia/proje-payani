import network.Server;

import java.io.*;
import java.net.Socket;
import java.util.Formatter;
import java.util.Scanner;

public class Client {
    public static void main(String[] args) throws IOException {
//        new Server().start();
        Socket socket=new Socket("127.0.0.1",8000);
        DataOutputStream dos=new DataOutputStream(socket.getOutputStream());
        DataInputStream dis=new DataInputStream(socket.getInputStream());
//        dos.writeUTF("");
//        dos.flush();
        dos.writeUTF("getTop5\nusername:salmanian,email:@gmail.com,password:aA111111,genre:Science Fiction,type:a");
        dos.flush();
        System.out.println(dis.readUTF());
//        System.out.println(dis.readUTF());
        socket.close();
        dos.close();
        dos.close();
    }
}


//getAllTickets\n
//username:abtin,email:---,password:---