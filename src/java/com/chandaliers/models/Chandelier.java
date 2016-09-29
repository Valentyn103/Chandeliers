package com.chandaliers.models;


import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "chandelier")
public class Chandelier implements java.io.Serializable {
    private Integer chandelierId;
    private Category category;
    private Firm firm;
    private String Article;
    private Integer Number_lamp;
    private Integer Power;
    private String Info;
    private Integer UnitCost;
    private String Image;
    private float Width;
    private float Height;
    private Cartridge cartridge;
    private Color bodycolor;
    private Color plafoncolor;
    private Style style;
    private Material bodymaterial;
    private Material plafonmaterial;

    private Set<OrderItem> orderItems = new HashSet<OrderItem>(0);

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "chandelier_id", unique = true, nullable = false)
    public Integer getChandelierId() {
        return chandelierId;
    }

    public void setChandelierId(Integer chandelierId) {
        this.chandelierId = chandelierId;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "chandelier")
    public Set<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(Set<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id", nullable = false)
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "firm_id", nullable = false)
    public Firm getFirm() {
        return firm;
    }

    public void setFirm(Firm firm) {
        this.firm = firm;
    }


    @Column(name = "Article", unique = true)
    public String getArticle() {
        return Article;
    }

    public void setArticle(String article) {
        Article = article;
    }

    @Column(name = "number_lamp")
    public Integer getNumber_lamp() {
        return Number_lamp;
    }

    public void setNumber_lamp(Integer number_lamp) {
        Number_lamp = number_lamp;
    }

    @Column(name = "power")
    public Integer getPower() {
        return Power;
    }

    public void setPower(Integer power) {
        Power = power;
    }

    @Column(name = "info", length = 200)
    public String getInfo() {
        return Info;
    }

    public void setInfo(String info) {
        Info = info;
    }

    @Column(name = "unitcost")
    public Integer getUnitCost() {
        return UnitCost;
    }

    public void setUnitCost(Integer unitCost) {
        UnitCost = unitCost;
    }

    @Column(name = "image")
    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }

    @Column(name = "width")

    public float getWidth() {
        return Width;
    }

    public void setWidth(float width) {
        Width = width;
    }

    @Column(name = "height")

    public float getHeight() {
        return Height;
    }

    public void setHeight(float height) {
        Height = height;
    }



    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "cartridge_id", nullable = false)
    public Cartridge getCartridge() {
        return cartridge;
    }

    public void setCartridge(Cartridge cartridge) {
        this.cartridge = cartridge;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "material_body_id", nullable = false)
    public Material getBodymaterial() {
        return  bodymaterial;
    }

    public void setBodymaterial(Material _bodymaterial) {
        bodymaterial = _bodymaterial;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "color_body_id", nullable = false)
    public Color getBodycolor() {
        return bodycolor;
    }

    public void setBodycolor(Color _bodycolor) {
        bodycolor = _bodycolor;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "style_id", nullable = false)
    public Style getStyle() {
        return style;
    }

    public void setStyle(Style style) {
        this.style = style;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "color_plafon_id", nullable = false)
    public Color getPlafoncolor() {
        return plafoncolor;
    }

    public void setPlafoncolor(Color plafoncolor) {
        this.plafoncolor = plafoncolor;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "material_plafon_id", nullable = false)
    public Material getPlafonmaterial() {
        return plafonmaterial;
    }

    public void setPlafonmaterial(Material plafonmaterial) {
        this.plafonmaterial = plafonmaterial;
    }
}