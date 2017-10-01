$ ->
  # open the loginbox in the header if there is an error message
  # an error message means that the user tried to login but failed to provide the correct login data
  # without this function the dropdown would stay hidden and the error message about the failed login would stay invisible for the user
  error = $(".z-header-login .z-loginbox .alert")
  if error.length > 0
    $(".z-header-login .dropdown-menu").siblings("a").trigger("click")
