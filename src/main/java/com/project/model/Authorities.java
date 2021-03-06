package com.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by grgbibek22 on 8/4/2017.
 */
@Entity
@Table(name = "authorities")
public class Authorities {

    @Id
    @GeneratedValue
    private int id;
    private String username;
    private String authority;

    public int getAuthoritiesId() {
        return id;
    }

    public void setAuthoritiesId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }
}
