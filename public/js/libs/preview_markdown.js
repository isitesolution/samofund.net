$(function() {
  var converter = new Showdown.converter();

  $("#help_article_body").keyup(function() {
    var txt = $(this).val();
    var html = converter.makeHtml(txt);
    $("#preview").html(html);
  });

  var txt = $("#help_article_body").val();
  if (txt != "") {
    $("#preview").html(converter.makeHtml($("#help_article_body").val()));
  }
});
