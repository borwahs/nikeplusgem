module NikePlusGem
  class Client
    include HTTParty

    BASE_URL = "https://api.nike.com"

    # Gets the Access Token to be used in calls to API. Set via
    # the constructor.
    #
    # @return [String]
    attr_reader :access_token

    # Gets the Application ID to be sent in Header for calls to
    # API. Set via the constructor.
    #
    # @return [String]
    attr_reader :app_id

    # Creates a client object to communicate with API
    #
    # @param access_token [String] The Access Token needed to authorize
    # @param app_id [String] The Application ID to send in Header
    #
    # @example Create new client with Access Token and App ID
    #   client = NikePlusGem::Client.new("abcdef12345", "My Nike+ Data")
    #
    # @return [Client] A NikePlusGem::Client object
    def initialize(access_token, app_id)
      @access_token = access_token
      @app_id = app_id
    end

    # Merges user defined headers with the required headers needed by API
    #
    # @param headers [Hash] Additional headers defined by user
    #
    # @return [Hash] Merge of user Headers and required headers by API
    def build_headers(headers={})
      req_headers = {'appid' => @app_id, 'Accept' =>'application/json'}

      if not headers.empty?
	      req_headers.merge!(headers)
	    end

	    req_headers
    end

    # Merges query parameter key/value with the required Access Token parameter
    #
    # @param params [Hash] Additional Query String Parameters
    #
    # @return [Hash] Passed in query string parameter hash with Access Token key/value
    def create_qs_params_hash(params={})
      params.merge!({"access_token" => @access_token})
    end

    # Joins two strings into a URI object
    #
    # @param base [String] The base portion of the URL
    # @param endpoint [String] The endpoint to append to the base URL
    #
    # @return [URI] Joined URL of base and endpoint
    def combine_url_endpoint(base, endpoint)
      URI.join(base, endpoint)
    end

    # Helper method to call into the Nike+ API
    #
    # @param endpoint [String] The endpoint to hit in the Nike+ API
    # @param qs_options [Hash] The query string parameters to append to the URL
    # @param headers [Hash] THe headers to include in the get request
    #
    # @return [Hash] The parsed JSON response as a Hash
    def get(endpoint, qs_options={}, headers={})
      options = {}
      options[:headers] = build_headers(headers)
      options[:query] = create_qs_params_hash(qs_options)

      url = combine_url_endpoint(BASE_URL, endpoint)

      res = self.class.get(url.to_s, options)
      res.parsed_response
    end

  end
end
