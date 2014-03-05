module NikePlusGem
  class Client

    LIST_ACTIVITY_PARAMS = ["offset", "count", "startDate", "endDate"]

    # Get details of the user's activities, beginning with the most recent, as a paginated list
    #
    # @param params [Hash] Query Parameters to include in call
    #
    # @option params [String] offset Pagination - first record to
    #   retrieve (starts at 1)
    # @option params [String] count Pagination - number of records to
    #   retrieve (default 5)
    # @option params [String] startDate The Activity list's start date
    #   in ISO8601 standard format, 'yyyy-mm-dd'
    # @option params [String] endDate The Activity list's end date in
    #   ISO8601 standard format, 'yyyy-mm-dd'
    #
    # @return [Hash] A hash with the requested Activities
    def list_activities(params={})
      params = params.only(LIST_ACTIVITY_PARAMS)

      get("/me/sport/activities", params)
    end

  end
end
