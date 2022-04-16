#ALTER TABLE `qgx_baas`.`transactions_pix` ADD COLUMN `account_name` VARCHAR(255) AFTER `account_id`;
#ALTER TABLE `qgx_baas`.`transactions_pix` ADD COLUMN `account_document` VARCHAR(255) AFTER `account_name`;
#ALTER TABLE `qgx_baas`.`transactions_pix` ADD COLUMN `document_id` VARCHAR(255) AFTER `account_document`;
#ALTER TABLE `qgx_baas`.`transactions_pix` ADD COLUMN `expiration_in_seconds` VARCHAR(255) AFTER `document_id`;
#ALTER TABLE `qgx_baas`.`transactions_pix` ADD COLUMN `validate_key` VARCHAR(255) AFTER `expiration_in_seconds`;
#ALTER TABLE `qgx_baas`.`transactions_pix` ADD COLUMN `payer_ispb` VARCHAR(255) AFTER `validate_key`;
#ALTER TABLE `qgx_baas`.`transactions_pix` ADD COLUMN `payer_routing_number` VARCHAR(255) AFTER `payer_ispb`;
#ALTER TABLE `qgx_baas`.`transactions_pix` ADD COLUMN `payer_account_number` VARCHAR(255) AFTER `payer_routing_number`;
#ALTER TABLE `qgx_baas`.`transactions_pix` ADD COLUMN `payer_bank_type` VARCHAR(255) AFTER `payer_account_number`;
ALTER TABLE `qgx_baas`.`transactions_pix` ADD COLUMN `paid_at` VARCHAR(255) AFTER `payer_bank_type`;

