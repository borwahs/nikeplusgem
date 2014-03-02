module NikePlusGem
  class Client

    AGGREGATE_SPORT_PARAM = []

    def aggregate_sport(params={})
      params = params.only(AGGREGATE_SPORT_PARAM)

      get("/me/sport", params)
    end

  end
end
