$ = jQuery

$.zDetectDeviceByResolution = () ->
  breakpoints =
    phone: 767

  if Modernizr.mq("only screen and (max-width: #{breakpoints.phone}px)") then return "phone"
  else return "desktop"
