[{assign var="jslang" value=$oViewConf->getJsLangStrings()}]
<script>
  $lang = [{$jslang|@json_encode}];
</script>
