[{oxmultilang ident="FILESIZE" suffix="COLON"}] [{$oOrderFile->getFileSize()|oxfilesize}]<br>

[{if $oOrderFile->oxorderfiles__oxdownloadcount->value == 0 && $oOrderFile->getValidUntil() != "0000-00-00 00:00"  }]
    [{if $oOrderFile->oxorderfiles__oxlinkexpirationtime->value || $oOrderFile->oxorderfiles__oxdownloadxpirationtime->value }]
        [{ oxmultilang ident="START_DOWNLOADING_UNTIL" }] [{$oOrderFile->getValidUntil()}]
    [{/if}]
    [{if $oOrderFile->oxorderfiles__oxmaxdownloadcount->value != 0 }]
        [{ oxmultilang ident="LEFT_DOWNLOADS" suffix="COLON"}] [{ $oOrderFile->getLeftDownloadCount() }]
    [{/if}]
[{else}]
    [{if $oOrderFile->getValidUntil() != "0000-00-00 00:00"  }]
        [{if $oOrderFile->oxorderfiles__oxlinkexpirationtime->value || $oOrderFile->oxorderfiles__oxdownloadxpirationtime->value }]
            [{ oxmultilang ident="LINK_VALID_UNTIL" suffix="COLON"}] [{ $oOrderFile->getValidUntil() }]
        [{/if}]
    [{/if}]
    [{if $oOrderFile->oxorderfiles__oxmaxdownloadcount->value != 0 }]
        [{ oxmultilang ident="LEFT_DOWNLOADS" suffix="COLON"}] [{ $oOrderFile->getLeftDownloadCount() }]
    [{/if}]
[{/if}]
