$(document).ready(function(){
  $('.comment').on('submit', 'form', function() {
    event.preventDefault();

    var url = $(this).attr('action');
    var data = $(this).serialize();

    var that = $(this).parents().eq(1);
    var thisForm = $(this)
    var request = $.ajax({
                          url: url,
                          method: 'post',
                          data: data
    });

    request.done(function(response) {
      console.log(response.content);
      if (response.content == undefined) {
        that.find(".comment-error").text("Comment cannot be blank.");
      }
      else {
      that.find(".comment-error").text("");
      that.find("ul").append('<li><i class="material-icons text-lighten-1 blue-text">comment</i>'+response.content+ ' - ' + response.author + ' Just Now!</li><hr>');
      };
    });
  });

  $('.comment-delete').on('click', function() {
    event.preventDefault();
    event.stopPropagation();
    event.stopImmediatePropagation();

    if (confirm('Are you sure you want to delete this?')){
      var url = $(this).attr('href');
      var data = $(this).serialize();

      var that = $(this).parent();

      var request = $.ajax({
                            url: url,
                            method: 'DELETE',
                            data: data
      });

      request.done(function(response) {
        console.log(response);
        console.log(that);
        that.remove();
      });
    }
  });
});