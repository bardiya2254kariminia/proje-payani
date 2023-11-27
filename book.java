package items;

import java.io.IOException;
import java.io.Serializable;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class book implements Serializable {
    public String name;
    public String genre;
    public String discription;
    public String  rate;
    public String  price;
    public String releaseDate;
    public List<String> comments;
    String bookID;

    public book(String id) throws IOException {
//        this.name=name;
//        this.author=author;
//        this.discription=discription;
//        this.price=price;
//        this.releaseDate=releaseDate;
        comments=new ArrayList<>();
        this.bookID=id;
        Path path= Paths.get("src/data/Books.txt");
        List<String> bookLines= Files.readAllLines(path);
        for(String line:bookLines){
            line=line.substring(0,line.length()-3);
            if(line.split(":")[0].equals(id)){
                this.name=line.split(",")[1];
                this.genre=line.split(",")[2];
                this.discription=line.split(",")[3];
                this.price=line.split(",")[4];
                this.releaseDate=line.split(",")[5];
            }
        }
        Path path2 = Paths.get("src/data/comments.txt");
        List<String> commentLines=Files.readAllLines(path2);
        for(String line:commentLines){
            if(line.split(":")[0].equals(id)){
                comments= Arrays.asList(line.split(":")[1].split(","));
            }
        }


    }
}
