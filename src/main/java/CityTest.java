import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * Created by lichengjun on 2017/5/29.
 */

// ip 数据库  城市 经纬度 数据库
    // 1 查询所有的城市
    // 2 查每个城市的ip数量
    // 3 更新 city 表的 count
    // 4 查询 city 表，格式化 输出data
public class CityTest {

    private static final String URL = "jdbc:mysql:///?user=root&password=system";
    private static final String SQL_COUNT = "SELECT count(*) FROM db_1702.ip WHERE geo REGEXP ?";
    private static final String SQL_CITY = "SELECT id, city FROM  db_1702.city";
    private static final String SQL_UPDATE = "UPDATE db_1702.city SET count = ? WHERE id = ?";
    private static final String SQL_QUERY = "SELECT * FROM db_1702.city ORDER BY count DESC";
    private static Map<Integer, String> cities = new LinkedHashMap<>();


    public static void main(String[] args) throws SQLException {
        new Driver();
        java.sql.Connection connection = DriverManager.getConnection(URL);
        // 1. 查所有的城市
        PreparedStatement preparedStatement = connection.prepareStatement(SQL_CITY);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String city = resultSet.getString("city");
            cities.put(id, city);
        }

        resultSet.close();

        connection.setAutoCommit(false);
        PreparedStatement statement = null;
        // 2. 查每一个城市的 ip 的数量
        for (Map.Entry<Integer, String> entry : cities.entrySet()) {
            preparedStatement = connection.prepareStatement(SQL_COUNT);
            preparedStatement.setString(1, entry.getValue());
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);
            int id = entry.getKey();
            // 3. 更行 city 表的 count 字段
            statement = connection.prepareStatement(SQL_UPDATE);
            statement.setInt(1, count);
            statement.setInt(2, id);
            preparedStatement.addBatch();
        }
        if (statement != null) {
            statement.executeBatch();
            connection.commit();
            statement.close();
        }

        // 4. 查询 city 表，存储格式化 data
        preparedStatement = connection.prepareStatement(SQL_QUERY);
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter("data/output.txt", true))) {
                String city = resultSet.getString("city");
                String lon = resultSet.getString("lon");
                String lat = resultSet.getString("lat");
                int count = resultSet.getInt("count");
                String data = "{name: '" + city + "', value: [" + lon + ", " + lat + ", " + count + "]},";
                try {
                    bufferedWriter.write(data + "\n");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}