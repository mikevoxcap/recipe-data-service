package com.michaelhoffmantech.recipemanager.recipedataservice.repository;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.michaelhoffmantech.recipemanager.recipedataservice.RecipeDataServiceApplication;
import com.michaelhoffmantech.recipemanager.recipedataservice.domain.Category;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { RecipeDataServiceApplication.class })
@WebAppConfiguration
@ActiveProfiles(profiles = { "test" })
@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback
public class CategoryRepositoryTest {

   @Autowired
   private CategoryRepository categoryRespoitory;

   @Before
   public void setUp() throws Exception {
   }

   @After
   public void tearDown() throws Exception {
   }

   @Test
   public void testFindAllSuccess() {
      List<Category> categories = categoryRespoitory.findAll();
      assertNotNull(categories);
      assertFalse(categories.isEmpty());
   }

}
