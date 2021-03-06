-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Books` (
  `ISBN` VARCHAR(14) NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `Authors_Names` VARCHAR(45) NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `Cover_Picture` VARCHAR(100) NOT NULL,
  `Edition` INT NULL,
  `Publisher` VARCHAR(45) NOT NULL,
  `Publication_Year` INT NOT NULL,
  `Quantity_In_Stock` INT NOT NULL,
  `Minimum_Threshold` INT NULL,
  `Buying_Price` DECIMAL(2) NOT NULL,
  `Selling_Price` DECIMAL(2) NOT NULL,
  `Description` LONGTEXT NULL,
  PRIMARY KEY (`ISBN`),
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `IDuser` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `birthDate` DATE NULL,
  `isAdmin` TINYINT NOT NULL,
  `userState` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDuser`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Card` (
  `idCard` INT NOT NULL,
  `cardType` VARCHAR(45) NOT NULL,
  `expirationDate` DATE NULL,
  `User_IDuser` INT NOT NULL,
  PRIMARY KEY (`idCard`),
  INDEX `fk_Card_User_idx` (`User_IDuser` ASC) VISIBLE,
  CONSTRAINT `fk_Card_User`
    FOREIGN KEY (`User_IDuser`)
    REFERENCES `mydb`.`User` (`IDuser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `idAddress` INT NOT NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zipCode` INT NULL,
  `User_IDuser` INT NOT NULL,
  PRIMARY KEY (`idAddress`),
  INDEX `fk_Address_User1_idx` (`User_IDuser` ASC) VISIBLE,
  CONSTRAINT `fk_Address_User1`
    FOREIGN KEY (`User_IDuser`)
    REFERENCES `mydb`.`User` (`IDuser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Promotion` (
  `idPromotion` INT NOT NULL,
  `discount` DECIMAL NOT NULL,
  `dateStart` DATE NOT NULL,
  `dateEnd` DATE NOT NULL,
  PRIMARY KEY (`idPromotion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `idOrder` INT NOT NULL,
  `subCost` DOUBLE NOT NULL,
  `User_IDuser` INT NOT NULL,
  `Card_idCard` INT NOT NULL,
  `Address_idAddress` INT NOT NULL,
  `orderDate` DATE NOT NULL,
  `Promotion_idPromotion` INT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `fk_Order_User1_idx` (`User_IDuser` ASC) VISIBLE,
  INDEX `fk_Order_Card1_idx` (`Card_idCard` ASC) VISIBLE,
  INDEX `fk_Order_Address1_idx` (`Address_idAddress` ASC) VISIBLE,
  INDEX `fk_Order_Promotion1_idx` (`Promotion_idPromotion` ASC) VISIBLE,
  CONSTRAINT `fk_Order_User1`
    FOREIGN KEY (`User_IDuser`)
    REFERENCES `mydb`.`User` (`IDuser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Card1`
    FOREIGN KEY (`Card_idCard`)
    REFERENCES `mydb`.`Card` (`idCard`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Address1`
    FOREIGN KEY (`Address_idAddress`)
    REFERENCES `mydb`.`Address` (`idAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Promotion1`
    FOREIGN KEY (`Promotion_idPromotion`)
    REFERENCES `mydb`.`Promotion` (`idPromotion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Promotion_has_Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Promotion_has_Books` (
  `Promotion_idPromotion` INT NOT NULL,
  `Books_ISBN` INT NOT NULL,
  PRIMARY KEY (`Promotion_idPromotion`, `Books_ISBN`),
  INDEX `fk_Promotion_has_Books_Books1_idx` (`Books_ISBN` ASC) VISIBLE,
  INDEX `fk_Promotion_has_Books_Promotion1_idx` (`Promotion_idPromotion` ASC) VISIBLE,
  CONSTRAINT `fk_Promotion_has_Books_Promotion1`
    FOREIGN KEY (`Promotion_idPromotion`)
    REFERENCES `mydb`.`Promotion` (`idPromotion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Promotion_has_Books_Books1`
    FOREIGN KEY (`Books_ISBN`)
    REFERENCES `mydb`.`Books` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order_has_Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order_has_Books` (
  `Order_idOrder` INT NOT NULL,
  `Books_ISBN` INT NOT NULL,
  PRIMARY KEY (`Order_idOrder`, `Books_ISBN`),
  INDEX `fk_Order_has_Books_Books1_idx` (`Books_ISBN` ASC) VISIBLE,
  INDEX `fk_Order_has_Books_Order1_idx` (`Order_idOrder` ASC) VISIBLE,
  CONSTRAINT `fk_Order_has_Books_Order1`
    FOREIGN KEY (`Order_idOrder`)
    REFERENCES `mydb`.`Order` (`idOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_has_Books_Books1`
    FOREIGN KEY (`Books_ISBN`)
    REFERENCES `mydb`.`Books` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UserCart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UserCart` (
  `idUserCart` INT NOT NULL,
  `User_IDuser` INT NOT NULL,
  `totalPrice` DOUBLE NOT NULL,
  PRIMARY KEY (`idUserCart`),
  INDEX `fk_UserCart_User1_idx` (`User_IDuser` ASC) VISIBLE,
  UNIQUE INDEX `User_IDuser_UNIQUE` (`User_IDuser` ASC) VISIBLE,
  UNIQUE INDEX `idUserCart_UNIQUE` (`idUserCart` ASC) VISIBLE,
  CONSTRAINT `fk_UserCart_User1`
    FOREIGN KEY (`User_IDuser`)
    REFERENCES `mydb`.`User` (`IDuser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UserCart_has_Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UserCart_has_Books` (
  `UserCart_idUserCart` INT NOT NULL,
  `Books_ISBN` INT NOT NULL,
  PRIMARY KEY (`UserCart_idUserCart`, `Books_ISBN`),
  INDEX `fk_UserCart_has_Books_Books1_idx` (`Books_ISBN` ASC) VISIBLE,
  INDEX `fk_UserCart_has_Books_UserCart1_idx` (`UserCart_idUserCart` ASC) VISIBLE,
  CONSTRAINT `fk_UserCart_has_Books_UserCart1`
    FOREIGN KEY (`UserCart_idUserCart`)
    REFERENCES `mydb`.`UserCart` (`idUserCart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserCart_has_Books_Books1`
    FOREIGN KEY (`Books_ISBN`)
    REFERENCES `mydb`.`Books` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
