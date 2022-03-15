ALTER TABLE `qgx_baas`.`transactions_bankslip` 
ADD COLUMN `created_by_document` VARCHAR(255),
ADD COLUMN `created_by_info` VARCHAR(255) 
AFTER `description`;