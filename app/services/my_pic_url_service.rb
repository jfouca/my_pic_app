require 'faraday'
require 'faker'
class MyPicUrlService
    def generateFromPic(pic)
        url = generateUrl(pic)
        conn = Faraday.new(:url => url)
        response = conn.get

        return response.body
    end
    private
    def generateUrl(pic)
        return Faker::Placeholdit.image("#{pic['width']}x#{pic['height']}", pic['format'], Faker::Color.hex_color.tr('#', ''), Faker::Color.hex_color.tr('#', ''), pic['text'])
    end
end
