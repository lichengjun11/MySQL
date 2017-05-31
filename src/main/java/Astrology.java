import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedHashMap;
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


     public static void main(String[] args) throws SQLException {
        Map<String,String> map = new LinkedHashMap<>();
        map.put("白羊座", "0321 0420");
        map.put("金牛座", "0421 0521");
        map.put("双子座", "0522 0622");
        map.put("巨蟹座", "0623 0723");
        map.put("狮子座", "0724 0823");
        map.put("处女座", "0824 0922");
        map.put("天秤座", "0923 1023");
        map.put("天蝎座", "1024 1121");
        map.put("射手座", "1122 1220");
        map.put("摩羯座1", "1221 1231");
        map.put("摩羯座2", "0101 0120");
        map.put("水瓶座", "0121 0219");
        map.put("双鱼座", "0220 0320");

//        hashtable.put("1223","0121");

        new Driver();
        java.sql.Connection connection = DriverManager.getConnection(URL);
        PreparedStatement PreparedStatement = connection.prepareStatement(SQL);
        for (Map.Entry<String, String> entry : map.entrySet()) {
            String from  = entry.getValue().split(" ")[0];
            String to  = entry.getValue().split(" ")[1];
            PreparedStatement.setString(1, from);
            PreparedStatement.setString(2, to);
            // 执行一次查询，返回一次结果集
            ResultSet ResultSet = PreparedStatement.executeQuery();
            ResultSet.next();
            System.out.println(entry.getKey() +"\t" +  ResultSet.getInt(1));
            ResultSet.close();
        }
        PreparedStatement.close();
        connection.close();
    }
}
