package items;

import java.io.IOException;
import java.io.Serializable;

public class mineBook extends book implements Serializable {
    public boolean isReaded;
    public boolean isFavorite;

    public mineBook(String id) throws IOException {
        super(id);
    }
}
