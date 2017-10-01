INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXTIMESTAMP`) VALUES
('roxid.sProductPicViewerBgOpacity', 'oxbaseshop', 'theme:roxid', 'sProductPicViewerBgOpacity', 'str', X'DEC4F0', CURRENT_TIMESTAMP()),
('roxid.blShowMobileNavbarOnTablet', 'oxbaseshop', 'theme:roxid', 'blShowMobileNavbarOnTablet', 'bool', 0x07, CURRENT_TIMESTAMP()),
('roxid.sMobileNavbarPosition', 'oxbaseshop', 'theme:roxid', 'sMobileNavbarPosition', 'select', X'949A1E4A', CURRENT_TIMESTAMP()),
('roxid.sMobileNavbarColortheme', 'oxbaseshop', 'theme:roxid', 'sMobileNavbarColortheme', 'select', X'935FAFA812C234E27CB399', CURRENT_TIMESTAMP()),
('roxid.blMobileNavbarShowCounter', 'oxbaseshop', 'theme:roxid', 'blMobileNavbarShowCounter', 'bool', '', CURRENT_TIMESTAMP()),
('roxid.blMobileNavbarSlidingSubmenus', 'oxbaseshop', 'theme:roxid', 'blMobileNavbarSlidingSubmenus', 'bool', 0x07, CURRENT_TIMESTAMP()),
('roxid.sMobileNavbarPageDim', 'oxbaseshop', 'theme:roxid', 'sMobileNavbarPageDim', 'select', X'7900FDF51E', CURRENT_TIMESTAMP()),
('roxid.blMobileNavbarShowBasket', 'oxbaseshop', 'theme:roxid', 'blMobileNavbarShowBasket', 'bool', 0x07, CURRENT_TIMESTAMP()),
('roxid.blMobileNavbarShowAccount', 'oxbaseshop', 'theme:roxid', 'blMobileNavbarShowAccount', 'bool', 0x07, CURRENT_TIMESTAMP()),
('roxid.blMobileNavbarShowContact', 'oxbaseshop', 'theme:roxid', 'blMobileNavbarShowContact', 'bool', 0x07, CURRENT_TIMESTAMP()),
('roxid.blMobileNavbarShowShopName', 'oxbaseshop', 'theme:roxid', 'blMobileNavbarShowShopName', 'bool', 0x07, CURRENT_TIMESTAMP())
;

INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXTIMESTAMP`) VALUES ('roxid.sqlVersion', 'oxbaseshop', 'theme:roxid', 'sqlVersion', 'str', '', CURRENT_TIMESTAMP());

INSERT INTO `oxconfigdisplay` (`OXID`, `OXCFGMODULE`, `OXCFGVARNAME`, `OXGROUPING`, `OXVARCONSTRAINT`, `OXPOS`, `OXTIMESTAMP`) VALUES
('roxid.sProductPicViewerBgOpacity', 'theme:roxid', 'sProductPicViewerBgOpacity', 'productpage', '', 15, CURRENT_TIMESTAMP()),
('roxid.blShowMobileNavbarOnTablet', 'theme:roxid', 'blShowMobileNavbarOnTablet', 'navigation_mobile', '', 1, CURRENT_TIMESTAMP()),
('roxid.sMobileNavbarPosition', 'theme:roxid', 'sMobileNavbarPosition', 'navigation_mobile', 'left|right|top|bottom', 5, CURRENT_TIMESTAMP()),
('roxid.sMobileNavbarColortheme', 'theme:roxid', 'sMobileNavbarColortheme', 'navigation_mobile', 'theme-light|theme-dark|theme-black|theme-white', 10, CURRENT_TIMESTAMP()),
('roxid.blMobileNavbarShowCounter', 'theme:roxid', 'blMobileNavbarShowCounter', 'navigation_mobile', '', 20, CURRENT_TIMESTAMP()),
('roxid.blMobileNavbarSlidingSubmenus', 'theme:roxid', 'blMobileNavbarSlidingSubmenus', 'navigation_mobile', '', 30, CURRENT_TIMESTAMP()),
('roxid.sMobileNavbarPageDim', 'theme:roxid', 'sMobileNavbarPageDim', 'navigation_mobile', 'false|pagedim-white|pagedim-black', 100, CURRENT_TIMESTAMP()),
('roxid.blMobileNavbarShowBasket', 'theme:roxid', 'blMobileNavbarShowBasket', 'navigation_mobile', '', 500, CURRENT_TIMESTAMP()),
('roxid.blMobileNavbarShowAccount', 'theme:roxid', 'blMobileNavbarShowAccount', 'navigation_mobile', '', 510, CURRENT_TIMESTAMP()),
('roxid.blMobileNavbarShowContact', 'theme:roxid', 'blMobileNavbarShowContact', 'navigation_mobile', '', 520, CURRENT_TIMESTAMP()),
('roxid.blMobileNavbarShowShopName', 'theme:roxid', 'blMobileNavbarShowShopName', 'navigation_mobile', '', 530, CURRENT_TIMESTAMP())
;

DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='sMobileNavbarMode';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sMobileNavbarMode';
