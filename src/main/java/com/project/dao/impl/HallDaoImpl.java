package com.project.dao.impl;

import com.project.dao.HallDao;
import com.project.model.Hall;
import com.project.model.Movie;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by grgbibek22 on 12/19/2017.
 */
@Repository
@Transactional
public class HallDaoImpl implements HallDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addHall(Hall hall) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(hall);
        session.flush();
    }

    public void updateHall(Hall hall) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(hall);
        session.flush();
    }

    public void removeHall(Hall hall) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(hall);
        session.flush();
    }

    public Hall getHallById(int hallId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Hall where Id =?");
        query.setInteger(0,hallId);
        session.flush();
        return (Hall) query.uniqueResult();
    }

   /* public List<Movie> getMovieByhallId(int hallId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Hall where Id =?");
        query.setInteger(0,hallId);
        Hall hall = (Hall) query.uniqueResult();
        List<Movie> movieList=hall.movies;
        return movieList;

    }*/

    public List<Hall> gethallList() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Hall");
        List<Hall> hallList = query.list();
        return hallList;
    }
}
