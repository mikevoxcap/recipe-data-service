package com.michaelhoffmantech.recipemanager.recipedataservice.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * REST controller for recipe review resource data sourced from database
 * 
 * @author Michael Hoffman, Michael Hoffman Tech
 *
 */
@RestController
@RequestMapping("/api")
public class RecipeReviewApi {

   private static final Logger LOG = LoggerFactory.getLogger(RecipeReviewApi.class);
}
