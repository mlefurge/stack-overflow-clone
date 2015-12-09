$(document).ready(function() {

  $(".question_show_new_answer_text").on("click", function(event){
    event.preventDefault();
    var link = $(this).attr("href")
    $.ajax({
      method: "get",
      url: link
    }).done(function(formInfo){
      $('.new_answer_container').append(formInfo);
      $('.question_show_new_answer').hide();
    })
  });
})
