module NikePlusGem
  class Client
    include HTTParty

    BASE_URL = "https://api.nike.com"

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

    def create_qs_params_hash(params={})
      params.merge!({"access_token" => @access_token})
    end

    def combine_url_endpoint(base, endpoint)
      URI.join(base, endpoint)
    end

    def get(endpoint, qs_options={}, headers={})
      query_string_params = create_qs_params_hash(qs_options)
      headers = build_headers(headers)

      options = {}
      options[:headers] = headers
      options[:query] = query_string_params

      url = combine_url_endpoint(BASE_URL, endpoint)

      res = self.class.get(url.to_s, options)
      res.parsed_response
    end

  end
end