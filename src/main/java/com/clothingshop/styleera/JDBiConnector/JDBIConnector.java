package com.clothingshop.styleera.JDBiConnector;

import com.clothingshop.styleera.model.Product;
import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.util.List;
import java.util.stream.Collectors;


public class JDBIConnector {
    public static Jdbi jdbi;

    public static Jdbi getJdbi(){
        if(jdbi == null){
            connect();
        }
        return jdbi;
    }

    private static void connect() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setUrl("jdbc:mysql://"+PropertyDB.HOST+":"+PropertyDB.PORT+"/"+PropertyDB.DBNAME);
        dataSource.setUser(PropertyDB.USERNAME);
        try{
            dataSource.setAutoReconnect(true);
            dataSource.setUseCompression(true);
        } catch (Exception e){
            throw new RuntimeException(e);
        }
        jdbi = jdbi.create(dataSource);
    }

    public static void main(String[] args) {

    }
}
