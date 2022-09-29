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
-- Table `mydb`.`ADMINISTRADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ADMINISTRADOR` (
  `idADMINISTRADOR` INT NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idADMINISTRADOR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asignacion de citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignacion de citas` (
  `idAsignacion de citas` INT NOT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `Doctor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAsignacion de citas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consulta de citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consulta de citas` (
  `idConsulta de citas` INT NOT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `Paciente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idConsulta de citas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paciente` (
  `idPaciente` INT NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `ADMINISTRADOR_idADMINISTRADOR` INT NOT NULL,
  `Asignacion de citas_idAsignacion de citas` INT NOT NULL,
  `Consulta de citas_idConsulta de citas` INT NOT NULL,
  PRIMARY KEY (`idPaciente`, `ADMINISTRADOR_idADMINISTRADOR`, `Asignacion de citas_idAsignacion de citas`, `Consulta de citas_idConsulta de citas`),
  INDEX `fk_Paciente_ADMINISTRADOR_idx` (`ADMINISTRADOR_idADMINISTRADOR` ASC) VISIBLE,
  INDEX `fk_Paciente_Asignacion de citas1_idx` (`Asignacion de citas_idAsignacion de citas` ASC) VISIBLE,
  INDEX `fk_Paciente_Consulta de citas1_idx` (`Consulta de citas_idConsulta de citas` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_ADMINISTRADOR`
    FOREIGN KEY (`ADMINISTRADOR_idADMINISTRADOR`)
    REFERENCES `mydb`.`ADMINISTRADOR` (`idADMINISTRADOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_Asignacion de citas1`
    FOREIGN KEY (`Asignacion de citas_idAsignacion de citas`)
    REFERENCES `mydb`.`Asignacion de citas` (`idAsignacion de citas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_Consulta de citas1`
    FOREIGN KEY (`Consulta de citas_idConsulta de citas`)
    REFERENCES `mydb`.`Consulta de citas` (`idConsulta de citas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Historia clinica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Historia clinica` (
  `idHistoria clinica` INT NOT NULL,
  `Diagnostico` VARCHAR(45) NOT NULL,
  `Tratamiento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idHistoria clinica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doctor` (
  `idDoctor` INT NOT NULL,
  `Contarseña` VARCHAR(45) NOT NULL,
  `ADMINISTRADOR_idADMINISTRADOR` INT NOT NULL,
  `Consulta de citas_idConsulta de citas` INT NOT NULL,
  `Historia clinica_idHistoria clinica` INT NOT NULL,
  PRIMARY KEY (`idDoctor`, `ADMINISTRADOR_idADMINISTRADOR`, `Consulta de citas_idConsulta de citas`, `Historia clinica_idHistoria clinica`),
  INDEX `fk_Doctor_ADMINISTRADOR1_idx` (`ADMINISTRADOR_idADMINISTRADOR` ASC) VISIBLE,
  INDEX `fk_Doctor_Consulta de citas1_idx` (`Consulta de citas_idConsulta de citas` ASC) VISIBLE,
  INDEX `fk_Doctor_Historia clinica1_idx` (`Historia clinica_idHistoria clinica` ASC) VISIBLE,
  CONSTRAINT `fk_Doctor_ADMINISTRADOR1`
    FOREIGN KEY (`ADMINISTRADOR_idADMINISTRADOR`)
    REFERENCES `mydb`.`ADMINISTRADOR` (`idADMINISTRADOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_Consulta de citas1`
    FOREIGN KEY (`Consulta de citas_idConsulta de citas`)
    REFERENCES `mydb`.`Consulta de citas` (`idConsulta de citas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_Historia clinica1`
    FOREIGN KEY (`Historia clinica_idHistoria clinica`)
    REFERENCES `mydb`.`Historia clinica` (`idHistoria clinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
