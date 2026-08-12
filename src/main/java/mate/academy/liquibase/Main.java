package mate.academy.liquibase;

import mate.academy.liquibase.dao.ActorDao;
import mate.academy.liquibase.dao.CountryDao;
import mate.academy.liquibase.dao.MovieDao;
import mate.academy.liquibase.dao.impl.ActorDaoImpl;
import mate.academy.liquibase.dao.impl.CountryDaoImpl;
import mate.academy.liquibase.dao.impl.MovieDaoImpl;
import mate.academy.liquibase.model.Actor;
import mate.academy.liquibase.model.Country;
import mate.academy.liquibase.model.Movie;
import mate.academy.liquibase.util.HibernateUtil;
import org.hibernate.SessionFactory;

public class Main {
    public static void main(String[] args) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

        Country usa = new Country("USA");

        CountryDao countryDao = new CountryDaoImpl(sessionFactory);
        countryDao.save(usa);

        Actor vinDiesel = new Actor("Vin Diesel");
        vinDiesel.setId(0L);
        ActorDao actorDao = new ActorDaoImpl(sessionFactory);
        actorDao.save(vinDiesel);

        Movie fastAndFurious = new Movie("Fast and Furious");
        MovieDao movieDao = new MovieDaoImpl(sessionFactory);
        movieDao.save(fastAndFurious);

        System.out.println(movieDao.findById(fastAndFurious.getId()));
    }
}
