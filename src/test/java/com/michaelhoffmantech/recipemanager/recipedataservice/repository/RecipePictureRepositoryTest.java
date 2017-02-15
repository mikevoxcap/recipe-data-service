package com.michaelhoffmantech.recipemanager.recipedataservice.repository;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.Date;

import org.apache.commons.io.IOUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.michaelhoffmantech.recipemanager.recipedataservice.domain.Recipe;
import com.michaelhoffmantech.recipemanager.recipedataservice.domain.RecipePicture;

@RunWith(SpringRunner.class)
@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
public class RecipePictureRepositoryTest {

   @Autowired
   private RecipePictureRepository recipePictureRepository;

   @Autowired
   private RecipeRepository recipeRepository;

   @Before
   public void setUp() throws Exception {
   }

   @After
   public void tearDown() throws Exception {
   }

   @Test
   public void testSaveAndFindSuccess() throws Exception {
      Recipe recipe = recipeRepository.findAll().get(0);
      RecipePicture recipePicture = new RecipePicture();
      recipePicture.setCreatedBy("test");
      recipePicture.setCreatedTimestamp(new Date(System.currentTimeMillis()));
      recipePicture.setPictureName("Boiling water");
      recipePicture.setRecipe(recipe);
      recipePicture.setRecipePicture(IOUtils.toByteArray(
            this.getClass().getClassLoader().getResourceAsStream("boilingWater.jpg")));
      recipePictureRepository.save(recipePicture);
      RecipePicture recipePictureFind = recipePictureRepository.findAll().get(0);
      assertNotNull(recipePictureFind);
      assertEquals("Boiling water", recipePictureFind.getPictureName());
   }

}
