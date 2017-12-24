package com.project.services;

import com.project.model.Actor;

import java.util.List;

/**
 * Created by grgbibek22 on 12/20/2017.
 */
public interface ActorServices {
    List<Actor> getActorList();

    void addActor(Actor actor);

    void updateActor(Actor actor);

    void removeActor(Actor actor);

    Actor getActorById(int actorId);

    List<Actor> getActorByMovieId(int movieId);
}
