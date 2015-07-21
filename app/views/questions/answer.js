that = $("li#question-<%= @question.id%> answer");
that.html('<p>'+response.answer+'</p>');
that.siblings('.collapsible-header').children('i').text('chat_bubble');
that.siblings('.collapsible-header').children('.question-edit').remove();