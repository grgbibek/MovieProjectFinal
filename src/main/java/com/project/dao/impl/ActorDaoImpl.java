package com.project.dao.impl;

import com.project.dao.ActorDao;
import com.project.model.Actor;
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
public class ActorDaoImpl implements ActorDao {

    @Autowired
    private SessionFactory sessionFactory;

    public List<Actor> getActorList() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Actor");
        List<Actor> actorList = query.list();
        session.flush();

        return actorList;
    }

    public void addActor(Actor actor) {
        Session session = sessionFactory.getCurrentSession();
        session.save(actor);
        session.flush();
    }

    public void updateActor(Actor actor) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(actor);
        session.flush();
    }

    public void removeActor(Actor actor) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(actor);
        session.flush();
    }

    public Actor getActorById(int actorId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Actor where Id=?");
        query.setInteger(0,actorId);
        session.flush();

        return (Actor) query.uniqueResult();

    }

    public List<Actor> getActorByMovieId(int movieId){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Actor where movieId=?");
        query.setInteger(0, movieId);

        List<Actor> actorList = query.list();
        return actorList;
    }
}
