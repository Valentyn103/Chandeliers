package com.chandaliers.models;


import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "material")
public class Material implements java.io.Serializable {
    private Integer materialId;
    private String Name;
    private Set<Chandelier> bodychandeliers = new HashSet<Chandelier>(0);
    private Set<Chandelier> plafonchandeliers = new HashSet<Chandelier>(0);

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "material_id", unique = true, nullable = false)
    public Integer getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Integer materialId) {
        this.materialId = materialId;
    }

    @Column(name = "name", unique = true, nullable = false, length = 50)
    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "bodymaterial")
    public Set<Chandelier> getBodyChandeliers() {
        return bodychandeliers;
    }

    public void setBodyChandeliers(Set<Chandelier> chandeliers) {
        this.bodychandeliers = chandeliers;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "plafonmaterial")
    public Set<Chandelier> getPlafonChandeliers() {
        return plafonchandeliers;
    }

    public void setPlafonChandeliers(Set<Chandelier> chandeliers) {
        this.plafonchandeliers = chandeliers;
    }

}