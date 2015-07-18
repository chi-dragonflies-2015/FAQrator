$(document).ready(function(){

  $('#new-question').on('submit', 'form', function() {
    event.preventDefault();

    var url = $(this).attr('action');
    var data = $(this).serialize();

    var request = $.ajax({
                          url: url,
                          method: 'POST',
                          data: data
    });

    request.done(function(response) {
      $('#questions').append(response);

      $('.collapsible').collapsible({
        accordion : true
      });

    });
  });

  $('.answer').on('submit', 'form', function() {
    event.preventDefault();

    var url = $(this).attr('action');
    var data = $(this).serialize();

    var that = $(this).parents().eq(1);

    var request = $.ajax({
                          url: url,
                          method: 'PUT',
                          data: data
    });

    request.done(function(response) {that.html('<p>'+response.answer+'</p>');

      that.siblings('.collapsible-header').children('i').text('chat_bubble');
    });

    $('.collapsible .collapsible-header').on('click', function() {
      event.preventDefault();
      console.log(event);
      /* Act on the event */
      event.stopPropagation();
      event.stopImmediatePropagation();
    });
  })
});