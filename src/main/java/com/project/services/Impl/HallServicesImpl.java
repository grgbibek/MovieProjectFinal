package com.project.services.Impl;

import com.project.dao.HallDao;
import com.project.model.Hall;
import com.project.model.Movie;
import com.project.services.HallServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by grgbibek22 on 12/19/2017.
 */
@Service
public class HallServicesImpl implements HallServices{

    @Autowired
    private HallDao hallDao;

    public List<Hall> gethallList() {
        return hallDao.gethallList();
    }

    public void addHall(Hall hall) {
         hallDao.addHall(hall);
    }

    public void updateHall(Hall hall) {
        hallDao.updateHall(hall);
    }

    public void removeHall(Hall hall) {
        hallDao.removeHall(hall);
    }

    public Hall getHallById(int hallId) {
        return hallDao.getHallById(hallId);
    }


}
