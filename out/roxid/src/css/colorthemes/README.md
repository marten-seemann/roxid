# Updating

When updating, please take care of two things:

  1. For some color themes, some parts of the *bootswatch.less* have to be deleted / commented in. See *README.md* in the corresponding theme folders.
  2. Please run the script *build/replace_bootswatch_webfonts.sh" once after updating. This script will replace all @import webfont commands by writing the webfont url into a variable, which then later is imported (or overwritten).
