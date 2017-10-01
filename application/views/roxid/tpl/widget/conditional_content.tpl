[{assign var="device_type" value=$oViewConf->detectDevice()}]
[{if $device_type=="tablet" || $device_type=="desktop" }]
    <!-- device: [{$device_type}] -->
    [{$code}]
[{elseif $device_type == "unknown"}]
    <!-- device: unknown -->
    [{* see http://stackoverflow.com/questions/15350648/conditionally-display-content-based-on-media-query *}]
    [{capture name="jscode" assign="jscode"}]
        var code=[{$code|@json_encode}];
        if($.zDetectDeviceByResolution() !== "phone") {
            $('#[{$html_id}]').append(code);
        }
    [{/capture}]
    [{oxscript add=$jscode}]
[{else}]
    <!-- device: phone -->
[{/if}]
