package com.project.controller;

import com.project.model.Actor;
import com.project.model.Movie;
import com.project.services.ActorServices;
import com.project.services.MovieServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by grgbibek22 on 12/20/2017.
 */
@RestController
@RequestMapping("/hall/movie/actor")
public class ActorController {

    @Autowired
    private ActorServices actorServices;

    @Autowired
    private MovieServices movieServices;

    /*  READ HALL BY ID     */
    @RequestMapping("/{actorId}")
    public Actor getActorById(@PathVariable(value = "actorId") int actorId ){
        return actorServices.getActorById(actorId);
    }

    /*  CREATE  */

    @RequestMapping(value = "/add/{movieId}",method = RequestMethod.POST, headers="Accept=application/json")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void createActor(@PathVariable("movieId")int movieId, @RequestBody Actor actor){
        System.out.println("Movie Id>>>>" + movieId);
        actor.setMovie(movieServices.getMovieById(movieId));
        actorServices.addActor(actor);
    }



    /*  Get Actor By movieId  */
    @RequestMapping(value = "/get/{movieId}",method = RequestMethod.GET)
    public List<Actor> getActorByMovieId(@PathVariable("movieId")int movieId){
        List<Actor> actorList = actorServices.getActorByMovieId(movieId);
        return actorList;
    }


    /*  GET HALL LIST   */
    @RequestMapping(value="/getActorList", method = RequestMethod.GET)
    public List<Actor> getActorList(){
        return actorServices.getActorList();
    }

    /*      Update Actor  */
    @RequestMapping(value = "/update/{movieId}",method = RequestMethod.PUT, headers="Accept=application/json")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void updateActor(@PathVariable("movieId")int movieId, @RequestBody Actor actor){
        System.out.println("Movie Id>>>>" + movieId);
        actor.setMovie(movieServices.getMovieById(movieId));
        actorServices.updateActor(actor);
    }

    @RequestMapping(value = "/delete/{actorId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void deleteActor(@PathVariable("actorId") int actorId){
        Actor actor = actorServices.getActorById(actorId);
        actorServices.removeActor(actor);
    }

}
