require 'faker'
class MyPicUrlService
    def initialize(conn)
        @conn = conn
    end
    def generateFromPic(pic)
        url = generateUrl(pic)
        response = conn.get(url)

        return response.body
    end
    attr_reader :conn
    private
    def generateUrl(pic)
        return Faker::Placeholdit.image("#{pic['width']}x#{pic['height']}", pic['format'], Faker::Color.hex_color.tr('#', ''), Faker::Color.hex_color.tr('#', ''), pic['text'])
    end
end
