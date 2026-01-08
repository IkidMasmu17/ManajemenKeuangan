/**
 * Custom JS Code
 */
"use strict";

$(document).ready(function() {
    // Remove existing handlers to prevent conflicts
    $("[data-toggle='sidebar']").off('click');

    // Robust Sidebar Toggle
    $("[data-toggle='sidebar']").on('click', function(e) {
        e.preventDefault();
        var body = $("body");

        if (body.hasClass('sidebar-mini')) {
            body.removeClass('sidebar-mini');
        } else {
            body.addClass('sidebar-mini');
        }

        // Trigger resize to ensure charts/tables adjust
        $(window).trigger('resize');
    });
});
