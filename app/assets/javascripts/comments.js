$(document).ready(function(){
  $('.comment').on('submit', 'form', function() {
    event.preventDefault();

    var url = $(this).attr('action');
    var data = $(this).serialize();

    var that = $(this).parents().eq(1);

    var request = $.ajax({
                          url: url,
                          method: 'post',
                          data: data
    });

    request.done(function(response) {
      console.log(that.find("ul"));
      that.find("ul").append('<li>'+response.content+ ' - ' + response.author + ' Just Now</li>');

    });
  });
});