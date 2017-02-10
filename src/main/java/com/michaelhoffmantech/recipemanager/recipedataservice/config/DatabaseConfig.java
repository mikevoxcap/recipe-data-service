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
