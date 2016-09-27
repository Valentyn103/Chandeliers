package com.chandaliers.models;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "user")
public class User implements java.io.Serializable {
    private Integer userId;
    private String Email;
    private String Password;
    private String Name;
    private String Number;
    private Integer role_id;
    private Set<Order> orders = new HashSet<Order>(0);

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "user_id", unique = true, nullable = false)
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Column(name = "email",unique = true, nullable = false, length = 50)
    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    @Column(name = "password", nullable = false, length = 250)
    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    @Column(name = "name", nullable = false, length = 50)
    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    @Column(name = "number",  nullable = false, length = 50)
    public String getNumber() {
        return Number;
    }

    public void setNumber(String number) {
        Number = number;
    }

    @Column(name = "role_id", nullable = false, length = 50)
    public Integer getRole_id() {
        return role_id;
    }

    public void setRole_id(Integer roleId) {
        this.role_id = roleId;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
    public Set<Order> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }
}
