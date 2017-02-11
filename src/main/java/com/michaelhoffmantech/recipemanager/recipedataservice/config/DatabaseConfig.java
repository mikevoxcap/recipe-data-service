package com.michaelhoffmantech.recipemanager.recipedataservice.config;

import org.flywaydb.core.Flyway;
import org.springframework.boot.autoconfigure.flyway.FlywayMigrationStrategy;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

/**
 * Database-related bean configuration
 * 
 * @author Michael Hoffman, Michael Hoffman Tech
 *
 */
@Configuration
public class DatabaseConfig {

   /**
    * As I want to clean out the local database on startup of the service, I
    * needed to override the default migration strategy. This cleans the
    * existing database and then migrates it.
    * 
    * @return
    */
   @Bean
   @Profile("local")
   public FlywayMigrationStrategy cleanMigrateStrategy() {
      return new FlywayMigrationStrategy() {

         @Override
         public void migrate(Flyway flyway) {
            flyway.clean();
            flyway.migrate();
         }
      };
   }
}
