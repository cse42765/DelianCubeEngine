-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 10K-products
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `10K-products` ;

-- -----------------------------------------------------
-- Schema 10K-products
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `10K-products` DEFAULT CHARACTER SET utf8 ;
USE `10K-products` ;

-- -----------------------------------------------------
-- Table `10K-products`.`dates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `10K-products`.`dates` ;

CREATE TABLE IF NOT EXISTS `10K-products`.`dates` (
  `date_id` INT NOT NULL,
  `date` DATETIME NULL,
  `day` INT NULL,
  `month` INT NULL,
  `year` INT NULL,
  `ALL` VARCHAR(5) NOT NULL DEFAULT 'ALL',
  PRIMARY KEY (`date_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `10K-products`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `10K-products`.`products` ;

CREATE TABLE IF NOT EXISTS `10K-products`.`products` (
  `product_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `price` DECIMAL NULL,
  `subcategory` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  `ALL` VARCHAR(5) NULL DEFAULT 'ALL',
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `10K-products`.`locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `10K-products`.`locations` ;

CREATE TABLE IF NOT EXISTS `10K-products`.`locations` (
  `location_id` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `ALL` VARCHAR(5) NULL DEFAULT 'ALL',
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `10K-products`.`sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `10K-products`.`sales` ;

CREATE TABLE IF NOT EXISTS `10K-products`.`sales` (
  `sale_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `date_id` INT NOT NULL,
  `sales` DECIMAL NOT NULL,
  PRIMARY KEY (`sale_id`),
  UNIQUE INDEX `sale_id_UNIQUE` (`sale_id` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
