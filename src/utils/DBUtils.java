package utils;

import java.sql.DriverManager;
import java.sql.SQLException;
import com.mysql.jdbc.Connection;

public class DBUtils {
    
    /**
     * 获取数据库连接
     * @return Connection对象
     */
    public static Connection getConnection(){
        String dbUserName = System.getenv("DB_USER");
        String dbUserPasswd = System.getenv("DB_PASSWORD");
        String dbURL = System.getenv("DB_URL");
        
        if (dbUserName == null) dbUserName = "root";
        if (dbUserPasswd == null) dbUserPasswd = "HUyuan200475@";
        if (dbURL == null) {
            dbURL = "jdbc:mysql://localhost:3306/studentinfomanagement?"
                   + "user=" + dbUserName
                   + "&password=" + dbUserPasswd
                   + "&useUnicode=true&characterEncoding=utf8"
                   + "&useSSL=false";
        }
        
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection(dbURL, dbUserName, dbUserPasswd);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } 
        return conn;
    }
    
    /**
     * 关闭数据库连接
     * @param conn Connection对象
     */
    public static void closeConnection(Connection conn) {
        //判断conn是否为空
        if(conn != null){
            try {
                conn.close();//关闭数据库连接
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}