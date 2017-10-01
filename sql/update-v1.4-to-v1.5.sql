UPDATE `oxconfigdisplay` SET `OXVARCONSTRAINT` = 'blue|orange|white|own' WHERE `OXCFGMODULE` = 'theme:roxid' AND `OXCFGVARNAME`='blColorTheme';

INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXTIMESTAMP`) VALUES
('roxid.blRetinaImages', 'oxbaseshop', 'theme:roxid', 'blRetinaImages', 'bool', X'07', CURRENT_TIMESTAMP())
;

INSERT INTO `oxconfigdisplay` (`OXID`, `OXCFGMODULE`, `OXCFGVARNAME`, `OXGROUPING`, `OXVARCONSTRAINT`, `OXPOS`, `OXTIMESTAMP`) VALUES
('roxid.blRetinaImages', 'theme:roxid', 'blRetinaImages', 'images', '', 1, CURRENT_TIMESTAMP())
;
