package com.chandaliers.models;


import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "category")
public class Category implements java.io.Serializable {
    private Integer categoryId;
    private String Name;
    private Set<Chandelier> chandeliers = new HashSet<Chandelier>(0);

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "category_id", unique = true, nullable = false)
    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    @Column(name = "name", unique = true, nullable = false, length = 50)
    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "category")
    public Set<Chandelier> getChandeliers() {
        return chandeliers;
    }

    public void setChandeliers(Set<Chandelier> chandeliers) {
        this.chandeliers = chandeliers;
    }
}