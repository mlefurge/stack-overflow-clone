$(document).ready(function(){

  $(document).on("click", ".question_sort_link", function(event){
    event.preventDefault();
    $.ajax({
      method: "get",
      url: $(this).attr("href")
    }).done(function(sorted){
      $('.questions_show_sorted').replaceWith(sorted);
    });
  });

})
