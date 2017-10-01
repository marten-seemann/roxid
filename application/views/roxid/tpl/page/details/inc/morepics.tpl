<div class="z-productpictures-more" id="z-productpictures-more" [{if !$oView->morePics()}]style="display:none"[{/if}]>
    <ul class="list-unstyled">
        [{foreach from=$oView->getIcons() key=iPicNr item=oArtIcon name=sMorePics}]
            [{assign var="dims" value=$oPictureProduct->getMasterZoomPictureDimensions($iPicNr)}]
            <li>
                <a href="#" data-image="[{$oPictureProduct->getPictureUrl($iPicNr)}]" data-zoom-image="[{$oPictureProduct->getMasterZoomPictureUrl($iPicNr)}]" data-zoom-image-width="[{$dims.width}]" data-zoom-image-height="[{$dims.height}]">
                    <img id="morePics_[{$smarty.foreach.sMorePics.iteration}]" src="[{$oPictureProduct->getIconUrl($iPicNr)}]" alt="">
                </a>
            </li>
        [{/foreach}]
    </ul>
    <div class="clear"></div>
</div>
