module NikePlusGem
  class Client

    def aggregate_sport(params={})
      get("/me/sport")
    end

  end
end
