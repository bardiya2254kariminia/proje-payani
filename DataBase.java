package database;

import items.Account;
import items.book;
import utills.Convertor;

import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;

public class DataBase {
    private static DataBase instance = null;

    private DataBase() {
    }

    public static DataBase getInstance() {
        if (instance == null) {
            instance = new DataBase();
        }
        return instance;
    }

    public String isLoginValid(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        if (lines.size() == 0) {
            return null;
        }
        for (String line : lines) {
            if ((line.split(",")[0].equals(map.get("username")) || line.split(",")[1].equals(map.get("username")) && map.get("password").equals(line.split(",")[2]))) {
                return line;
            }
        }
        return null;
    }

    public void insertAccount(Account account) throws IOException {
        FileWriter fileWriter = new FileWriter("src/data/Accounts.txt", true);
        if (Files.readAllLines(Paths.get("src/data/Accounts.txt")).size() != 0) {
            fileWriter.write("\n");
        }
        fileWriter.write(account.username + "," + account.email + "," + account.password + "," + account.cardId + "," + account.money + "," + account.isSightAccount + ", , ,");

        fileWriter.close();

    }

    public List<String> getAllBooksAndAudios(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/Books.txt");

        List<String> list = Files.readAllLines(path);
        return list.stream().filter((a) -> a.split(":")[0].startsWith(map.get("type"))).collect(Collectors.toList());
    }

    public List<String> getAllSpecifiedGenreBookOrAudios(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/Books.txt");
        List<String> lines = Files.readAllLines(path).stream().filter((a) -> a.split(",")[1].equals(map.get("genre")) && a.split(":")[0].startsWith(map.get("type"))).collect(Collectors.toList());
        return lines;
    }

    public List<String> getTop5Selling(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/Books.txt");
        return Files.readAllLines(path).stream().filter((a) -> a.split(":")[0].startsWith(map.get("type"))).sorted((a, b) -> {
            if (Double.parseDouble(a.split(",")[3]) - Double.parseDouble(b.split(",")[3]) < 0) {
                return 1;
            } else if (Double.parseDouble(a.split(",")[3]) - Double.parseDouble(b.split(",")[3]) > 0) {
                return -1;
            } else {
                return 0;
            }
        }).limit(5).collect(Collectors.toList());
    }

    public List<String> getTop5NewReleased(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/Books.txt");
        return Files.readAllLines(path).stream().filter((a) -> a.split(":")[0].startsWith(map.get("type"))).sorted((a, b) -> {
            int as = Integer.parseInt(a.split(",")[5].replaceAll("-", ""));
            int bs = Integer.parseInt(b.split(",")[5].replaceAll("-", ""));
            if (as < bs) {
                return 1;
            } else if (as > bs) {
                return -1;
            } else {
                return 0;
            }
        }).limit(5).collect(Collectors.toList());

    }

    public String purchaseBook(Map<String, String> map) throws IOException {

        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        String hold = null;
        for (int i = 0; i < lines.size(); i++) {
            if ((lines.get(i).split(",")[0].equals(map.get("username")) && lines.get(i).split(",")[1].equals(map.get("email")) && map.get("password").equals(lines.get(i).split(",")[2]))) {
                hold = lines.get(i);
                String hold1 = hold.split(",")[6];
                if (hold1.equals(" ")) {
                    hold1 = map.get("book");
                } else {
                    hold1 = hold1 + "-" + map.get("book");
                }
//                System.out.println(hold1+"::::::::::::::::::::");
                List<String> books = Files.readAllLines(Paths.get("src/data/Books.txt"));
                String price = null;
                for (String book : books) {
                    if (book.split(":")[0].equals(map.get("book"))) {
                        price = book.split(":")[1].split(",")[4];
//                        System.out.println("_-------------"+price);
                        if (Double.parseDouble(price) > Double.parseDouble(hold.split(",")[4])) {
                            return "not Enough Money";
                        }
                        String sos = String.valueOf(-Double.parseDouble(price) + Double.parseDouble(hold.split(",")[4]));
                        String w = hold.split(",")[0] + "," + hold.split(",")[1] + "," + hold.split(",")[2] + "," + hold.split(",")[3] + "," + String.valueOf(-Double.parseDouble(price) + Double.parseDouble(hold.split(",")[4])) + "," + hold.split(",")[5] + "," + hold1.replaceAll(" ", "") + "," + hold.split(",")[7] + ",";
                        lines.set(i, w);
                        Files.write(path, lines);
                        return sos;
                    }
                }
                return "bookOrAudio not found";
            }
        }
        return "user not found";
    }

