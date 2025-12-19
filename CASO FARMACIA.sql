-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema oltp_farmacia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema oltp_farmacia
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS oltp_farmacia
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE oltp_farmacia;

-- -----------------------------------------------------
-- Table `oltp_farmacia`.`CLIENTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oltp_farmacia`.`CLIENTE` ;

CREATE TABLE IF NOT EXISTS `oltp_farmacia`.`CLIENTE` (
  `idCLIENTE` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `TIPO DOCUMENTO` VARCHAR(45) NULL,
  `NUMERO DOCUMENTO` VARCHAR(45) NULL,
  `EMAIL` VARCHAR(45) NULL,
  `FECHA_REGISTRO` DATE NULL,
  PRIMARY KEY (`idCLIENTE`),
  UNIQUE INDEX `EMAIL_UNIQUE` (`EMAIL` ASC) ,
  UNIQUE INDEX `DOCUMENTO_UNIQUE` (`NUMERO DOCUMENTO` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oltp_farmacia`.`MARCA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oltp_farmacia`.`MARCA` ;

CREATE TABLE IF NOT EXISTS `oltp_farmacia`.`MARCA` (
  `idMARCA` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `DESCRIPCION` VARCHAR(45) NULL,
  `LABORATORIO` VARCHAR(45) NULL,
  PRIMARY KEY (`idMARCA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oltp_farmacia`.`MEDICAMENTOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oltp_farmacia`.`MEDICAMENTOS` ;

CREATE TABLE IF NOT EXISTS `oltp_farmacia`.`MEDICAMENTOS` (
  `idMEDICAMENTO` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `DESCRIPCION` VARCHAR(45) NULL,
  `idMARCA` INT NULL,
  `PRESENTACION` VARCHAR(45) NULL,
  `PESO` DECIMAL(10,2) NULL,
  PRIMARY KEY (`idMEDICAMENTO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oltp_farmacia`.`UBICACION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oltp_farmacia`.`UBICACION` ;

CREATE TABLE IF NOT EXISTS `oltp_farmacia`.`UBICACION` (
  `idUBICACION` INT NOT NULL,
  `DISTRITO` VARCHAR(45) NULL,
  `PROVINCIA` VARCHAR(45) NULL,
  `DEPARTAMENTO` VARCHAR(45) NULL,
  PRIMARY KEY (`idUBICACION`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oltp_farmacia`.`TIPO TIENDA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oltp_farmacia`.`TIPO TIENDA` ;

CREATE TABLE IF NOT EXISTS `oltp_farmacia`.`TIPO TIENDA` (
  `idTIPO TIENDA` INT NOT NULL,
  `TIPO` VARCHAR(45) NULL,
  PRIMARY KEY (`idTIPO TIENDA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oltp_farmacia`.`SEDE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oltp_farmacia`.`SEDE` ;

CREATE TABLE IF NOT EXISTS `oltp_farmacia`.`SEDE` (
  `idSEDE` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `DIRECCION` VARCHAR(45) NULL,
  `idUBICACION` INT NULL,
  `mts` DOUBLE NULL,
  `PISOS` INT NULL,
  `id TIPO TIENDA` INT NULL,
  PRIMARY KEY (`idSEDE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oltp_farmacia`.`DESPACHADOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oltp_farmacia`.`DESPACHADOR` ;

CREATE TABLE IF NOT EXISTS `oltp_farmacia`.`DESPACHADOR` (
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
-- Table `oltp_farmacia`.`FECHA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oltp_farmacia`.`FECHA` ;

CREATE TABLE IF NOT EXISTS `oltp_farmacia`.`FECHA` (
  `idFecha` INT NOT NULL,
  `FECHA` DATE NULL,
  `MES` VARCHAR(20) NULL,
  `NUMMES` INT NULL,
  `DIA` INT NULL,
  `ANIO` INT NULL,
  PRIMARY KEY (`idFecha`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oltp_farmacia`.`MEDICO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oltp_farmacia`.`MEDICO` ;

CREATE TABLE IF NOT EXISTS `oltp_farmacia`.`MEDICO` (
  `idMEDICO` INT NOT NULL,
  `CMP MEDICO` VARCHAR(45) NULL,
  PRIMARY KEY (`idMEDICO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oltp_farmacia`.`VENTAS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oltp_farmacia`.`VENTAS` ;

CREATE TABLE IF NOT EXISTS `oltp_farmacia`.`VENTAS` (
  `idVenta` INT NOT NULL,
  `idFECHA` INT NULL,
  `idSEDE` INT NULL,
  `idDESPACHADOR` INT NULL,
  `idMEDICO` INT NULL,
  `idCLIENTE` INT NULL,
  PRIMARY KEY (`idVenta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oltp_farmacia`.`DETALLE VENTAS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oltp_farmacia`.`DETALLE VENTAS` ;

CREATE TABLE IF NOT EXISTS `oltp_farmacia`.`DETALLE VENTAS` (
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
