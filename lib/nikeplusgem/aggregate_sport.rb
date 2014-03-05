module NikePlusGem
  class Client

    # Get list of Nike+ experiences in which the user participates and
    # a summary of the user's statistics for each sport category
    #
    # @param params [Hash] Additional Query String parameters
    #
    # @return [Hash] A hash of the user's Nike+ Experiences
    def aggregate_sport(params={})
      get("/me/sport")
    end

  end
end
