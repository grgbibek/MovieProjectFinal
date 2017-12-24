package com.project.services;

import com.project.model.Movie;

import java.util.List;

/**
 * Created by grgbibek22 on 12/20/2017.
 */
public interface MovieServices {
    List<Movie> getMovieList();

    void addMovie(Movie movie);

    void updateMovie(Movie movie);

    void removeMovie(Movie movie);

    Movie getMovieById(int movieId);

    List<Movie> getMovieByhallId(int hallId);
}
