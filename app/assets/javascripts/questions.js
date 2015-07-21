$(document).ready(function(){

  // $('.answer').on('submit', 'form', function() {
  //   event.preventDefault();

  //   var url = $(this).attr('action');
  //   var data = $(this).serialize();

  //   var that = $(this).parents().eq(1);

  //   var request = $.ajax({
  //                         url: url,
  //                         method: 'PUT',
  //                         data: data
  //   });

  //   request.done(function(response) {
  //     that.html('<p>'+response.answer+'</p>');
  //     that.siblings('.collapsible-header').children('i').text('chat_bubble');
  //     that.siblings('.collapsible-header').children('.question-edit').remove();
  //   });
  // });

  $('.question-edit').on('click', function() {
    event.preventDefault();
    event.stopPropagation();
  });

  // $('.edit-modal').on('submit', 'form', function() {
  //   event.preventDefault();

  //   var url = $(this).attr('action');
  //   var data = $(this).serialize();

  //   var that = $(this).parents().eq(2);

  //   var request = $.ajax({
  //                         url: url,
  //                         method: 'PUT',
  //                         data: data
  //   });

  //   request.done(function(response) {
  //     console.log(response.id);
  //     $('#question-'+response.id+' .collapsible-header span').text(response.content)
  //   });
  // });

  // $('.question-delete').on('click', function() {
  //   event.preventDefault();
  //   event.stopPropagation();

  //   if (confirm('Are you sure you want to delete this?')){
  //     var url = $(this).attr('href');
  //     var data = $(this).serialize();

  //     var that = $(this).parents().eq(1);

  //     var request = $.ajax({
  //                           url: url,
  //                           method: 'DELETE',
  //                           data: data
  //     });

  //     request.done(function(response) {
  //       that.remove();
  //     });
  //   };
  // });

});