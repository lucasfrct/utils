ALTER TABLE `qgx_baas`.`transactions_bankslip` 
ADD COLUMN `created_by_document` VARCHAR(14)
AFTER `description`,
ADD COLUMN `created_by_info` VARCHAR(100) 
AFTER `created_by_document`;

ALTER TABLE `qgx_baas`.`transactions_bankslip` DROP COLUMN `created_by_document`;
ALTER TABLE `qgx_baas`.`transactions_bankslip` DROP COLUMN `created_by_info`;


