$(document).ready ->
  prefix = "tab_"
  hash = location.hash

  $('a[href="' + hash.replace(prefix, "") + '"]').tab('show') if hash != ''

  $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) ->
    location.hash = prefix + $(e.target).attr('href').substr(1)
