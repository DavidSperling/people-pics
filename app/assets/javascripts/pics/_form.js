$(window).load(function() {
  var jcrop_api;

  initFaceCrop();
  initFullCrop();
  
  // Adds Jcrop to the image designated for the headshot
  function initFaceCrop()
  {
    $("#facePic").Jcrop({
      addClass: 'jcrop-dark',
      onChange: handleFaceCrop,
      onSelect: handleFaceCrop,
    }, function(){
      jcrop_api = this;
    });
  };
  
  // Adds Jcrop to the image designated for the full body shot
  function initFullCrop()
  {
    $("#fullPic").Jcrop({
      addClass: 'jcrop-dark',
      onChange: handleFullCrop,
      onSelect: handleFullCrop,
    }, function(){
      jcrop_api = this;
    })
  };
  
  // When the url in the "Url" field changes, this updates the images shown on the page.
  $('#pic_url').live("change", function() {
    $("#display").fadeOut("slow", function(){
      $("#display").html("<img src=\""+document.getElementById('pic_url').value+"\" id=\"picDisplay\">");
      $("#display").fadeIn("slow", function(){
        $("#pic_img_height").val(document.getElementById("picDisplay").clientHeight);
        $("#pic_img_width").val(document.getElementById("picDisplay").clientWidth);
      });
    })
    $("#faceDisplay").fadeOut("slow", function(){
      $("#faceDisplay").html("<img src=\""+document.getElementById('pic_url').value+"\" id=\"facePic\">");
      $("#faceDisplay").fadeIn("slow");
      initFaceCrop();
    })
    $("#fullDisplay").fadeOut("slow", function(){
      $("#fullDisplay").html("<img src=\""+document.getElementById('pic_url').value+"\" id=\"fullPic\">");
      $("#fullDisplay").fadeIn("slow");
      initFullCrop();
    })
  });
  
  // Jcrop event handler for the face shot
  function handleFaceCrop(c)
  {
    $('#pic_face_left').val(c.x);
    $('#pic_face_top').val(c.y);
    $('#pic_face_right').val(c.x2);
    $('#pic_face_bottom').val(c.y2);
  };
  
    // Jcrop event handler for the full body shot
  function handleFullCrop(c)
  {
    $('#pic_full_left').val(c.x);
    $('#pic_full_top').val(c.y);
    $('#pic_full_right').val(c.x2);
    $('#pic_full_bottom').val(c.y2);
  };
});