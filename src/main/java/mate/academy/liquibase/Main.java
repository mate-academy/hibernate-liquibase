package mate.academy.liquibase;

import java.util.List;
import mate.academy.liquibase.dao.ActorDao;
import mate.academy.liquibase.dao.CountryDao;
import mate.academy.liquibase.dao.MovieDao;
import mate.academy.liquibase.dao.impl.ActorDaoImpl;
import mate.academy.liquibase.dao.impl.CountryDaoImpl;
import mate.academy.liquibase.dao.impl.MovieDaoImpl;
import mate.academy.liquibase.model.Actor;
import mate.academy.liquibase.model.Country;
import mate.academy.liquibase.model.Movie;
import mate.academy.liquibase.service.ActorService;
import mate.academy.liquibase.service.CountryService;
import mate.academy.liquibase.service.MovieService;
import mate.academy.liquibase.service.impl.ActorServiceImpl;
import mate.academy.liquibase.service.impl.CountryServiceImpl;
import mate.academy.liquibase.service.impl.MovieServiceImpl;
import mate.academy.liquibase.util.HibernateUtil;
import org.hibernate.SessionFactory;

public class Main {
    public static void main(String[] args) {
        // use this session factory when you will initialize service instances
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

        Country usa = new Country("USA");
        CountryDao countryDao = new CountryDaoImpl(sessionFactory);
        CountryService countryService = new CountryServiceImpl(
                countryDao); // TODO: initialize this instance
        countryService.save(usa);

        Actor vinDiesel = new Actor("Vin Diesel");
        ActorDao actorDao = new ActorDaoImpl(sessionFactory);
        vinDiesel.setCountry(usa);
        ActorService actorService = new ActorServiceImpl(
                actorDao); // TODO: initialize this instance
        actorService.save(vinDiesel);

        Movie fastAndFurious = new Movie("Fast and Furious");
        MovieDao movieDao = new MovieDaoImpl(sessionFactory);
        fastAndFurious.setActors(List.of(vinDiesel));
        MovieService movieService = new MovieServiceImpl(
                 movieDao); // TODO: initialize this instance
        movieService.save(fastAndFurious);
        System.out.println(movieService.get(fastAndFurious.getId()));
    }
}
