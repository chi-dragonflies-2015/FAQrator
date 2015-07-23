$(document).ready(function(){

$('.question-delete').on('click', function() {
    $(this).parent().removeClass("collapsible-header");
});

$('.question-vote').on('click', function() {
    $(this).parent().removeClass("collapsible-header");
    $('.collapsible').collapsible({
      accordion : true
    });
});


});