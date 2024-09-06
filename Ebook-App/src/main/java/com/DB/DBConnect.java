package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    private static Connection conn;

    public static Connection getConn() {
        try {
            // Load the JDBC driver for SQL Server
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Connect to the MSSQL database
            String jdbcUrl = "jdbc:sqlserver://localhost:1433;databaseName=EBOOK_WEB";
            String username = "sa";
            String password = "123456";
            conn = DriverManager.getConnection(jdbcUrl, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }
}
