package com.project.services.Impl;

import com.project.dao.MovieDao;
import com.project.model.Movie;
import com.project.services.MovieServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by grgbibek22 on 12/20/2017.
 */
@Service
public class MovieServicesImpl implements MovieServices{

    @Autowired
    MovieDao movieDao;


    public List<Movie> getMovieList() {
        return movieDao.getMovieList();
    }

    public void addMovie(Movie movie) {
        movieDao.addMovie(movie);
    }

    public void updateMovie(Movie movie) {
        movieDao.updateMovie(movie);
    }

    public void removeMovie(Movie movie) {
        movieDao.removeMovie(movie);
    }

    public Movie getMovieById(int movieId) {
        return movieDao.getMovieById(movieId);
    }

    public List<Movie> getMovieByhallId(int hallId) {
        return movieDao.getMovieByhallId(hallId);
    }
}
