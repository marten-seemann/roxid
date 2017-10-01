INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXTIMESTAMP`) VALUES
('roxid.blShowSidebarOnProductPageOnTablet', 'oxbaseshop', 'theme:roxid', 'blShowSidebarOnProductPageOnTablet', 'bool', '', CURRENT_TIMESTAMP()),
('roxid.blShowPartnersInSidebar', 'oxbaseshop', 'theme:roxid', 'blShowPartnersInSidebar', 'bool', 0x07, CURRENT_TIMESTAMP())
;

UPDATE `oxconfigdisplay` SET OXPOS=5 WHERE OXCFGVARNAME='blShowManufacturerOnProductPage' AND OXCFGMODULE='theme:roxid';
UPDATE `oxconfigdisplay` SET OXVARCONSTRAINT='disabled|basic|lens|inner' WHERE OXCFGVARNAME='sProductPicZoomMode' AND OXCFGMODULE='theme:roxid';

INSERT INTO `oxconfigdisplay` (`OXID`, `OXCFGMODULE`, `OXCFGVARNAME`, `OXGROUPING`, `OXVARCONSTRAINT`, `OXPOS`, `OXTIMESTAMP`) VALUES
('roxid.blShowSidebarOnProductPageOnTablet', 'theme:roxid', 'blShowSidebarOnProductPageOnTablet', 'productpage', '', 1, CURRENT_TIMESTAMP()),
('roxid.blShowPartnersInSidebar', 'theme:roxid', 'blShowPartnersInSidebar', 'roxid', '', 10, CURRENT_TIMESTAMP())
;
