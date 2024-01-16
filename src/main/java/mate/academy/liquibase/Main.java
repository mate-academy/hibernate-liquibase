package mate.academy.liquibase;

import java.util.List;
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

        CountryService countryService = new CountryServiceImpl(
                new CountryDaoImpl(sessionFactory));
        Country usa = new Country("USA");
        countryService.save(usa);

        ActorService actorService = new ActorServiceImpl(
                new ActorDaoImpl(sessionFactory));
        Actor vinDiesel = new Actor("Vin Diesel");
        vinDiesel.setCountry(usa);
        actorService.save(vinDiesel);

        MovieService movieService = new MovieServiceImpl(
                new MovieDaoImpl(sessionFactory));
        Movie fastAndFurious = new Movie("Fast and Furious");
        fastAndFurious.setActors(List.of(vinDiesel));
        movieService.save(fastAndFurious);
        System.out.println(movieService.get(fastAndFurious.getId()));
    }
}
