# rename inconsistently named configuration options
UPDATE `oxconfig` SET OXVARNAME='sColorTheme' WHERE OXMODULE='theme:roxid' AND OXVARNAME='blColorTheme';
UPDATE `oxconfigdisplay` SET OXCFGVARNAME='sColorTheme' WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='blColorTheme';

UPDATE `oxconfig` SET OXVARNAME='sNavbarColorMode' WHERE OXMODULE='theme:roxid' AND OXVARNAME='blNavbarColorMode';
UPDATE `oxconfigdisplay` SET OXCFGVARNAME='sNavbarColorMode' WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='blNavbarColorMode';

UPDATE `oxconfig` SET OXVARNAME='sMinibasketDisplay' WHERE OXMODULE='theme:roxid' AND OXVARNAME='blMinibasketDisplay';
UPDATE `oxconfigdisplay` SET OXCFGVARNAME='sMinibasketDisplay' WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='blMinibasketDisplay';

UPDATE `oxconfig` SET OXVARNAME='sProductPicZoomMode' WHERE OXMODULE='theme:roxid' AND OXVARNAME='blProductPicZoomMode';
UPDATE `oxconfigdisplay` SET OXCFGVARNAME='sProductPicZoomMode' WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='blProductPicZoomMode';

UPDATE `oxconfig` SET OXVARNAME='sMobileNavbarMode' WHERE OXMODULE='theme:roxid' AND OXVARNAME='blMobileNavbarMode';
UPDATE `oxconfigdisplay` SET OXCFGVARNAME='sMobileNavbarMode' WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='blMobileNavbarMode';

# create new section for product list configuration options
UPDATE `oxconfigdisplay` SET OXGROUPING='productlist', OXPOS=1 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='blShowListDisplayType';
UPDATE `oxconfigdisplay` SET OXGROUPING='productlist', OXPOS=10 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sDefaultListDisplayType';
UPDATE `oxconfigdisplay` SET OXGROUPING='productlist', OXPOS=15 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sDefaultListDisplayTypePhone';
UPDATE `oxconfigdisplay` SET OXGROUPING='productlist', OXPOS=20 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sStartPageListDisplayType';
UPDATE `oxconfigdisplay` SET OXGROUPING='productlist', OXPOS=25 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sStartPageListDisplayTypePhone';
UPDATE `oxconfigdisplay` SET OXGROUPING='productlist', OXPOS=100 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='aNrofCatArticles';
UPDATE `oxconfigdisplay` SET OXGROUPING='productlist', OXPOS=105 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='aNrofCatArticlesInGrid';

# create new section for navigation configuration options
UPDATE `oxconfigdisplay` SET OXGROUPING='navigation', OXPOS=1 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='blShowHomeInNavigation';
UPDATE `oxconfigdisplay` SET OXGROUPING='navigation', OXPOS=5 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='iTopNaviCatCount';
UPDATE `oxconfigdisplay` SET OXGROUPING='navigation', OXPOS=10 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='blShowNavbarSubMenus';
UPDATE `oxconfigdisplay` SET OXGROUPING='navigation', OXPOS=50 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sNavbarColorMode';
UPDATE `oxconfigdisplay` SET OXGROUPING='navigation', OXPOS=100 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sMobileNavbarMode';

# move remaining options from display section to misc section
UPDATE `oxconfigdisplay` SET OXGROUPING='roxid', OXPOS=200 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='blShowBirthdayFields';
UPDATE `oxconfigdisplay` SET OXGROUPING='roxid', OXPOS=205 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='blShowFinalStep';


