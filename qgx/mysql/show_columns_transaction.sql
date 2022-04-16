USE qgx_baas;
CREATE TABLE transactions_escrow (
  id int(11) NOT NULL AUTO_INCREMENT,
  uuid varchar(36) NOT NULL,
  type varchar(10) DEFAULT NULL,
  account_uuid varchar(36) DEFAULT NULL,
  account_name varchar(100) DEFAULT NULL,
  account_document varchar(14) DEFAULT NULL,
  sub_ip varchar(9) DEFAULT NULL,
  integration varchar(15) NOT NULL DEFAULT 'BANCOARBI',
  amount int(11) NOT NULL,
  status varchar(20) NOT NULL,
  transaction json DEFAULT NULL,
  created_at varchar(20) NOT NULL,
  updated_at varchar(20) DEFAULT NULL,
  deleted tinyint(1) NOT NULL DEFAULT '0',
  creationtimestamp timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  lasttimestamp timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  external_id varchar(40) DEFAULT NULL,
  recipient_document varchar(14) DEFAULT NULL,
  recipient_name varchar(100) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uuid_UNIQUE (uuid)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1