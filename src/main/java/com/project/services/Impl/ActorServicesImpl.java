package com.project.services.Impl;

import com.project.dao.ActorDao;
import com.project.model.Actor;
import com.project.services.ActorServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by grgbibek22 on 12/20/2017.
 */
@Service
public class ActorServicesImpl implements ActorServices {

    @Autowired
    private ActorDao actorDao;

    public List<Actor> getActorList() {
        return actorDao.getActorList();
    }

    public void addActor(Actor actor) {
        actorDao.addActor(actor);
    }

    public void updateActor(Actor actor) {
        actorDao.updateActor(actor);
    }

    public void removeActor(Actor actor) {
        actorDao.removeActor(actor);
    }

    public Actor getActorById(int actorId) {
        return actorDao.getActorById(actorId);

    }

    public List<Actor> getActorByMovieId(int movieId) {
        return actorDao.getActorByMovieId(movieId);
    }
}
