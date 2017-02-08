package com.michaelhoffmantech.recipemanager.recipedataservice.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "application")
public class ApplicationProperties {

   private final Startup startup = new Startup();
   private final Swagger swagger = new Swagger();

   /**
    * @return the startup
    */
   public Startup getStartup() {
      return startup;
   }

   /**
    * @return the swagger
    */
   public Swagger getSwagger() {
      return swagger;
   }

   public static class Startup {
      private String openUrlEnabled;

      /**
       * @return the openUrlEnabled
       */
      public String getOpenUrlEnabled() {
         return openUrlEnabled;
      }

      /**
       * @param openUrlEnabled
       *           the openUrlEnabled to set
       */
      public void setOpenUrlEnabled(String openUrlEnabled) {
         this.openUrlEnabled = openUrlEnabled;
      }

   }

   public static class Swagger {
      private String title = "Recipe Data Service";
      private String description = "Recipe Data Service API documentation";
      private String version = "0.0.1";
      private String termsOfServiceUrl = "http://www.michaelhoffmaninc.com";
      private String contact = "mike@michaelhoffmaninc.com";
      private String license = "GNU GENERAL PUBLIC LICENSE 3.0";
      private String licenseUrl = "https://www.gnu.org/licenses/gpl-3.0.en.html";

      /**
       * @return the title
       */
      public String getTitle() {
         return title;
      }

      /**
       * @return the description
       */
      public String getDescription() {
         return description;
      }

      /**
       * @return the version
       */
      public String getVersion() {
         return version;
      }

      /**
       * @return the termsOfServiceUrl
       */
      public String getTermsOfServiceUrl() {
         return termsOfServiceUrl;
      }

      /**
       * @return the contact
       */
      public String getContact() {
         return contact;
      }

      /**
       * @return the license
       */
      public String getLicense() {
         return license;
      }

      /**
       * @return the licenseUrl
       */
      public String getLicenseUrl() {
         return licenseUrl;
      }

      /**
       * @param title
       *           the title to set
       */
      public void setTitle(String title) {
         this.title = title;
      }

      /**
       * @param description
       *           the description to set
       */
      public void setDescription(String description) {
         this.description = description;
      }

      /**
       * @param version
       *           the version to set
       */
      public void setVersion(String version) {
         this.version = version;
      }

      /**
       * @param termsOfServiceUrl
       *           the termsOfServiceUrl to set
       */
      public void setTermsOfServiceUrl(String termsOfServiceUrl) {
         this.termsOfServiceUrl = termsOfServiceUrl;
      }

      /**
       * @param contact
       *           the contact to set
       */
      public void setContact(String contact) {
         this.contact = contact;
      }

      /**
       * @param license
       *           the license to set
       */
      public void setLicense(String license) {
         this.license = license;
      }

      /**
       * @param licenseUrl
       *           the licenseUrl to set
       */
      public void setLicenseUrl(String licenseUrl) {
         this.licenseUrl = licenseUrl;
      }
   }
}
