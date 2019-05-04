-- -----------------------------------------------------
-- Table `mydb`.`CLIENTES`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`CLIENTES` (
  `IDCLIENTE` INT NOT NULL ,
  `NOMBRE` VARCHAR(45) NULL ,
  PRIMARY KEY (`IDCLIENTE`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BANCO`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`BANCO` (
  `IDBANCO` INT NOT NULL ,
  `NOMBRE` VARCHAR(45) NULL ,
  PRIMARY KEY (`IDBANCO`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUENTA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`CUENTA` (
  `IDCUENTA` INT NOT NULL ,
  `TIPOCUENTA` VARCHAR(45) NULL ,
  `CLIENTES_IDCLIENTE` INT NOT NULL ,
  `BANCO_IDBANCO` INT NOT NULL ,
  `SALDO` DOUBLE NULL ,
  PRIMARY KEY (`IDCUENTA`, `CLIENTES_IDCLIENTE`, `BANCO_IDBANCO`) ,
  INDEX `fk_CUENTA_CLIENTES_idx` (`CLIENTES_IDCLIENTE` ASC) ,
  INDEX `fk_CUENTA_BANCO1_idx` (`BANCO_IDBANCO` ASC) ,
  CONSTRAINT `fk_CUENTA_CLIENTES`
    FOREIGN KEY (`CLIENTES_IDCLIENTE` )
    REFERENCES `mydb`.`CLIENTES` (`IDCLIENTE` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUENTA_BANCO1`
    FOREIGN KEY (`BANCO_IDBANCO` )
    REFERENCES `mydb`.`BANCO` (`IDBANCO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
