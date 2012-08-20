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
    outputString.html_safe
  end
  
  # Public: Gets the html to show a pic on the page
  #
  # pic         - The pic to be shown on the page.
  # crop        - A string giving the cropping defined in pic that should be
  #               used.
  #               If this is undefined, the whole image will be shown.
  #               If this is "face", the image will be cropped to the face.
  #               If this is "full", the image will be cropped to the full body.
  # forceHeight - A height in px that the image will be forced to have.
  #               If no value is supplied, the actual height of the image will
  #               be used.
  # forceWidth  - A width in px that the image will be forced to have.
  #               If no value is supplied, the actual width of the image will
  #               be used.
  # href        - If the image is used as a hyperlink, this is the target
  #               If this is undefined, the target will be the image's source
  # link?       - True if the image is to be used as a hyperlink.
  #               If false or undefined, the image will not be a hyperlink.
  # newTab?     - True if the link should open in a new tab.
  #               If false or undefined, the link will open in the current tab.
  # ratio       - Force an aspect ratio on the image. (width/height)
  # scale?      - True if the image should be scaled to match a forceWidth or
  #               forceHeight
  #               If forceWidth and forceHeight are both given, this will act
  #               as stretch? = true
  #               If forceWitdth xor forceHeight is given along with a ratio,
  #               the image will be scaled to match the one given, and the other
  #               cropping will be adjusted so that the image is not stretched
  #               If only ratio is given, the larger side will stay the same,
  #               and the smaller side will be lengthened to fit the ratio
  # stretch?    - True if the image should be stretched to fit forcedWidth and
  #               forcedHeight.
  #               If stretch? is false or undefined, then the portion of the
  #               image shown will be centered around the cropping defined in
  #               pic
  #               stretch? overrides scale?.
  #
  # Examples
  #    <%= showPic(:pic @pic) %>
  #    <!-- Shows the entire image -->
  #
  #    <%= showPic(@pic
  #
  # Returns a string of html that shows the image on the page
  def showPic(options = {})  
    # Set default values
    params = {
      :pic => Pic.first,
      :crop => 'none',
      :forceHeight => -1,
      :forceWidth => -1,
      :ratio => -1,
      :scale? => false,
      :stretch? => false,
      :link? => false,
      :href => "",
      :newTab? => false,
    }.merge(options)
    
    pic = params[:pic]
    crop = params[:crop]
    forceHeight = params[:forceHeight]
    forceWidth = params[:forceWidth]
    ratio = params[:ratio]
    scale = params[:scale?]
    stretch = params[:stretch?]
    link = params[:link?]
    if options[:href]
      href = options[:href]
    else
      href = pic.url
    end
    newTab = params[:newTab?]
    
    # Do some error handling
    return %(Bad value, "#{forceHeight}" for :forceHeight) if forceHeight == 0
    return %(Bad value, "#{forceWidth}" for :forceWidth) if forceWidth == 0
    return %(Bad value, "#{ratio}" for :ratio) if ratio == 0
    return %(Problem with image data...) if pic.img_height == nil || pic.img_width == nil
    
    top = bottom = left = right = Float(0)
    heightScale = widthScale = Float(0)
    
    # Set variables before considering forced values
    if crop == "face"
      top = pic.face_top
      bottom = pic.face_bottom
      left = pic.face_left
      right = pic.face_right
    elsif crop == "full"
      top = pic.full_top
      bottom = pic.full_bottom
      left = pic.full_left
      right = pic.full_right
    else
      top = 0
      bottom = pic.img_height
      left = 0
      right = pic.img_width
    end
    cropHeight = drawHeight = bottom.to_i - top.to_i
    cropWidth = drawWidth = right.to_i - left.to_i
    
    # Set the dimensions of the image to be shown on the page
    if ratio != -1
      if forceHeight == -1 && forceWidth == -1
        if drawWidth / drawHeight > ratio 
          drawHeight = drawWidth / ratio
        else
          drawWidth = drawHeight * ratio
        end
      elsif forceHeight != -1 && forceWidth == -1
        drawHeight = forceHeight
        drawWidth = forceHeight * ratio
      elsif forceHeight == -1 && forceWidth != -1
        drawWidth = forceWidth
        drawHeight = forceWidth / ratio
      elsif forceHeight != -1 && forceWidth != -1
        if forceWidth / forceHeight > ratio
          drawWidth = forceWidth
          drawHeight = forceWidth / ratio
        else
          drawHeight = forceHeight
          drawWidth = drawHeight * ratio
        end
      end
    end
    
    # Update the cropping
    unless stretch || scale
      if drawWidth > cropWidth
        horizMid = (right + left) / 2
        left = horizMid - drawWidth / 2
        right = horizMid + drawWidth / 2
        left, right = overlapRange(left, right, 0, pic.img_width)
      end
      if drawHeight > cropHeight
        vertMid = (top + bottom) / 2
        top = vertMid - drawHeight / 2
        bottom = vertMid + drawHeight / 2
        top, bottom = overlapRange(top, bottom, 0, pic.img_height)
      end
      cropHeight = bottom - top
      cropWidth = right - left
    end
    
    # Determine the amount to scale the image
    heightScale = Float(drawHeight) / Float(cropHeight) unless cropHeight == 0
    widthScale = Float(drawWidth) / Float(cropWidth) unless cropHeight == 0
    if scale
      if ratio == -1
        if heightScale < widthScale
          heightScale = widthScale
        elsif widthScale < heightScale
          widthScale = heightScale
        end
      else
        if heightScale > widthScale
          heightScale = widthScale
          vertMid = (top + bottom) / 2
          top = horizMid - cropWidth / (ratio * 2)
          bottom = horizMid + cropWidth / (ratio * 2)
          top, bottom = overlapRange(top, bottom, 0, pic.img_height)
        elsif widthScale > heightScale
          widthScale = heightScale
          horizMid = (left + right) / 2
          left = horizMid - cropHeight * ratio / 2
          right = horizMid + cropHeight * ratio / 2
          left, right = overlapRange(left, right, 0, pic.img_width)
        end
      end
    end
    
    # Build the string to return
    output = "<!--showPic-->"
    output += "<div style=\"position:relative;height:#{drawHeight}px;width:#{drawWidth}px;\">"
    if link
      output += "<a href=\"#{href}\""
      if newTab
        output += " target=\"_blank\""
      end
      output += ">"
    end
    output += "<div style=\"position:absolute;left:-#{left * widthScale}px;top:-#{top * heightScale}px;clip:rect(#{top * heightScale || 0}px,#{right * widthScale || 0}px,#{bottom * heightScale || 0}px,#{left * widthScale || 0}px);\">"
    output += "<img src=\"#{pic.url}\" height=\"#{pic.img_height * heightScale}px\" width=\"#{pic.img_width * widthScale}px\">"
    output += "</div>"
    if link
      output += "</a>"
    end
    output += "</div>"
        
    output.html_safe
  end
  
  # Public: Takes a low value, a high value, and a range. If both values are in
  # the range, they are not changed. If one value is outside of the range, both
  # values are moved an equal amount until both are in the range. If the
  # difference between the two values is larger than the range, they are
  # centered about the range.
  #
  # lowVal  -  The lower value
  # highVal -  The higher value
  # rangeMin - The lower bound of the range
  # rangeMax - the upper bound of the range
  #
  # Examples
  #
  #   overlapRange(2, 3, 1, 4)
  #   # => [2, 3]
  #
  #   overlapRange(3, 8, 4, 5)
  #   # => [2, 7]
  #
  #   overlapRange(2, 4, 3, 9)
  #   # => [3, 5]
  #
  # Returns an array with the modified values. [lowVal, highVal]
  def overlapRange(lowVal, highVal, rangeMin, rangeMax)
    if lowVal < rangeMin
      highVal += rangeMin - lowVal
      lowVal = rangeMin
    end
    if highVal > rangeMax
      lowVal -= highVal - rangeMax
      highVal = rangeMax
    end
    if lowVal < rangeMin || highVal > rangeMax
      overflow = (highVal - lowVal) - (rangeMax - rangeMin)
      lowVal = rangeMin - overflow / 2
      highVal = rangeMax + overflow / 2
    end
    return lowVal, highVal
  end
end