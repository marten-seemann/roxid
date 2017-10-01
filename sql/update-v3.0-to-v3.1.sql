INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXTIMESTAMP`) VALUES
('roxid.blShowManufacturerOnProductPage', 'oxbaseshop', 'theme:roxid', 'blShowManufacturerOnProductPage', 'bool', '', CURRENT_TIMESTAMP()),
('roxid.blShowPasswordConfirm', 'oxbaseshop', 'theme:roxid', 'blShowPasswordConfirm', 'bool', X'07', CURRENT_TIMESTAMP()),
('roxid.blShowFax', 'oxbaseshop', 'theme:roxid', 'blShowFax', 'bool', X'07', CURRENT_TIMESTAMP()),
('roxid.blShowFon', 'oxbaseshop', 'theme:roxid', 'blShowFon', 'bool', X'07', CURRENT_TIMESTAMP()),
('roxid.blShowMobFon', 'oxbaseshop', 'theme:roxid', 'blShowMobFon', 'bool', X'07', CURRENT_TIMESTAMP()),
('roxid.blShowPrivFon', 'oxbaseshop', 'theme:roxid', 'blShowPrivFon', 'bool', X'07', CURRENT_TIMESTAMP())
;

INSERT INTO `oxconfigdisplay` (`OXID`, `OXCFGMODULE`, `OXCFGVARNAME`, `OXGROUPING`, `OXVARCONSTRAINT`, `OXPOS`, `OXTIMESTAMP`) VALUES
('roxid.blShowManufacturerOnProductPage', 'theme:roxid', 'blShowManufacturerOnProductPage', 'productpage', '', 1, CURRENT_TIMESTAMP()),
('roxid.blShowPasswordConfirm', 'theme:roxid', 'blShowPasswordConfirm', 'forms', '', 1, CURRENT_TIMESTAMP()),
('roxid.blShowFax', 'theme:roxid', 'blShowFax', 'forms', '', 11, CURRENT_TIMESTAMP()),
('roxid.blShowFon', 'theme:roxid', 'blShowFon', 'forms', '', 21, CURRENT_TIMESTAMP()),
('roxid.blShowMobFon', 'theme:roxid', 'blShowMobFon', 'forms', '', 22, CURRENT_TIMESTAMP()),
('roxid.blShowPrivFon', 'theme:roxid', 'blShowPrivFon', 'forms', '', 23, CURRENT_TIMESTAMP())
;

UPDATE `oxconfigdisplay` SET `OXPOS`=20 WHERE `OXCFGVARNAME`='blShowProductAmountControls' AND `OXCFGMODULE`='theme:roxid';
UPDATE `oxconfigdisplay` SET `OXPOS`=50 WHERE `OXCFGVARNAME`='blShowReviewTab' AND `OXCFGMODULE`='theme:roxid';
UPDATE `oxconfigdisplay` SET `OXGROUPING`='forms' WHERE `OXCFGVARNAME`='blShowBirthdayFields' AND `OXCFGMODULE`='theme:roxid';
