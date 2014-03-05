module NikePlusGem
  class Client

    ACTIVITY_DATA = ["activityID"]

    # Get details of one of the user's activities, by Activity ID
    #
    # @param params [Hash] Query Parameters to include in call
    #
    # @option params [String] activityID The Activity ID. REQUIRED
    #
    # @return [Hash] A hash with the requested Activity
    def activity_data(params={})
      params = params.only(ACTIVITY_DATA)

      unless params.include?("activityID") and !params["activityID"].empty?
        raise ArgumentError, "Must specify the Activity ID to fetch results for."
      end

      activity_id = params["activityID"]

      get("/me/sport/activities/" << activity_id)
    end

  end
end
