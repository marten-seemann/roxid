INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXTIMESTAMP`) VALUES
('roxid.blShowHomeInNavigation', 'oxbaseshop', 'theme:roxid', 'blShowHomeInNavigation', 'bool', 0x07, CURRENT_TIMESTAMP()),
('roxid.blShowNavbarSubMenus', 'oxbaseshop', 'theme:roxid', 'blShowNavbarSubMenus', 'bool', '', CURRENT_TIMESTAMP()),
('roxid.blShowProductAmountControls', 'oxbaseshop', 'theme:roxid', 'blShowProductAmountControls', 'bool', '', CURRENT_TIMESTAMP())
;

INSERT INTO `oxconfigdisplay` (`OXID`, `OXCFGMODULE`, `OXCFGVARNAME`, `OXGROUPING`, `OXVARCONSTRAINT`, `OXPOS`, `OXTIMESTAMP`) VALUES
('roxid.blShowHomeInNavigation', 'theme:roxid', 'blShowHomeInNavigation', 'roxid', '', 50, CURRENT_TIMESTAMP()),
('roxid.blShowNavbarSubMenus', 'theme:roxid', 'blShowNavbarSubMenus', 'roxid', '', 3, CURRENT_TIMESTAMP()),
('roxid.blShowProductAmountControls', 'theme:roxid', 'blShowProductAmountControls', 'roxid', '', 45, CURRENT_TIMESTAMP())
;
