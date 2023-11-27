package network;

import controller.Controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;

public class ClientHandler extends Thread{
    private Socket socket;
    public ClientHandler(Socket socket){
        this.socket=socket;
    }

    @Override
    public void run() {
        try {
            DataInputStream dis=new DataInputStream(socket.getInputStream());
            DataOutputStream dos=new DataOutputStream(socket.getOutputStream());
            StringBuilder request= new StringBuilder();
            int c=dis.read();
            while(c!=0){

                request.append((char) c);
                c=dis.read();
            }
//            String str=dis.readUTF();
//            Scanner scanner=new Scanner(str);
            Scanner scanner=new Scanner(request.toString());
            String command=scanner.nextLine();
            String data =scanner.nextLine();
            String response= new Controller().run(command,data);
            System.out.println(response);

            dos.writeBytes(response);
//            dos.writeUTF(response);
            dos.flush();
            dis.close();
            dos.close();
//            scanner.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
