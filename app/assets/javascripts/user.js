$(document).ready(function(){

  $(document).on("click", ".user_sort_link", function(event){
    event.preventDefault();
    $.ajax({
      method: "get",
      url: $(this).attr("href")
    }).done(function(sorted){
      $('.users_show_sorted').replaceWith(sorted);
    });
  });


})
