module ApplicationHelper
  # Public: Get a string that can be embedded in an html file to add the css
  # styling used to show cropped pic images
  #
  # Examples
  #
  #   <%= picCropCss %>
  #   <div class="faceWrapper">
  #       <img src="<%= @pic.url %>" class="faceImg">
  #   </div>
  #   <!-- Shows just the face of the person in the image at @pic.url -->
  #
  # Returns a string of html that sets the css styling for showing cropped pic
  # images.
  def picCropCss
    outputString  = "<style type=\"text/css\">\n"
    outputString += "  .faceWrapper {\n"
    outputString += "    position: relative;\n"
    outputString += "    height: #{(@pic.face_bottom - @pic.face_top).to_s}px;\n"
    outputString += "    width: #{(@pic.face_right - @pic.face_left).to_s}px;\n"
    outputString += "  }\n"
    outputString += "  .faceImg {\n"
    outputString += "    position: absolute;\n"
    outputString += "    left: -#{@pic.face_left.to_s}px;\n"
    outputString += "    top: -#{@pic.face_top.to_s}px;\n"
    outputString += "    clip: rect(#{@pic.face_top.to_s}px,#{@pic.face_right.to_s}px,#{@pic.face_bottom.to_s}px,#{@pic.face_left.to_s}px);\n"
    outputString += "  }\n"
    outputString += "  .fullWrapper {\n"
    outputString += "    position: relative;\n"
    outputString += "    height: #{(@pic.full_bottom - @pic.full_top).to_s}px;\n"
    outputString += "    width: #{(@pic.full_right - @pic.full_left).to_s}px;\n"
    outputString += "  }\n"
    outputString += "  .fullImg {\n"
    outputString += "    position: absolute;\n"
    outputString += "    left: -#{@pic.full_left.to_s}px;\n"
    outputString += "    top: -#{@pic.full_top.to_s}px;\n"
    outputString += "    clip: rect(#{@pic.full_top.to_s}px,#{@pic.full_right.to_s}px,#{@pic.full_bottom.to_s}px,#{@pic.full_left.to_s}px);\n"
    outputString += "  }\n"
    outputString += "</style>"
    return outputString.html_safe
  end
end