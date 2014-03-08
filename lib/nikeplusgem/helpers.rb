module NikePlusGem
  class Helpers

    # Format any of a variety of date types into the formatted string
    # required when using the API.
    #
    # The date parameter can take several different kind of objects: a
    # DateTime object, a Date object, a Time object or a String object.
    #
    # @param [DateTime, Date, Time, String] date The object to format into a
    #   date string
    #
    # @return [String] Date in "yyyy/MM/dd" string format; or ERROR if unable
    #   parse
    def self.format_date(date)
      if date.nil?
        return "ERROR"
      end

      if date.instance_of? Date or date.instance_of? Time or date.instance_of? DateTime
        return date.strftime("%Y/%m/%d")
      elsif date.is_a? String and not date.empty?
        match = date.match(/(\d{4}\/\d{2}\/\d{2}).*/)

        if match.nil?
          return "ERROR"
        end

        capture_groups = match.captures

        return Date.strptime(capture_groups[0], "%Y/%m/%d").strftime("%Y/%m/%d")
      end

      "ERROR"
    end

    # Merges user defined headers with the required headers needed by API
    #
    # @param app_id [String] The Application ID
    # @param headers [Hash] Additional headers defined by user
    #
    # @return [Hash] Merge of user Headers and required headers by API
    def self.merge_required_headers(app_id, headers={})
      req_headers = {"appid" => app_id, "Accept" => "application/json"}

      if not headers.empty?
        req_headers.merge!(headers)
      end

      req_headers
    end

    # Merges query parameter key/value with the required Access Token parameter
    #
    # @param access_token [String] The Access Token to communicate with the API
    # @param params [Hash] Additional Query String Parameters
    #
    # @return [Hash] Passed in query string parameter hash with Access Token key/value
    def self.merge_required_qs_params(access_token, params={})
      params.merge!({"access_token" => access_token})
    end

    # Joins two strings into a URI object
    #
    # @param base [String] The base portion of the URL
    # @param endpoint [String] The endpoint to append to the base URL
    #
    # @return [URI] Joined URL of base and endpoint
    def self.combine_url_endpoint(base, endpoint)
      URI.join(base, endpoint)
    end

  end
end
