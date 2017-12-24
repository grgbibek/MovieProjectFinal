package com.project.controller;

import com.project.model.Movie;
import com.project.services.HallServices;
import com.project.services.MovieServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by grgbibek22 on 12/20/2017.
 */
@RestController
@RequestMapping("/hall/movie")
public class MovieController {

    @Autowired
    private HallServices  hallServices;

    @Autowired
    private MovieServices movieServices;

    /*  READ MOVIE BY ID     */
    @RequestMapping("/{movieId}")
    public Movie getMovieById(@PathVariable(value = "movieId") int movieId ){
        return movieServices.getMovieById(movieId);
    }

    /*  CREATE  */
    @RequestMapping(value = "/add/{hallId}",method = RequestMethod.POST, headers="Accept=application/json")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void saveMovie(@RequestBody Movie movie,@PathVariable("hallId") int hallId){
        /*int HallId= Integer.parseInt(movie.getHallId());
        System.out.println("Hall Id >>>>>>>>>>>>>" + HallId);
        movie.setHall(hallServices.getHallById(HallId));
        movieServices.addMovie(movie);*/

        System.out.println("Hall Id>>>>" + hallId);
        movie.setHall(hallServices.getHallById(hallId));
        movieServices.addMovie(movie);
    }

    /*  Get movie by HallId  */

    @RequestMapping(value = "/get/{hallId}",method = RequestMethod.GET)
    public List<Movie> getMovieByhallId(@PathVariable("hallId")int hallId){
        List<Movie> movieList = movieServices.getMovieByhallId(hallId);
        return movieList;
    }

    /*  GET MOVIE LIST   */
    @RequestMapping(value="/getMovieList", method = RequestMethod.GET)
    public List<Movie> getMovieList(){
        return movieServices.getMovieList();
    }

    /*  UPDATE  */
    @RequestMapping(value = "/update/{hallId}",method = RequestMethod.PUT, headers="Accept=application/json")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void updateMovie(@PathVariable("hallId")int hallId, @RequestBody Movie movie){
        System.out.println("Hall Id>>>>" + hallId);
        movie.setHall(hallServices.getHallById(hallId));
        movieServices.updateMovie(movie);
    }


    /*      DELETE      */
    @RequestMapping(value = "/delete/{movieId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void deleteMovie(@PathVariable("movieId") int movieId){
        Movie movie = movieServices.getMovieById(movieId);
        movieServices.removeMovie(movie);
    }
}
