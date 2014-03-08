module NikePlusGem
  class Client

    # Get details of one of the user's activities, by Activity ID
    #
    # @param activity_id [String, Integer] The Activity ID to request
    #
    # @return [Hash] A hash with the requested Activity
    def activity_data(activity_id)
      get("/me/sport/activities/#{activity_id}")
    end

  end
end
