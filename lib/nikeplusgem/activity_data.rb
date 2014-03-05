module NikePlusGem
  class Client

    ACTIVITY_DATA = ["activityID"]

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
