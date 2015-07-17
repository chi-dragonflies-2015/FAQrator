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
      console.log(response);

      $('#questions').append(response);

    });
  });
});