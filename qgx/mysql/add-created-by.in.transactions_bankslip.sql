ALTER TABLE `qgx_baas`.`transactions_bankslip` 
ADD COLUMN `created_by_uuid` VARCHAR(255)
AFTER `description`,
ADD COLUMN `created_by_info` VARCHAR(255) 
AFTER `created_by_uuid`;