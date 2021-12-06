/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.users;

import java.sql.Date;

/**
 *
 * @author tamtv
 */
public class UserDTO {
    private String userID;
    private String name;
    private String password;
    private String phone;
    private String address;
    private String role;
    private boolean status;
    private String createDay;

    public UserDTO() {
    }

    public UserDTO(String userID, String name, String password, String phone, String address, String createDay) {
        this.userID = userID;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.createDay = createDay;
    }

    public UserDTO(String userID, String name, String phone, String address, String password) {
        this.userID = userID;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.password = password;
    }
    
    

    public UserDTO(String userID, String name, String password, String phone, String address, String role, boolean status, String createDay) {
        this.userID = userID;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.status = status;
        this.createDay = createDay;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getCreateDay() {
        return createDay;
    }

    public void setCreateDay(String createDay) {
        this.createDay = createDay;
    }
    
}
