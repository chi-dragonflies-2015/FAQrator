$(document).ready(function(){
  // $('.comment').on('submit', 'form', function() {
  //   event.preventDefault();

  //   var url = $(this).attr('action');
  //   var data = $(this).serialize();

  //   var that = $(this).parents().eq(1);
  //   var thisForm = $(this)
  //   var request = $.ajax({
  //                         url: url,
  //                         method: 'post',
  //                         data: data
  //   });

  //   request.done(function(response) {
  //     console.log(response);
  //     if (response == undefined) {
  //       that.find(".comment-error").text("Comment cannot be blank.");
  //     }
  //     else {
  //     console.log(that);
  //     that.find(".comment-error").text("");
  //     that.find("ul").append(response);
  //     };
  //   });
  //   $(this).closest('form').find("input[type=text], textarea").val("");

  //   $('comments .collapsible').collapsible({
  //     expandable : true
  //   });

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