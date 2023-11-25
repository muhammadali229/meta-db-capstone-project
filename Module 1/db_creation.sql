-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `customerID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `staffID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `role` VARCHAR(100) NOT NULL,
  `salary` DECIMAL NOT NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `bookingID` INT NOT NULL AUTO_INCREMENT,
  `tableNo` INT NOT NULL,
  `bookingDate` DATE NOT NULL,
  `staffID` INT NOT NULL,
  `customerID` INT NOT NULL,
  PRIMARY KEY (`bookingID`),
  INDEX `customer_id_fk_idx` (`customerID` ASC) VISIBLE,
  INDEX `staff_id_fk_idx` (`staffID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`customerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`staffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItem` (
  `itemID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  `price` DECIMAL NOT NULL,
  PRIMARY KEY (`itemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `menuID` INT NOT NULL AUTO_INCREMENT,
  `cuisine` VARCHAR(255) NOT NULL,
  `itemID` INT NOT NULL,
  PRIMARY KEY (`menuID`),
  INDEX `item_id_fk_idx` (`itemID` ASC) VISIBLE,
  CONSTRAINT `item_id_fk`
    FOREIGN KEY (`itemID`)
    REFERENCES `LittleLemonDB`.`MenuItem` (`itemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDelivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDelivery` (
  `deliveryID` INT NOT NULL AUTO_INCREMENT,
  `deliveryDate` DATE NOT NULL,
  `orderStatus` VARCHAR(100) NOT NULL,
  `orderID` INT NOT NULL,
  PRIMARY KEY (`deliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `orderID` INT NOT NULL AUTO_INCREMENT,
  `orderDate` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `totalCost` DECIMAL NOT NULL,
  `bookingID` INT NOT NULL,
  `menuID` INT NOT NULL,
  `deliveryID` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `menu_id_fk_idx` (`menuID` ASC) VISIBLE,
  INDEX `booking_id_fk_idx` (`bookingID` ASC) VISIBLE,
  INDEX `delivery_id_fk_idx` (`deliveryID` ASC) VISIBLE,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`menuID`)
    REFERENCES `LittleLemonDB`.`Menus` (`menuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `booking_id_fk`
    FOREIGN KEY (`bookingID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`bookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `delivery_id_fk`
    FOREIGN KEY (`deliveryID`)
    REFERENCES `LittleLemonDB`.`OrderDelivery` (`deliveryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
