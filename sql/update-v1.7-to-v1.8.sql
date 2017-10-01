INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXTIMESTAMP`) VALUES
('roxid.blToBasketAjax', 'oxbaseshop', 'theme:roxid', 'blToBasketAjax', 'bool', '', CURRENT_TIMESTAMP())
;

INSERT INTO `oxconfigdisplay` (`OXID`, `OXCFGMODULE`, `OXCFGVARNAME`, `OXGROUPING`, `OXVARCONSTRAINT`, `OXPOS`, `OXTIMESTAMP`) VALUES
('roxid.blToBasketAjax', 'theme:roxid', 'blToBasketAjax', 'basket', '', 18, CURRENT_TIMESTAMP())
;

-- remove unsupported "popup" option when product is put into basket
UPDATE oxconfigdisplay SET OXVARCONSTRAINT='0|1|3' WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='iNewBasketItemMessage';

UPDATE oxconfigdisplay SET OXGROUPING='basket' WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='blMinibasketDisplay';
UPDATE oxconfigdisplay SET OXGROUPING='basket' WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='iNewBasketItemMessage';
