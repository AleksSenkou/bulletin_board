//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).on("ready page:change", function() {
    $('#tag-tooltip').tooltip();

    // $('.image-out').mouseenter(function() {
    //     var attr_id = $(this).attr("id");
    //     $('#' + attr_id).removeClass('image-out');
    //     $('#' + attr_id).addClass('image-in');
    // })

    // $('.image-out').mouseleave(function() {
    //     var attr_id = $(this).attr("id");
    //     $('#' + attr_id).removeClass('image-in');
    //     $('#' + attr_id).addClass('image-out');
    // })
});
