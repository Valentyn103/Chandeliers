package com.chandaliers.models;


import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "orderitem")
public class OrderItem implements java.io.Serializable {
    private Integer orderItemId;
    private Chandelier chandelier;
    private Order order;
    private Integer Quantity;

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "orderitem_id", unique = true, nullable = false)
    public Integer getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(Integer orderItemId) {
        this.orderItemId = orderItemId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "chandelier_id", nullable = false)
    public Chandelier getChandelier() {
        return chandelier;
    }

    public void setChandelier(Chandelier chandelier) {
        this.chandelier = chandelier;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "order_id", nullable = false)
    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @Column(name = "quantity")
    public Integer getQuantity() {
        return Quantity;
    }

    public void setQuantity(Integer quantity) {
        Quantity = quantity;
    }
}