    public String addFavorite(Map<String, String> map) throws IOException {
        String person = isLoginValidforAllItems(map);
        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        String hold = null;
        for (int i = 0; i < lines.size(); i++) {
            if ((lines.get(i).split(",")[0].equals(map.get("username")) && lines.get(i).split(",")[1].equals(map.get("email")) && map.get("password").equals(lines.get(i).split(",")[2]))) {
                hold = lines.get(i);
                String hold1 = hold.split(",")[7];
                if (hold1.equals(" ")) {
                    hold1 = map.get("book");
                } else {
                    hold1 = hold1 + "-" + map.get("book");
                }
                String w = hold.split(",")[0] + "," + hold.split(",")[1] + "," + hold.split(",")[2] + "," + hold.split(",")[3] + "," + hold.split(",")[4] + "," + hold.split(",")[5] + "," + lines.get(i).split(",")[6] + "," + hold1.replaceAll(" ", "") + ",";
                lines.set(i, w);
                Files.write(path, lines);
                return "sucsessfuly submitted";

            }
        }
        return "user not found";


    }

    public String changeAccountInfo(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        Map<String, String> isvalid = new HashMap<>();
        isvalid.put("username", map.get("username"));
        isvalid.put("email", map.get("email"));
        isvalid.put("password", map.get("password"));
        if (isLoginValidforAllItems(isvalid) == null) {
            for (int i = 0; i < lines.size(); i++) {
                if (lines.get(i).split(",")[0].equals(map.get("lastUsername")) && lines.get(i).split(",")[1].equals(map.get("lastEmail")) && lines.get(i).split(",")[2].equals(map.get("lastPassword"))) {
                    String hold = map.get("username") + "," + map.get("email") + "," + map.get("password") + "," + lines.get(i).split(",")[3] + "," + lines.get(i).split(",")[4] + "," + lines.get(i).split(",")[5] + "," + lines.get(i).split(",")[6] + "," + lines.get(i).split(",")[7] + ",";
                    lines.set(i, hold);
                    break;
                }
            }
            Files.write(path, lines);
            return "yes";
        }
        return "no";
    }

    public String addMoney(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        Map<String, String> isvalid = new HashMap<>();
        isvalid.put("username", map.get("username"));
        isvalid.put("email", map.get("email"));
        isvalid.put("password", map.get("password"));
        String person = isLoginValidforAllItems(isvalid);
        String javab = null;
        if (person != null) {
            for (int i = 0; i < lines.size(); i++) {
                if (lines.get(i).split(",")[0].equals(map.get("username")) && lines.get(i).split(",")[1].equals(map.get("email")) && lines.get(i).split(",")[2].equals(map.get("password"))) {
                    String hold = lines.get(i).split(",")[0] + "," + lines.get(i).split(",")[1] + "," + lines.get(i).split(",")[2] + "," + lines.get(i).split(",")[3] + "," + String.valueOf(Double.parseDouble(lines.get(i).split(",")[4]) + Double.parseDouble(map.get("money"))) + "," + lines.get(i).split(",")[5] + "," + lines.get(i).split(",")[6] + "," + lines.get(i).split(",")[7] + ",";
                    System.out.println(Double.parseDouble(map.get("money")));
                    javab = String.valueOf(Double.parseDouble(lines.get(i).split(",")[4]) + Double.parseDouble(map.get("money")));
                    lines.set(i, hold);
                    break;
                }
            }
            Files.write(path, lines);
            return javab;
        }
        return "no";
    }

    public String addSightAccount(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        String person = isLoginValidforAllItems(map);
        if (person != null) {
            for (int i = 0; i < lines.size(); i++) {
                if (lines.get(i).split(",")[0].equals(map.get("username")) && lines.get(i).split(",")[1].equals(map.get("email")) && lines.get(i).split(",")[2].equals(map.get("password"))) {
                    if (lines.get(i).split(",")[5].equals("true")) {
                        return "You already have Sight Account";
                    }
                    if (Double.parseDouble(lines.get(i).split(",")[4]) < 1000) {
                        return "not Enought Money";
                    }

                    String hold = lines.get(i).split(",")[0] + "," + lines.get(i).split(",")[1] + "," + lines.get(i).split(",")[2] + "," + lines.get(i).split(",")[3] + "," + String.valueOf(Double.parseDouble(lines.get(i).split(",")[4]) - 1000) + ",true," + lines.get(i).split(",")[6] + "," + lines.get(i).split(",")[7] + ",";
                    lines.set(i, hold);
                    break;
                }
            }
            Files.write(path, lines);
            return "succssefully submited";
        }
        return "user not found";
    }

    public String submitComment(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/comments.txt");
        List<String> lines = Files.readAllLines(path);
//        for(int i=0;i<lines.size();i++){
//            if(lines.get(i).split(":")[0].equals(map.get("book"))){
//                String hold= lines.get(i);
//                if(hold.split(":")[1].equals(";")){
//                    hold=hold.split(":")[0]+":"+map.get("username")+","+map.get("rating")+","+map.get("message")+";";
//                }else{
//                    hold=(hold+map.get("username")+","+map.get("rating")+","+map.get("message")+";");
//                }
//                System.out.println(hold);
//                lines.set(i,hold);
//                Files.write(path,lines);
//            }
//        }
//        return "book not found";
        String hold = map.get("book") + ":" + map.get("username") + "," + map.get("rating") + "," + map.get("message");
        lines.add(hold);
        Files.write(path, lines);
        return hold;
    }

