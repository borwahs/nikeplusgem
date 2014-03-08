module NikePlusGem
  class Client

    # Get list of Nike+ experiences in which the user participates and
    # a summary of the user's statistics for each sport category
    #
    # @return [Hash] A hash of the user's Nike+ Experiences
    def aggregate_sport()
      get("/me/sport")
    end

  end
end
