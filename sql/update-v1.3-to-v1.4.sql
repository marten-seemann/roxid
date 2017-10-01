INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXTIMESTAMP`) VALUES
('roxid.blMobileNavbarMode', 'oxbaseshop', 'theme:roxid', 'blMobileNavbarMode', 'select', 0x55290347e5ba587f72, CURRENT_TIMESTAMP()),
('roxid.blShowReviewTab', 'oxbaseshop', 'theme:roxid', 'blShowReviewTab', 'bool', '', CURRENT_TIMESTAMP())
;

INSERT INTO `oxconfigdisplay` (`OXID`, `OXCFGMODULE`, `OXCFGVARNAME`, `OXGROUPING`, `OXVARCONSTRAINT`, `OXPOS`, `OXTIMESTAMP`) VALUES
('roxid.blMobileNavbarMode', 'theme:roxid', 'blMobileNavbarMode', 'roxid', 'bootstrap|panel', 30, CURRENT_TIMESTAMP()),
('roxid.blShowReviewTab', 'theme:roxid', 'blShowReviewTab', 'roxid', '', 40, CURRENT_TIMESTAMP())
;
