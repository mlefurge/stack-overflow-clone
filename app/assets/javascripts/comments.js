$(document).ready(function() {

  $('.new_comment_button').on('click', function(){
    var id = $(this).attr('id')
    $('#'+id+'.question_show_new_comment_container').show();
    $('#'+id+'.new_comment_button').toggle();
  });

  $('.cancel_comment').on('click', function(event){
    event.preventDefault();
    var id = $(this).attr('id')
    $('#'+id+'.question_show_new_comment_container').toggle();
    $('#'+id+'.new_comment_button').toggle();
  })

})
