package ru.lkodos.util;

import lombok.SneakyThrows;
import lombok.experimental.UtilityClass;

import java.sql.Connection;
import java.sql.DriverManager;

@UtilityClass
public class ConnectionManager {

    private static final String URL = "db.url";
    private static final String DRIVER = "db.driver";

    static {
        loadDriver();
    }

    @SneakyThrows
    public static Connection getConnection() {
        return DriverManager.getConnection(PropertiesUtil.getProperties(URL));
    }

    @SneakyThrows
    private static void loadDriver() {
        Class.forName(PropertiesUtil.getProperties(DRIVER));
    }
}