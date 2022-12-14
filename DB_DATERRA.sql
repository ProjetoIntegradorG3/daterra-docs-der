-- MySQL Script generated by MySQL Workbench
-- Tue Oct 11 18:52:30 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DB_DATERRA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DB_DATERRA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB_DATERRA` DEFAULT CHARACTER SET utf8 ;
USE `DB_DATERRA` ;

-- -----------------------------------------------------
-- Table `DB_DATERRA`.`TB_CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_DATERRA`.`TB_CATEGORIA` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `TIPO` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_DATERRA`.`TB_USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_DATERRA`.`TB_USUARIO` (
  `ID` BIGINT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(255) NOT NULL,
  `LOGIN` VARCHAR(255) NOT NULL,
  `SENHA` VARCHAR(255) NOT NULL,
  `CEP` VARCHAR(8) NOT NULL,
  `CPF` VARCHAR(255) NULL,
  `CNPJ` VARCHAR(255) NULL,
  `TIPOUSER` VARCHAR(255) NULL,
  `FOTO` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_DATERRA`.`TB_PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_DATERRA`.`TB_PRODUTO` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(255) NOT NULL,
  `DESCRICAO` VARCHAR(1000) NOT NULL,
  `PRECO` DECIMAL(10,2) NOT NULL,
  `FOTO` VARCHAR(255) NULL,
  `QT` BIGINT NOT NULL,
  `TB_CATEGORIA_id` BIGINT NOT NULL,
  `TB_USUARIO_ID` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_TB_PRODUTO_TB_CATEGORIA_idx` (`TB_CATEGORIA_id` ASC) VISIBLE,
  INDEX `fk_TB_PRODUTO_TB_USUARIO1_idx` (`TB_USUARIO_ID` ASC) VISIBLE,
  CONSTRAINT `fk_TB_PRODUTO_TB_CATEGORIA`
    FOREIGN KEY (`TB_CATEGORIA_id`)
    REFERENCES `DB_DATERRA`.`TB_CATEGORIA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_PRODUTO_TB_USUARIO1`
    FOREIGN KEY (`TB_USUARIO_ID`)
    REFERENCES `DB_DATERRA`.`TB_USUARIO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
