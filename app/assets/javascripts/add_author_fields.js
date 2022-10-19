$(document).ready(function(){
  $(".add_author_fields").click(function(){
    $("#authors").append($(this).data("field"));
  });
});
