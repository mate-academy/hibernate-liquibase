package mate.academy.liquibase.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import liquibase.Contexts;
import liquibase.Liquibase;
import liquibase.database.Database;
import liquibase.database.DatabaseFactory;
import liquibase.database.jvm.JdbcConnection;
import liquibase.resource.ClassLoaderResourceAccessor;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    private static final SessionFactory sessionFactory = buildSessionFactory();

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    private static SessionFactory buildSessionFactory() {
        runLiquibaseUpdate();
        Configuration configuration = new Configuration();
        configuration.configure();

        StandardServiceRegistryBuilder registryBuilder =
                new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());

        return configuration.buildSessionFactory(registryBuilder.build());
    }

    private static void runLiquibaseUpdate() {
        // You might need to adjust this depending on your setup
        String changelogFile = "db/changelog/db.changelog-master.yaml";
        String liquibasePropertiesPath = "liquibase.properties";

        Properties liquibaseProps = new Properties();
        try (InputStream input = HibernateUtil.class.getClassLoader()
                .getResourceAsStream(liquibasePropertiesPath)) {
            if (input == null) {
                throw new RuntimeException("Unable to find liquibase.properties");
            }
            liquibaseProps.load(input);

            try (Connection connection = DriverManager.getConnection(
                    liquibaseProps.getProperty("url"),
                    liquibaseProps.getProperty("username"),
                    liquibaseProps.getProperty("password"))) {

                Database database = DatabaseFactory.getInstance()
                        .findCorrectDatabaseImplementation(new JdbcConnection(connection));

                Liquibase liquibase = new Liquibase(
                        changelogFile, new ClassLoaderResourceAccessor(), database
                );
                liquibase.update(new Contexts());
            }
        } catch (Exception e) {
            throw new RuntimeException("Failed to run Liquibase update", e);
        }
    }
}
