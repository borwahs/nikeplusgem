module NikePlusGem
  class Client

    ACTIVITY_DATA = ["activityId"]

    def activity_data(params={})
      params = params.only(ACTIVITY_DATA)

      activity_id = params["activityId"]

      get("/me/sport/activities/" << activity_id, params)
    end

  end
end
