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
-- Table `mydb`.`CLIENTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CLIENTE` ;

CREATE TABLE IF NOT EXISTS `mydb`.`CLIENTE` (
  `idCLIENTE` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `TIPO DOCUMENTO` VARCHAR(45) NULL,
  `NUMERO DOCUMENTO` VARCHAR(45) NULL,
  `EMAIL` VARCHAR(45) NULL,
  `FECHA_REGISTRO` DATE NULL,
  PRIMARY KEY (`idCLIENTE`),
  UNIQUE INDEX `EMAIL_UNIQUE` (`EMAIL` ASC) VISIBLE,
  UNIQUE INDEX `DOCUMENTO_UNIQUE` (`NUMERO DOCUMENTO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MARCA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MARCA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MARCA` (
  `idMARCA` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `DESCRIPCION` VARCHAR(45) NULL,
  `LABORATORIO` VARCHAR(45) NULL,
  PRIMARY KEY (`idMARCA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MEDICAMENTOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MEDICAMENTOS` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MEDICAMENTOS` (
  `idMEDICAMENTO` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `DESCRIPCION` VARCHAR(45) NULL,
  `idMARCA` INT NULL,
  `PRESENTACION` VARCHAR(45) NULL,
  `PESO` DECIMAL(10,2) NULL,
  PRIMARY KEY (`idMEDICAMENTO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UBICACION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UBICACION` ;

CREATE TABLE IF NOT EXISTS `mydb`.`UBICACION` (
  `idUBICACION` INT NOT NULL,
  `DISTRITO` VARCHAR(45) NULL,
  `PROVINCIA` VARCHAR(45) NULL,
  `DEPARTAMENTO` VARCHAR(45) NULL,
  PRIMARY KEY (`idUBICACION`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPO TIENDA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TIPO TIENDA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TIPO TIENDA` (
  `idTIPO TIENDA` INT NOT NULL,
  `TIPO` VARCHAR(45) NULL,
  PRIMARY KEY (`idTIPO TIENDA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SEDE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SEDE` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SEDE` (
  `idSEDE` INT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `DIRECCION` VARCHAR(45) NULL,
  `idUBICACION` INT NULL,
  `mts` DOUBLE NULL,
  `PISOS` INT NULL,
  `id TIPO TIENDA` INT NULL,
  PRIMARY KEY (`idSEDE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DESPACHADOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DESPACHADOR` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DESPACHADOR` (
  `idDESPACHADOR` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `APELLIDOS` VARCHAR(45) NULL,
  `TIPO DOCUMENTO` VARCHAR(45) NULL,
  `NUMERO DOCUMENTO` VARCHAR(45) NULL,
  `FECHA_INGRESO` DATE NULL,
  `FECHA_NACIMIENTO` DATE NULL,
  PRIMARY KEY (`idDESPACHADOR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FECHA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FECHA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`FECHA` (
  `idFecha` INT NOT NULL,
  `FECHA` DATE NULL,
  `MES` VARCHAR(20) NULL,
  `NUMMES` INT NULL,
  `DIA` INT NULL,
  `ANIO` INT NULL,
  PRIMARY KEY (`idFecha`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MEDICO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MEDICO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MEDICO` (
  `idMEDICO` INT NOT NULL,
  `CMP MEDICO` VARCHAR(45) NULL,
  PRIMARY KEY (`idMEDICO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VENTAS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`VENTAS` ;

CREATE TABLE IF NOT EXISTS `mydb`.`VENTAS` (
  `idVenta` INT NULL,
  `idFECHA` INT NULL,
  `idSEDE` INT NULL,
  `idDESPACHADOR` INT NULL,
  `idMEDICO` INT NULL,
  `idCLIENTE` INT NULL,
  PRIMARY KEY (`idVenta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DETALLE VENTAS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DETALLE VENTAS` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DETALLE VENTAS` (
  `idDETALLE VENTA` INT NOT NULL,
  `idVENTA` INT NULL,
  `idMEDICAMENTIO` INT NULL,
  `CANTIDAD` INT NULL,
  `PRECIO` DOUBLE NULL,
  PRIMARY KEY (`idDETALLE VENTA`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
