SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema pkdd99
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `account` ;

CREATE TABLE IF NOT EXISTS `account` (
  `account_id` INT(11) NOT NULL,
  `district_id` INT(11) NOT NULL,
  `frequency` VARCHAR(100) NOT NULL,
  `date` INT(11) NOT NULL,
  `district_name` VARCHAR(100) NOT NULL,
  `region` VARCHAR(100) NOT NULL,
  `Inhabitants` INT(11) NOT NULL,
  `Municipalities499` INT(11) NOT NULL,
  `Municipalities500_1999` INT(11) NOT NULL,
  `Municipalities2000_9999` INT(11) NOT NULL,
  `Municipalities10000` INT(11) NOT NULL,
  `Cities` INT(11) NOT NULL,
  `Ratio_of_urban _Inh` DOUBLE NOT NULL,
  `Avg_Salary` INT(11) NOT NULL,
  `Unemploymant_Rate95` DOUBLE NOT NULL,
  `Unemploymant_Rate96` DOUBLE NOT NULL,
  `Enterpreuners` INT(11) NOT NULL,
  `Commited_Crimes95` INT(11) NOT NULL,
  `Commited_Crimes96` INT(11) NOT NULL,
  `All` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`account_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `date` ;

CREATE TABLE IF NOT EXISTS `date` (
  `SK_Day` INT(11) NOT NULL,
  `Day` DATE NOT NULL,
  `Month` VARCHAR(45) NOT NULL,
  `Year` INT(11) NOT NULL,
  `All` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`SK_Day`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `status` ;

CREATE TABLE IF NOT EXISTS `status` (
  `status` VARCHAR(45) NOT NULL,
  `All` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`status`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `loan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `loan` ;

CREATE TABLE IF NOT EXISTS `loan` (
  `loan_id` INT(11) NOT NULL,
  `account_id` INT(11) NOT NULL,
  `date` INT(11) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `amount` INT(11) NOT NULL,
  `duration` INT(11) NOT NULL,
  `payments` DOUBLE NOT NULL,
  PRIMARY KEY (`loan_id`),
  CONSTRAINT `account_fk`
    FOREIGN KEY (`account_id`)
    REFERENCES `account` (`account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `date_fk`
    FOREIGN KEY (`date`)
    REFERENCES `date` (`SK_Day`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `status_fk`
    FOREIGN KEY (`status`)
    REFERENCES `status` (`status`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `account_fk_idx` ON `loan` (`account_id` ASC);

CREATE INDEX `date_fk_idx` ON `loan` (`date` ASC);

CREATE INDEX `status_fk_idx` ON `loan` (`status` ASC);


-- -----------------------------------------------------
-- Table `payment_reason`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payment_reason` ;

CREATE TABLE IF NOT EXISTS `payment_reason` (
  `reason` VARCHAR(50) NOT NULL,
  `All` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`reason`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `orders` ;

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` INT(11) NOT NULL,
  `account_id` INT(11) NOT NULL,
  `bank_to` VARCHAR(15) NOT NULL,
  `account_to` INT(11) NOT NULL,
  `amount` DOUBLE NOT NULL,
  `Reason` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `account_fk2`
    FOREIGN KEY (`account_id`)
    REFERENCES `account` (`account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `reason_fk`
    FOREIGN KEY (`Reason`)
    REFERENCES `payment_reason` (`reason`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `account_fk2_idx` ON `orders` (`account_id` ASC);

CREATE INDEX `reason_fk_idx` ON `orders` (`Reason` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
