package com.michaelhoffmantech.recipemanager.recipedataservice.config;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.stereotype.Component;

/**
 * Implementing a custom application context initializer so that a default local
 * profile can be set if one was not specified. This is useful both for local
 * execution and testing.
 * 
 * @author Michael Hoffman, Michael Hoffman Tech
 *
 */
@Component
public class ApplicationContextInitializer implements
      org.springframework.context.ApplicationContextInitializer<ConfigurableApplicationContext> {

   private static final Logger LOG = LoggerFactory
         .getLogger(ApplicationContextInitializer.class);

   public ApplicationContextInitializer() {
      LOG.info("Initializing custom application context.");

      String propActiveProfile = System.getProperty("spring.profiles.active");
      LOG.info("spring.profiles.active={}", propActiveProfile);
      String envActiveProfile = System.getenv("SPRING_PROFILES_ACTIVE");
      LOG.info("SPRING_PROFILES_ACTIVE={}", envActiveProfile);

      if (StringUtils.isBlank(envActiveProfile)
            && StringUtils.isBlank(propActiveProfile)) {
         LOG.info("Setting the default profile as local");
         System.setProperty("spring.profiles.active", SpringProfile.LOCAL.getProfile());
      }
   }

   @Override
   public void initialize(ConfigurableApplicationContext applicationContext) {
   }

}