# add new configuration options
INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXTIMESTAMP`) VALUES
('roxid.blShowMapOnContactPage', 'oxbaseshop', 'theme:roxid', 'blShowMapOnContactPage', 'bool', X'07', CURRENT_TIMESTAMP()),
('roxid.blShowManufacturerSlider', 'oxbaseshop', 'theme:roxid', 'blShowManufacturerSlider', 'bool', X'07', CURRENT_TIMESTAMP()),
('roxid.blShowCompleteCategoryTreeSidebar', 'oxbaseshop', 'theme:roxid', 'blShowCompleteCategoryTreeSidebar', 'bool', '', CURRENT_TIMESTAMP())
;

INSERT INTO `oxconfigdisplay` (`OXID`, `OXCFGMODULE`, `OXCFGVARNAME`, `OXGROUPING`, `OXVARCONSTRAINT`, `OXPOS`, `OXTIMESTAMP`) VALUES
('roxid.blShowMapOnContactPage', 'theme:roxid', 'blShowMapOnContactPage', 'roxid', '', 40, CURRENT_TIMESTAMP()),
('roxid.blShowManufacturerSlider', 'theme:roxid', 'blShowManufacturerSlider', 'roxid', '', 45, CURRENT_TIMESTAMP()),
('roxid.blShowCompleteCategoryTreeSidebar', 'theme:roxid', 'blShowCompleteCategoryTreeSidebar', 'navigation', '', 70, CURRENT_TIMESTAMP())
;

INSERT INTO `oxconfigdisplay` (`OXID`, `OXCFGMODULE`, `OXCFGVARNAME`, `OXGROUPING`, `OXVARCONSTRAINT`, `OXPOS`, `OXTIMESTAMP`) VALUES
('roxid.blShowPricealarmOnPhone', 'theme:roxid', 'blShowPricealarmOnPhone', 'productpage', '', 100, CURRENT_TIMESTAMP()),
('roxid.blShowTagsOnPhone', 'theme:roxid', 'blShowTagsOnPhone', 'productpage', '', 101, CURRENT_TIMESTAMP())
;

INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXTIMESTAMP`) VALUES
('roxid.blShowPricealarmOnPhone', 'oxbaseshop', 'theme:roxid', 'blShowPricealarmOnPhone', 'bool', '', CURRENT_TIMESTAMP()),
('roxid.blShowTagsOnPhone', 'oxbaseshop', 'theme:roxid', 'blShowTagsOnPhone', 'bool', '', CURRENT_TIMESTAMP())
;



-- remove all configuration options for image sizes and image quality on tables which are no longer needed
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='sDefaultImageQualityTablet';
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='sIconsizeTablet';
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='sThumbnailsizeTablet';
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='sZoomImageSizeTablet';
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='aDetailImageSizesTablet';
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='sManufacturerIconsizeTablet';
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='sCatThumbnailsizeTablet';
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='sCatIconsizeTablet';
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='sCatPromotionsizeTablet';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sDefaultImageQualityTablet';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sIconsizeTablet';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sThumbnailsizeTablet';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sZoomImageSizeTablet';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='aDetailImageSizesTablet';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sManufacturerIconsizeTablet';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sCatThumbnailsizeTablet';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sCatIconsizeTablet';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sCatPromotionsizeTablet';

-- remove some configuration options for image sizes on smartphones which are no longer needed
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='sIconsizePhone';
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='sZoomImageSizePhone';
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='aDetailImageSizesPhone';
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='sManufacturerIconsizePhone';
DELETE FROM oxconfig WHERE OXMODULE='theme:roxid' AND OXVARNAME='sCatPromotionsizePhone';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sIconsizePhone';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sZoomImageSizePhone';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='aDetailImageSizesPhone';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sManufacturerIconsizePhone';
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sCatPromotionsizePhone';

-- remove display of configuration option for image zoom size that does not have any effect in ROXID
DELETE FROM oxconfigdisplay WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sZoomImageSize';

-- set new value for product icon size (125*125)
UPDATE oxconfig SET OXVARVALUE=X'07AC3043C0D7BE' WHERE OXMODULE='theme:roxid' AND OXVARNAME='sIconsize';
-- set new value for category icon size (224*169)
UPDATE oxconfig SET OXVARVALUE=X'B6AF9541C2745E' WHERE OXMODULE='theme:roxid' AND OXVARNAME='sCatIconsize';


# move more config option to the productpage section
UPDATE `oxconfigdisplay` SET OXGROUPING='productpage', OXPOS=5 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='blShowReviewTab';
UPDATE `oxconfigdisplay` SET OXGROUPING='productpage', OXPOS=1 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='blShowProductAmountControls';
UPDATE `oxconfigdisplay` SET OXGROUPING='productpage', OXPOS=10 WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sProductPicZoomMode';


# install new colortheme options
UPDATE `oxconfigdisplay` SET OXVARCONSTRAINT='cerulean|cosmo|default|journal|lumen|sandstone|simplex|spacelab|united|yeti|own' WHERE OXCFGMODULE='theme:roxid' AND OXCFGVARNAME='sColorTheme';
# blue -> cerulean
UPDATE `oxconfig` SET OXVARVALUE=X'6C95DDB84EFCB9B7' WHERE OXMODULE='theme:roxid' AND OXVARNAME='sColorTheme' AND OXVARVALUE=X'55DD1A10';
# orange -> united
UPDATE `oxconfig` SET OXVARVALUE=X'7AD1F65700E1' WHERE OXMODULE='theme:roxid' AND OXVARNAME='sColorTheme' AND OXVARVALUE=X'60F13E45ECE4';
# white -> journal
UPDATE `oxconfig` SET OXVARVALUE=X'C2211173566D65' WHERE OXMODULE='theme:roxid' AND OXVARNAME='sColorTheme' AND OXVARVALUE=X'185CF25304';
