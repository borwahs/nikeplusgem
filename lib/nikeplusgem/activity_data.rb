module NikePlusGem
  class Client

    ACTIVITY_DATA = []

    def activity_data(params={})
      params = params.only(ACTIVITY_DATA)

      activity_id = params["activityId"]

      get("/me/sport/activities/" << activity_data, params)
    end

  end
end