    public List<String> getComments(Map<String, String> map) throws IOException {
        List<String> comments = new ArrayList<>();
        Path path = Paths.get("src/data/comments.txt");
        List<String> lines = Files.readAllLines(path);
        for (String line : lines) {
            if (line.split(":")[0].equals(map.get("book"))) {
                comments.add(line);
            }
        }

        return comments;
    }

    public List<String> getFavorites(Map<String, String> map) throws IOException {
        String person = isLoginValidforAllItems(map);
        List<String> list = new ArrayList<>();
        list.addAll(Arrays.asList(person.split(",")[7].split("-")));
        return list;
    }

    public List<String> getPurchased(Map<String, String> map) throws IOException {
        String person = isLoginValidforAllItems(map);
        List<String> list = new ArrayList<>();
        list.addAll(Arrays.asList(person.split(",")[6].split("-")));
        return list;
    }

    public String isLoginValidforAllItems(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        if (lines.size() == 0) {
            return null;
        }
        for (String line : lines) {
            if ((line.split(",")[0].equals(map.get("username")) && line.split(",")[1].equals(map.get("email")) && map.get("password").equals(line.split(",")[2]))) {
                return line;
            }
        }
        return null;
    }

    public String removeFavorite(Map<String, String> map) throws IOException {
        String person = isLoginValidforAllItems(map);
        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        String hold = null;
        for (int i = 0; i < lines.size(); i++) {
            if ((lines.get(i).split(",")[0].equals(map.get("username")) && lines.get(i).split(",")[1].equals(map.get("email")) && map.get("password").equals(lines.get(i).split(",")[2]))) {
                hold = lines.get(i);
                String hold1 = hold.split(",")[7];
                hold1 = hold1.replace(map.get("book"), "");
                if (hold1.endsWith("-")) {
                    hold1 = hold1.substring(0, hold1.length() - 1);
                }
                if (hold1.contains("--")) {
                    hold1 = hold1.replaceAll("--", "-");
                }
                if (hold1.equals("")) {
                    hold1 = " ";
                }
                String w = hold.split(",")[0] + "," + hold.split(",")[1] + "," + hold.split(",")[2] + "," + hold.split(",")[3] + "," + hold.split(",")[4] + "," + hold.split(",")[5] + "," + lines.get(i).split(",")[6] + "," + hold1 + ",";
                lines.set(i, w);
                Files.write(path, lines);
                return "sucsessfuly submitted";

            }
        }
        return "user not found";


    }

    public String addReadLater(Map<String, String> map) throws IOException {
        String person = isLoginValidforAllItems(map);
        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        String hold = null;
        for (int i = 0; i < lines.size(); i++) {
            if ((lines.get(i).split(",")[0].equals(map.get("username")) && lines.get(i).split(",")[1].equals(map.get("email")) && map.get("password").equals(lines.get(i).split(",")[2]))) {
                hold = lines.get(i);
                String hold1 = hold.split(",")[3];
                if (hold1.equals(" ")) {
                    hold1 = map.get("book");
                } else {
                    hold1 = hold1 + "-" + map.get("book");
                }
                String w = hold.split(",")[0] + "," + hold.split(",")[1] + "," + hold.split(",")[2] + "," + hold1.replaceAll(" ", "")  + "," + hold.split(",")[4] + "," + hold.split(",")[5] + "," + lines.get(i).split(",")[6] + ","  + lines.get(i).split(",")[6] + ",";
                lines.set(i, w);
                Files.write(path, lines);
                return "sucsessfuly submitted";

            }
        }
        return "user not found";


    }

    public String removeReadLater(Map<String, String> map) throws IOException {
        String person = isLoginValidforAllItems(map);
        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        String hold = null;
        for (int i = 0; i < lines.size(); i++) {
            if ((lines.get(i).split(",")[0].equals(map.get("username")) && lines.get(i).split(",")[1].equals(map.get("email")) && map.get("password").equals(lines.get(i).split(",")[2]))) {
                hold = lines.get(i);
                String hold1 = hold.split(",")[3];
                hold1 = hold1.replace(map.get("book"), "");
                if (hold1.endsWith("-")) {
                    hold1 = hold1.substring(0, hold1.length() - 1);
                }
                if (hold1.contains("--")) {
                    hold1 = hold1.replaceAll("--", "-");
                }
                if (hold1.equals("")) {
                    hold1 = " ";
                }
                String w = hold.split(",")[0] + "," + hold.split(",")[1] + "," + hold.split(",")[2] + "," + hold1+ "," + hold.split(",")[4] + "," + hold.split(",")[5] + "," + lines.get(i).split(",")[6] + "," +  hold.split(",")[7] + ",";
                lines.set(i, w);
                Files.write(path, lines);
                return "sucsessfuly submitted";

            }
        }
        return "user not found";


    }

    public List<String> getReadLater(Map<String, String> map) throws IOException {
        String person = isLoginValidforAllItems(map);
        List<String> list = new ArrayList<>();
        list.addAll(Arrays.asList(person.split(",")[3].split("-")));
        return list;
    }
}
