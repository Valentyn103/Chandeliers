package com.chandaliers.models;


import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "orders")
public class Order implements java.io.Serializable {
    private Integer orderId;
    private Date date;
    private Integer cost;
    private Integer status;
    private String Info;
    private String address;
    private User user;
    private Set<OrderItem> orderItems = new HashSet<OrderItem>(0);

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "order_id", unique = true, nullable = false)
    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "order")
    public Set<OrderItem> getOrderItems() {
        return orderItems;
    }


    public void setOrderItems(Set<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }


    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Column(name = "cost")
    public Integer getCost() {
        return cost;
    }

    public void setCost(Integer cost) {
        this.cost = cost;
    }

    @Column(name = "status")
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Column(name = "info",length = 200)
    public String getInfo() {
        return Info;
    }

    public void setInfo(String info) {
        Info = info;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", nullable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Column(name = "address", length = 200)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
