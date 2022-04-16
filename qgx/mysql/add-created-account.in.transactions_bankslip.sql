ALTER TABLE `qgx_baas`.`transactions_bankslip` 
-- ADD COLUMN `account_document` VARCHAR(255) 
-- AFTER `integration`,
-- ADD COLUMN `account_name` VARCHAR(255) 
-- AFTER `account_document`,
-- ADD COLUMN `account_uuid` VARCHAR(255) 
-- AFTER `account_name`,
ADD COLUMN `created_by_document` VARCHAR(255) 
AFTER `account_uuid`;

