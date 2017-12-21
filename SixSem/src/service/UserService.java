package service;

import domains.User;
import utils.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Nikita on 8/25/16.
 */
public class UserService {
    public User getUser(String name, String password) {
        User user = null;
        try {
            String query = "select * from user where username=? and password=?";
            PreparedStatement pstm = new DatabaseConnection().getPreparedStatement(query);
            pstm.setString(1, name);
            pstm.setString(2, password);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;


    }

    public List<User> getUserList(){
        List<User> userList = new ArrayList<>();
        try {
            String query = "select * from user";
            PreparedStatement pstm = new DatabaseConnection().getPreparedStatement(query);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
               User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                userList.add(user);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(userList);
        return userList;
    }

    public User editUser(int id){
        User user = null;
        try {
            String query = "select * from user where id=?";
            PreparedStatement pstm = new DatabaseConnection().getPreparedStatement(query);
            pstm.setString(1, String.valueOf(id));
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(int id, String username, String password, String role){
        int result = 0;
        try {
            String query = "update user set username=?,password=?,role=? where id=?";
            PreparedStatement pstm = new DatabaseConnection().getPreparedStatement(query);
            pstm.setString(1, username);
            pstm.setString(2, password);
            pstm.setString(3,role);
            pstm.setInt(4, id);
            result = pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (result != 0){
            return true;
        }
        else {
            return false;
        }


    }

    public boolean deleteUser(int id){
        boolean ret = false;
        try {
            String query = "delete from user where id=?";
            PreparedStatement pstm = new DatabaseConnection().getPreparedStatement(query);
            pstm.setString(1, String.valueOf(id));
            ret = pstm.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(!ret){
            return true;
        }
        else {
            return false;
        }
    }

    public boolean createUser (String username, String password, String role){
        boolean ret = false;
        try {
            String query = "insert into user(username,password,role) values (?,?,?)";
            PreparedStatement pstm = new DatabaseConnection().getPreparedStatement(query);
            pstm.setString(1, username);
            pstm.setString(2, password);
            pstm.setString(3,role);
            ret = pstm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(!ret){
           return true;
        }
        else {
            return false;
        }
    }






}
