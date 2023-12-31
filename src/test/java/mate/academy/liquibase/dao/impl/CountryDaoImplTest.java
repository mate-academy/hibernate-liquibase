package mate.academy.liquibase.dao.impl;

import java.util.Optional;
import mate.academy.liquibase.dao.AbstractTest;
import mate.academy.liquibase.dao.CountryDao;
import mate.academy.liquibase.model.Actor;
import mate.academy.liquibase.model.Country;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class CountryDaoImplTest extends AbstractTest {
    public static final Country usa = new Country("USA");
    public static final Country ukraine = new Country("Ukraine");

    @Override
    protected Class<?>[] entities() {
        return new Class[] {Country.class};
    }

    @Before
    public void setUp() throws Exception {
        try (Session session = getSessionFactory().openSession()) {
            Transaction transaction = null;
            try {
                transaction = session.beginTransaction();
                session.createNativeQuery("DELETE FROM countries;", Country.class).executeUpdate();
                session.createNativeQuery("ALTER TABLE countries ALTER COLUMN id RESTART WITH 0;", Country.class).executeUpdate();
                transaction.commit();
            } catch (Exception e) {
                if (transaction != null) {
                    transaction.rollback();
                }
                throw e;
            }
        }
    }

    @Test
    public void create_Ok() {
        CountryDao countryDao = new CountryDaoImpl(getSessionFactory());
        verifyCreateCountryWorks(countryDao, usa.clone(), 0L);
        verifyCreateCountryWorks(countryDao, ukraine.clone(), 1L);
    }

    @Test
    public void getById_Ok() {
        CountryDao countryDao = new CountryDaoImpl(getSessionFactory());
        verifyCreateCountryWorks(countryDao, usa.clone(), 0L);
        Optional<Country> usaOptional = countryDao.findById(0L);
        Assert.assertTrue(usaOptional.isPresent());
        Country actualUsa = usaOptional.get();
        Assert.assertNotNull(actualUsa);
        Assert.assertEquals(0L, actualUsa.getId().longValue());
        Assert.assertEquals(usa.getName(), actualUsa.getName());

        verifyCreateCountryWorks(countryDao, ukraine.clone(), 1L);
        Optional<Country> ukraineOptional = countryDao.findById(1L);
        Assert.assertTrue(ukraineOptional.isPresent());
        Country actualUkraine = ukraineOptional.get();
        Assert.assertNotNull(actualUkraine);
        Assert.assertEquals(1L, actualUkraine.getId().longValue());
        Assert.assertEquals(ukraine.getName(), actualUkraine.getName());
    }

    @Test
    public void getByNotExistingId_Ok() {
        CountryDao countryDao = new CountryDaoImpl(getSessionFactory());
        Optional<Country> actual = countryDao.findById(100L);
        Assert.assertFalse(actual.isPresent());
    }

    static void verifyCreateCountryWorks(CountryDao countryDao, Country country, Long expectedId) {
        Country actual = countryDao.save(country);
        Assert.assertNotNull("Check you have implemented the `create` method " +
                "in the CountryDaoImpl class", actual);
        Assert.assertNotNull("ID for country should be autogenerated", actual.getId());
        Assert.assertEquals(expectedId, actual.getId());
        Assert.assertEquals(country.getName(), actual.getName());
    }
}
