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

      if access_token.nil? or access_token.empty?
        raise InvalidArgumentError, "The Access Token must be set"
      end

      if app_id.nil? or app_id.empty?
        raise InvalidArgumentError, "The App ID must be set"
      end

      @access_token = access_token
      @app_id = app_id
    end

    private

      def get(endpoint, qs_options={}, headers={})
        options = {}
        options[:headers] = Helpers.merge_required_headers(@app_id, headers)
        options[:query] = Helpers.merge_required_qs_params(@access_token, qs_options)

        url = Helpers.combine_url_endpoint(BASE_URL, endpoint)

        res = self.class.get(url.to_s, options)
        res.parsed_response
      end

  end
end
