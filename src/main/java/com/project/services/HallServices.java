package com.project.services;

import com.project.model.Hall;
import com.project.model.Movie;

import java.util.List;

/**
 * Created by grgbibek22 on 12/19/2017.
 */

public interface HallServices {
    List<Hall> gethallList();

    void addHall(Hall hall);

    void updateHall(Hall hall);

    void removeHall(Hall hall);

    Hall getHallById(int hallId);


}
