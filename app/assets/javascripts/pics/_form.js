$(document).ready(function() {
// When the url in the "Url" field changes, this updates the image shown at the top of the page.
  $('#pic_url').change(function() {
    $(".display").fadeOut("slow", function(){
      $(".display").html("<img src=\""+document.getElementById('pic_url').value+"\" id=\"picDisplay\">");
      $(".display").fadeIn("slow");
    })
  });
});