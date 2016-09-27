package com.chandaliers.models;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "style")
public class Style implements java.io.Serializable {
    private Integer styleId;
    private String Name;
    private Set<Chandelier> chandeliers = new HashSet<Chandelier>(0);

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "style_id", unique = true, nullable = false)
    public Integer getStyleId() {
        return styleId;
    }

    public void setStyleId(Integer styleId) {
        this.styleId = styleId;
    }

    @Column(name = "name", unique = true, nullable = false, length = 50)
    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "style")
    public Set<Chandelier> getChandeliers() {
        return chandeliers;
    }

    public void setChandeliers(Set<Chandelier> chandeliers) {
        this.chandeliers = chandeliers;
    }
}