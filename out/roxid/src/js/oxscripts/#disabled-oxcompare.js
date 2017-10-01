/**
 *    This file is part of OXID eShop Community Edition.
 *
 */
( function ( $ ) {

    /**
     * Compare list
     */
    oxCompare = {
        options: {
            propertyHeight  : "height",
            classFirstCol   : ".js-firstCol",
            completeCompareElement: "#compareList",
            idDataTable     : "#compareDataDiv",
            elementTd       : "td.z-compare-table-cell",
            idFirstTr       : "#firstTr"
        },

        _create: function() {
            var self = this;
            var options = self.options;
            var iColumnCount = self.getColumnCount();

            var new_width = $(options.completeCompareElement).parent().width() - $(options.classFirstCol).width() - 25;
            $(options.idDataTable).width(new_width);

            self.alignRows(iColumnCount);

            // if ( $( options.idDataTable ).length ) {
            //     $( options.idDataTable ).jScrollPane({
            //         showArrows: false,
            //         horizontalGutter: 10
            //     });
            // }
        },

        /**
         * align first columns rows with data columns
         *
         * @return object
         */
        alignRows: function(iColumnCount) {
            var iNumberOfRow = 0;
            var self = this;
            var options = this.options;

            $(self.options.classFirstCol).each(function(i) {

                  var oFirstColumn = $(this);
                  var oOtherColumn = self.getOtherColumn(iColumnCount, iNumberOfRow);

                  var firstColumnHeight = self.getColumnHeight(oFirstColumn);
                  var otherColumnHeight = self.getColumnHeight(oOtherColumn);

                  if(firstColumnHeight >  otherColumnHeight){
                    self.setColumnHeight(oOtherColumn, firstColumnHeight );
                    self.setColumnHeight(oFirstColumn, firstColumnHeight );
                  }else{
                    self.setColumnHeight(oFirstColumn, otherColumnHeight);
                    self.setColumnHeight(oOtherColumn, otherColumnHeight);
                  }

                  iNumberOfRow++;
            });

            if(Modernizr.firefox) {
                var el = $('#firstDataTr .js-firstCol:eq(0)');
                el.height(el.height()+ 2);
            }
        },

        /**
         * get colummns rows hight
         *
         * @return integer
         */
        getColumnHeight: function(oColumn)
        {
            return oColumn.outerHeight();
        },

        /**
         * set colummns rows hight
         *
         * @return object
         */
        setColumnHeight: function(oColumn, iHeight)
        {
            return $(oColumn).css(this.options.propertyHeight, iHeight);
        },

        /**
         * get colummns
         *
         * @return object
         */
        getOtherColumn: function(iColumnCount, iNumberOfRow)
        {
            return $( this.options.idDataTable + ' ' + this.options.elementTd + ':eq(' + iColumnCount * iNumberOfRow + ')');
        },


        /**
         * get column Count
         *
         * @return object
         */
        getColumnCount: function()
        {
            return $( this.options.idFirstTr + '>' + this.options.elementTd).length;
        }
    };

    /**
     * Compare list widget
     */
    $.widget("ui.oxCompare", oxCompare );

})( jQuery );
