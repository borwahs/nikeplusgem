module NikePlusGem
  class Client

    LIST_ACTIVITY_PARAMS = ["offset", "count", "startDate", "endDate"]

    def list_activities(params={})
      params = params.only(LIST_ACTIVITY_PARAMS)

      get("/me/sport/activities", params)
    end

  end
end
