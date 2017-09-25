-- MySQL Script generated by MySQL Workbench
-- 09/04/17 11:06:08
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Campeonato
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Campeonato
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Campeonato` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Campeonato` ;

-- -----------------------------------------------------
-- Table `Campeonato`.`campeonato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Campeonato`.`campeonato` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `pontuacao` INT NULL,
  `num_rodadas` INT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Campeonato`.`times`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Campeonato`.`times` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `data_criacao` DATE NULL,
  `num_jogadores` INT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Campeonato`.`jogadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Campeonato`.`jogadores` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `camisa` INT NULL,
  `times_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_jogadores_times1_idx` (`times_codigo` ASC),
  CONSTRAINT `fk_jogadores_times1`
    FOREIGN KEY (`times_codigo`)
    REFERENCES `Campeonato`.`times` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Campeonato`.`pontuacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Campeonato`.`pontuacao` (
  `campeonato_codigo` INT NOT NULL,
  `times_codigo` INT NOT NULL,
  `pontuacao` INT NULL,
  PRIMARY KEY (`times_codigo`),
  INDEX `fk_campeonato_has_times_times1_idx` (`times_codigo` ASC),
  INDEX `fk_campeonato_has_times_campeonato_idx` (`campeonato_codigo` ASC),
  CONSTRAINT `fk_campeonato_has_times_campeonato`
    FOREIGN KEY (`campeonato_codigo`)
    REFERENCES `Campeonato`.`campeonato` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_campeonato_has_times_times1`
    FOREIGN KEY (`times_codigo`)
    REFERENCES `Campeonato`.`times` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
