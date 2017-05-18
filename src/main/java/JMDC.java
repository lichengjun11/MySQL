import com.mysql.jdbc.Driver;

import java.sql.SQLException;

/**
 * Created by lichengjun
 * on 2017/5/16.
 */

public class JMDC {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/";
    private static final String USER = "root";
    private static final String PASSWORD = "system";
    private static final String SQL = "INSERT INTO db_1702.course VALUES (NULL,'JS',2)";
    public static void main(String[] args) throws SQLException {
        // 1 准备数据库驱动
        new Driver();

        // 2 取得一次数据库连接
//        Connection connection = DriverManager.getConnection();

        // 3 欲编译语句
//        PreparedStatement preparedStatement = connection.prepareStatement()

                // 4 执行语句

    }
}
