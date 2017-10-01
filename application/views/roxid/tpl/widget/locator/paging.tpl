[{block name="widget_locator_paging"}]
  [{if $pages->changePage}]
    <ul class="pagination">
      <li [{if !$pages->previousPage }]class="disabled"[{/if}]>
        <a class="prev hidden-xs" rel="prev" href="[{$pages->previousPage}]">[{oxmultilang ident="PREVIOUS"}]</a>
        <a class="prev visible-xs" rel="prev" href="[{$pages->previousPage}]">&larr;</a>
      </li>
      [{assign var="i" value=1}]

      [{foreach key=iPage from=$pages->changePage item=page}]
          [{ if $iPage == $i }]
             <li [{if $iPage == $pages->actPage }]class="active"[{/if}]><a href="[{$page->url}]">[{$iPage}]</a></li>
             [{assign var="i" value=$i+1}]
          [{ elseif $iPage > $i }]
             <li class="disabled"><a href="javascript:void(0)">...</a></li>
             <li [{if $iPage == $pages->actPage }]class="active"[{/if}]><a href="[{$page->url}]">[{$iPage}]</a></li>
             [{assign var="i" value=$iPage+1}]
          [{ elseif $iPage < $i }]
             <li [{if $iPage == $pages->actPage }]class="active"[{/if}]><a href="[{$page->url}]">[{$iPage}]</a></li>
             <li class="disabled"><a href="javascript:void(0)">...</a></li>
             [{assign var="i" value=$iPage+1}]
          [{/if}]
      [{/foreach}]

      <li [{if !$pages->nextPage }]class="disabled"[{/if}]>
        <a class="next hidden-xs" rel="next" href="[{$pages->nextPage}]">[{oxmultilang ident="NEXT"}]</a>
        <a class="next visible-xs" rel="next" href="[{$pages->nextPage}]">&rarr;</a>
      </li>
    </ul>
  [{/if}]
[{/block}]
