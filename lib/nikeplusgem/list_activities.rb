module NikePlusGem
  class Client

    LIST_ACTIVITY_PARAMS = ["offset", "count", "startDate", "endDate"]

    def list_activities(params={})
      params = params.select {|param| LIST_ACTIVITY_PARAMS.include?(param)}

      get("/me/sport/activities", params)
    end

  end
end