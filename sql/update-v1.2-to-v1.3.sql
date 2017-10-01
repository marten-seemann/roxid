INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXTIMESTAMP`) VALUES
('roxid.sStartPLDTPhone', 'oxbaseshop', 'theme:roxid', 'sStartPageListDisplayTypePhone', 'select', 0x25f9f804, CURRENT_TIMESTAMP()),
('roxid.sDefaultDTPhone', 'oxbaseshop', 'theme:roxid', 'sDefaultListDisplayTypePhone', 'select', 0x25f9f804, CURRENT_TIMESTAMP())
;

INSERT INTO `oxconfigdisplay` (`OXID`, `OXCFGMODULE`, `OXCFGVARNAME`, `OXGROUPING`, `OXVARCONSTRAINT`, `OXPOS`, `OXTIMESTAMP`) VALUES
('roxid.sDefaultLDTPhone', 'theme:roxid', 'sDefaultListDisplayTypePhone', 'roxid', 'line|grid', 23, CURRENT_TIMESTAMP()),
('roxid.sStartPLDTPhone', 'theme:roxid', 'sStartPageListDisplayTypePhone', 'roxid', 'line|grid', 24, CURRENT_TIMESTAMP())
;
