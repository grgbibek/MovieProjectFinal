package com.project.dao.impl;

import com.project.dao.MovieDao;
import com.project.model.Movie;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by grgbibek22 on 12/20/2017.
 */
@Repository
@Transactional
public class MovieDaoImpl implements MovieDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<Movie> getMovieList() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Movie");
        List<Movie> movieList = query.list();
        return movieList;
    }

    public void addMovie(Movie movie) {
        Session session = sessionFactory.getCurrentSession();
        session.save(movie);
        session.flush();
    }

    public void updateMovie(Movie movie) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(movie);
        session.flush();
    }

    public void removeMovie(Movie movie) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(movie);
        session.flush();
    }

    public Movie getMovieById(int movieId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Movie where Id=?");
        query.setInteger(0,movieId);
        session.flush();
        return (Movie) query.uniqueResult();
    }

    public List<Movie> getMovieByhallId(int hallId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Movie where hallId =?");
        query.setInteger(0,hallId);
        List<Movie> movieList=query.list();
        return movieList;

    }
}
