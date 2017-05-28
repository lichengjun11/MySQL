import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

/**
 * Created by lichengjun on 2017/5/28.
 */
public class Astrology {
    private static final String URL = "jdbc:mysql:///?user=root&password=system";
    private static final String SQL =
            "SELECT count(*)" +
                    " FROM db_1702.v_password" +
                    " WHERE substr(password, 5, 4) BETWEEN ? AND ?";
    static Hashtable<String, String> hashtable;

     public static void main(String[] args) throws SQLException {
        hashtable = new Hashtable<>();
        hashtable.put("0321", "0420");
        hashtable.put("0421", "0521");
        hashtable.put("0522", "0622");
        hashtable.put("0623", "0723");
        hashtable.put("0724", "0823");
        hashtable.put("0824", "0923");
        hashtable.put("0924", "1024");
        hashtable.put("1025", "1123");
        hashtable.put("1124", "1222");
//        hashtable.put("1223","0121");
        hashtable.put("0122", "0320");

        new Driver();
        java.sql.Connection connection = DriverManager.getConnection(URL);
        PreparedStatement PreparedStatement = connection.prepareStatement(SQL);
        for (Map.Entry<String, String> entry : hashtable.entrySet()) {
            PreparedStatement.setString(1, entry.getKey());
            PreparedStatement.setString(2, entry.getValue());
            // 执行一次查询，返回一次结果集
            ResultSet ResultSet = PreparedStatement.executeQuery();
            ResultSet.next();
            System.out.println(ResultSet.getInt(1));
            ResultSet.close();
        }
        PreparedStatement.close();
        connection.close();
    }
}
