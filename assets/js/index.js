/**
 * Main JS file for custom scripts
 */

/*globals jQuery, document */
(function ($) {
    "use strict";

    $(document).ready(function(){

        $('span.citation').click(function(){
            $(location).attr('href', $(this).data("cites"));
        });
    });

}(jQuery));
