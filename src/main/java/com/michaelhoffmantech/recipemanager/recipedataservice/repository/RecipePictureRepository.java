package com.michaelhoffmantech.recipemanager.recipedataservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.michaelhoffmantech.recipemanager.recipedataservice.domain.RecipePicture;

public interface RecipePictureRepository extends JpaRepository<RecipePicture, Integer> {

}
