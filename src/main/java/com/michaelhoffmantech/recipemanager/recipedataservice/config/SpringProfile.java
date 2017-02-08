package com.michaelhoffmantech.recipemanager.recipedataservice.config;

/**
 * Enumeration of the spring profiles that can be set for the application
 * 
 * @author Michael Hoffman, Michael Hoffman Tech
 *
 */
public enum SpringProfile {

   LOCAL("local");

   private String profile;

   private SpringProfile(String profile) {
      this.profile = profile;
   }

   public String getProfile() {
      return this.profile;
   }
}
