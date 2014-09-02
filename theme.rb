include_theme("background-image-toolkit")
include_theme("clear-code")
include_theme("groonga")

match(TitleSlide) do |slides|
  conoha_image_file_name = "ConoHa_ghtt_header.jpg"
  unless File.exist?(conoha_image_file_name)
    conoha_image_url = "https://dzpp79ucibp5a.cloudfront.net/events_banners/12676_normal_1408435839_ConoHa_ghtt_header.jpg"
    open(conoha_image_url) do |image|
      File.open(conoha_image_file_name, "wb") do |output|
        output.print(image.read)la
      end
    end
  end
  slides.each do |slide|
    options = {
      :file_name => conoha_image_file_name,
      :properties => {
        :width => canvas.width,
        :relative_padding_bottom => 7,
      }
    }
    apply_background_image_property(slide, options)
  end
end

match(TitleSlide, Title) do |titles|
  titles.hide
end
