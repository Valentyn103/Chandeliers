package com.chandaliers.models;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "cartridge")
public class Cartridge implements java.io.Serializable {
    private Integer cartridgeId;
    private String Name;
    private Set<Chandelier> chandeliers = new HashSet<Chandelier>(0);

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "cartridge_id", unique = true, nullable = false)
    public Integer getCartridgeId() {
        return cartridgeId;
    }

    public void setCartridgeId(Integer cartridgeId) {
        this.cartridgeId = cartridgeId;
    }


    @Column(name = "name", unique = true, nullable = false, length = 50)
    public String getName() {
        return Name;
    }

    public void setName(String name) {
        this.Name = name;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "cartridge")
    public Set<Chandelier> getChandeliers() {
        return chandeliers;
    }

    public void setChandeliers(Set<Chandelier> chandeliers) {
        this.chandeliers = chandeliers;
    }
}