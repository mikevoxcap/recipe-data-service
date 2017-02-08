package com.michaelhoffmantech.recipemanager.recipedataservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.ComponentScan;

import com.michaelhoffmantech.recipemanager.recipedataservice.config.ApplicationProperties;

/**
 * Application for the recipe data service microservice.
 * 
 * @author Michael Hoffman, Michael Hoffman Tech
 *
 */
@SpringBootApplication
@ComponentScan
@EnableConfigurationProperties({ ApplicationProperties.class })
public class RecipeDataServiceApplication {

   public static void main(String[] args) {
      SpringApplication app = new SpringApplication(RecipeDataServiceApplication.class);

      app.run(args);
   }
}
