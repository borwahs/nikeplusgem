module NikePlusGem
  class Client

    EXPERIENCE_TYPE_PARAM = ["experienceType", "offset", "count", "startDate", "endDate"]
    EXPERIENCE_TYPES = ["RUNNING", "FUELBAND"]

    def experience_type(params={})
      params = params.only(EXPERIENCE_TYPE_PARAM)

      unless params.include?("experienceType") and !params["experienceType"].empty?
        raise ArgumentError, "Must specify the Experience Type to fetch results for."
      end

      unless EXPERIENCE_TYPES.include?params["experienceType"]
        raise ArgumentError, "Must specify a valid Experience Type"
      end

      exp_type = params["experienceType"]

      get("/me/sport/activities/" << exp_type, params)
    end

  end
end
