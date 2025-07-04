package com.example.demo.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "roles")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    
    @OneToMany(mappedBy = "role")
    List<User> user;

    public long getId() {
        return id;
    }
 
    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Role [id=" + id + "]";
    }
}
