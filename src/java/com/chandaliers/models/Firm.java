package com.chandaliers.models;


import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "firm")
public class Firm implements java.io.Serializable {
    private Integer firmId;
    private String Name;
    private Set<Chandelier> chandeliers = new HashSet<Chandelier>(0);

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "firm_id", unique = true, nullable = false)
    public Integer getFirmId() {
        return firmId;
    }

    public void setFirmId(Integer firmId) {
        this.firmId = firmId;
    }

    @Column(name = "name", unique = true, nullable = false, length = 50)

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "firm")
    public Set<Chandelier> getChandeliers() {
        return chandeliers;
    }

    public void setChandeliers(Set<Chandelier> chandeliers) {
        this.chandeliers = chandeliers;
    }
}