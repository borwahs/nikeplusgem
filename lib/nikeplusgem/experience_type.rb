module NikePlusGem
  class Client

    EXPERIENCE_TYPE_PARAM = ["experienceType", "offset", "count", "startDate", "endDate"]

    def experience_type(params={})
      params = params.only(EXPERIENCE_TYPE_PARAM)

      exp_type = params["experienceType"]

      get("/me/sport/activities/" << exp_type, params)
    end

  end
end
