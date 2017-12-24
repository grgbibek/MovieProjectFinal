package com.project.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by grgbibek22 on 12/19/2017.
 */
@Entity
@Table(name="hall")
public class Hall {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int Id;
    private String hallName;
    private String numberOfScreen;
    private String location;

    @JsonIgnore
    @OneToMany(mappedBy = "hall", cascade = CascadeType.ALL)
    public List<Movie> movies = new ArrayList<Movie>();

    /*public int getHallId() {
        return Id;
    }

    public void setHallId(int Id) {
        this.Id = Id;
    }*/

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getHallName() {
        return hallName;
    }

    public void setHallName(String hallName) {
        this.hallName = hallName;
    }

    public String getNumberOfScreen() {
        return numberOfScreen;
    }

    public void setNumberOfScreen(String numberOfScreen) {
        this.numberOfScreen = numberOfScreen;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public List<Movie> getMovies() {
        return movies;
    }

    public void setMovies(List<Movie> movies) {
        this.movies = movies;
    }
}
