-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_LucaSantorini
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_LucaSantorini
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_LucaSantorini` DEFAULT CHARACTER SET utf8 ;
USE `db_LucaSantorini` ;

-- -----------------------------------------------------
-- Table `db_LucaSantorini`.`rol_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_LucaSantorini`.`rol_usuario` (
  `id_rol` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_LucaSantorini`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_LucaSantorini`.`usuario` (
  `id_usuario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_completo` VARCHAR(100) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `rol_usuario_id_rol` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_usuario_rol_usuario1_idx` (`rol_usuario_id_rol` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_rol_usuario1`
    FOREIGN KEY (`rol_usuario_id_rol`)
    REFERENCES `db_LucaSantorini`.`rol_usuario` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_LucaSantorini`.`mensaje_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_LucaSantorini`.`mensaje_usuario` (
  `id_mensaje` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `email` VARCHAR(150) NULL,
  `numero_telefono` VARCHAR(45) NULL,
  `mensaje` VARCHAR(200) NULL,
  `usuario_idusuario` INT UNSIGNED NULL,
  PRIMARY KEY (`id_mensaje`),
  INDEX `fk_mensaje_usuario_usuario_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_mensaje_usuario_usuario`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `db_LucaSantorini`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_LucaSantorini`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_LucaSantorini`.`direccion` (
  `id_direccion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(200) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `colonia` VARCHAR(100) NOT NULL,
  `ciudad` VARCHAR(100) NOT NULL,
  `codigo_postal` INT NOT NULL,
  `estado` VARCHAR(100) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `otros_detalles` VARCHAR(200) NULL,
  `usuario_id_usuario` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_direccion`),
  INDEX `fk_direccion_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_direccion_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `db_LucaSantorini`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_LucaSantorini`.`entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_LucaSantorini`.`entrega` (
  `id_entrega` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha_reportada` DATE NULL,
  `codigo_seguimiento` VARCHAR(200) NULL,
  `otros_detalles` VARCHAR(200) NULL,
  PRIMARY KEY (`id_entrega`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_LucaSantorini`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_LucaSantorini`.`pedido` (
  `id_pedido` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `monto_total` DECIMAL NULL,
  `metodo_pago` VARCHAR(45) NULL,
  `fecha_solicitud` DATE NULL,
  `fecha_pago` DATE NULL,
  `usuario_id_usuario` INT UNSIGNED NOT NULL,
  `entrega_id_entrega` INT UNSIGNED NOT NULL,
  `direccion_id_direccion` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_pedido_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
  INDEX `fk_pedido_entrega1_idx` (`entrega_id_entrega` ASC) VISIBLE,
  INDEX `fk_pedido_direccion1_idx` (`direccion_id_direccion` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `db_LucaSantorini`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_entrega1`
    FOREIGN KEY (`entrega_id_entrega`)
    REFERENCES `db_LucaSantorini`.`entrega` (`id_entrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_direccion1`
    FOREIGN KEY (`direccion_id_direccion`)
    REFERENCES `db_LucaSantorini`.`direccion` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_LucaSantorini`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_LucaSantorini`.`producto` (
  `id_producto` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `codigo_producto` INT NULL,
  `nombre` VARCHAR(100) NULL,
  `talla` VARCHAR(100) NULL,
  `color` VARCHAR(100) NULL,
  `descripcion` VARCHAR(200) NULL,
  `precio` DECIMAL NULL,
  PRIMARY KEY (`id_producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_LucaSantorini`.`pedido_has_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_LucaSantorini`.`pedido_has_producto` (
  `id_pedido_has_producto` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cantidad` INT NULL,
  `otros_detalles` VARCHAR(200) NULL,
  `pedido_id_pedido` INT UNSIGNED NOT NULL,
  `producto_id_producto` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_pedido_has_producto`),
  INDEX `fk_pedido_has_producto_pedido1_idx` (`pedido_id_pedido` ASC) VISIBLE,
  INDEX `fk_pedido_has_producto_producto1_idx` (`producto_id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_has_producto_pedido1`
    FOREIGN KEY (`pedido_id_pedido`)
    REFERENCES `db_LucaSantorini`.`pedido` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_has_producto_producto1`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `db_LucaSantorini`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_LucaSantorini`.`foto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_LucaSantorini`.`foto` (
  `id_foto` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ruta` VARCHAR(300) NULL,
  `producto_id_producto` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_foto`),
  INDEX `fk_foto_producto1_idx` (`producto_id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_foto_producto1`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `db_LucaSantorini`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
