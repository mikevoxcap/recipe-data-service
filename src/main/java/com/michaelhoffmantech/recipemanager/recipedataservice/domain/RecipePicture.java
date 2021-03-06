package com.michaelhoffmantech.recipemanager.recipedataservice.domain;
// Generated Feb 13, 2017 4:02:01 PM by Hibernate Tools 5.2.0.CR1

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Recipepicture generated by hbm2java
 */
@Entity
@Table(name = "recipe_picture")
public class RecipePicture implements java.io.Serializable {

   private static final long serialVersionUID = -7711408379610249918L;

   private Integer recipePictureId;
   private Recipe recipe;
   private String createdBy;
   private Date createdTimestamp;
   private String pictureName;
   private byte[] recipePicture;

   public RecipePicture() {
   }

   public RecipePicture(Integer recipePictureId, Recipe recipe, String createdBy,
         Date createdTimestamp, String pictureName, byte[] recipePicture) {
      this.recipePictureId = recipePictureId;
      this.recipe = recipe;
      this.createdBy = createdBy;
      this.createdTimestamp = createdTimestamp;
      this.pictureName = pictureName;
      this.recipePicture = recipePicture;
   }

   @Id
   @SequenceGenerator(name = "recipe_picture_recipe_picture_id_seq",
         sequenceName = "recipe_picture_recipe_picture_id_seq", allocationSize = 1)
   @GeneratedValue(strategy = GenerationType.SEQUENCE,
         generator = "recipe_picture_recipe_picture_id_seq")
   @Column(name = "recipe_picture_id", unique = true, nullable = false)
   public Integer getRecipePictureId() {
      return this.recipePictureId;
   }

   public void setRecipePictureId(Integer recipePictureId) {
      this.recipePictureId = recipePictureId;
   }

   @ManyToOne(fetch = FetchType.LAZY)
   @JoinColumn(name = "recipe_id", nullable = false)
   public Recipe getRecipe() {
      return this.recipe;
   }

   public void setRecipe(Recipe recipe) {
      this.recipe = recipe;
   }

   @Column(name = "created_by", nullable = false, length = 100)
   public String getCreatedBy() {
      return this.createdBy;
   }

   public void setCreatedBy(String createdBy) {
      this.createdBy = createdBy;
   }

   @Temporal(TemporalType.TIMESTAMP)
   @Column(name = "created_timestamp", nullable = false, length = 29)
   public Date getCreatedTimestamp() {
      return this.createdTimestamp;
   }

   public void setCreatedTimestamp(Date createdTimestamp) {
      this.createdTimestamp = createdTimestamp;
   }

   @Column(name = "picture_name", nullable = false, length = 250)
   public String getPictureName() {
      return this.pictureName;
   }

   public void setPictureName(String pictureName) {
      this.pictureName = pictureName;
   }

   @Column(name = "recipe_picture", nullable = false)
   public byte[] getRecipePicture() {
      return this.recipePicture;
   }

   public void setRecipePicture(byte[] recipePicture) {
      this.recipePicture = recipePicture;
   }

}
