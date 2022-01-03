package com.crud.entity;

import org.hibernate.annotations.Check;

import javax.persistence.*;

@Entity
@Table(name = "admin")
public class Admin {

    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private Long id;
    @Column(name = "name" , unique = true , nullable = false , length = 25)
    private String name;
    @Column(name = "email" , unique = true , nullable = false , length = 25)
    @Check(constraints = "%@gmail.com")
    private String email;
    private boolean Status;

    public Admin() {
    }

    public Admin(Long id, String name, String email, boolean status) {
        this.id = id;
        this.name = name;
        this.email = email;
        Status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean status) {
        Status = status;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", Status=" + Status +
                '}';
    }
}
