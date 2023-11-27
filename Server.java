package network;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {

    public void start() throws IOException {
        try(ServerSocket server=new ServerSocket(8000);){
            while(true){
                Socket socket=server.accept();
                new ClientHandler(socket).start();
            }
        }catch (Exception e){

        }
    }
}
