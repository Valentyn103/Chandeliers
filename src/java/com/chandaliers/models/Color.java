package com.chandaliers.models;


import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "color")
public class Color implements java.io.Serializable {
    private Integer colorId;
    private String Name;
    private Set<Chandelier> bodychandeliers = new HashSet<Chandelier>(0);
    private Set<Chandelier> plafonchandeliers = new HashSet<Chandelier>(0);
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "color_id", unique = true, nullable = false)
    public Integer getColorId() {
        return colorId;
    }

    public void setColorId(Integer colorId) {
        this.colorId = colorId;
    }

    @Column(name = "name", unique = true, nullable = false, length = 50)
    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "bodycolor")
    public Set<Chandelier> getBodychandeliers() {
        return bodychandeliers;
    }
    public void setBodychandeliers(Set<Chandelier> bodychandeliers) {
        this.bodychandeliers = bodychandeliers;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "plafoncolor")
    public Set<Chandelier> getPlafonchandeliers() {
        return plafonchandeliers;
    }

    public void setPlafonchandeliers(Set<Chandelier> plafonchandeliers) {
        this.plafonchandeliers = plafonchandeliers;
    }
}