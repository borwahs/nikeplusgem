module NikePlusGem
  class Client

    BASE_URL = "https://api.nike.com".freeze
    ENDPOINT = "/me/sport/activities".freeze

    attr_reader :access_token
    attr_reader :app_id

    def initialize(access_token, app_id)
      @access_token = access_token
      @app_id = app_id
    end

    def build_headers(headers={})
      req_headers = {'appid' => @app_id, 'Accept' =>'application/json'}

      if not headers.empty?
	      req_headers.merge!(headers)
	    end

	    req_headers
    end

    def parameterize(params)
      URI.escape(params.collect{|k,v| "#{k}=#{v}"}.join('&'))
    end

    def generate_uri(endpoint, query_string_params={})
      param_str = ""

      query_string_params["access_token"] = @access_token
      if not query_string_params.empty?
        param_str = parameterize(query_string_params)
      end

      url = URI.join(BASE_URL, endpoint)
      if not param_str.empty?
        url = URI.join(url, "?" << param_str)
      end
    end

    def get(headers={})
      uri = generate_uri(ENDPOINT)

      headers = build_headers(headers)

      req = Net::HTTP::Get.new(uri, headers)

      res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(req)
      end

      res.body
    end

  end
end