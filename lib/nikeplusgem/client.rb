module NikePlusGem
  class Client

    BASE_URL = "https://api.nike.com".freeze
    ENDPOINT = "/me/sport/activities".freeze

    def initialize(access_token, app_id)
      @access_token = access_token
      @app_id = app_id
    end

    def get()
      url = "#{BASE_URL}#{ENDPOINT}" << "?access_token=#{@access_token}"

      json_result = ""

      open(url, 'appid' => @app_id, 'Accept' =>'application/json') do |f|
        response = f.read

        json_result = JSON.parse(response)
      end

      json_result
    end

  end
end