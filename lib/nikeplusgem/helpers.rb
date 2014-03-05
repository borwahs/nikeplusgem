module NikePlusGem
  class Helpers

    # Format any of a variety of date types into the formatted string
    # required when using the API.
    #
    # The date parameter can take several different kind of objects: a
    # DateTime object, a Date object, a Time object or a String object.
    #
    # @param [DateTime, Date, Time, String] date The object to format into a
    #   date string
    #
    # @return [String] Date in "yyyy/MM/dd" string format; or ERROR if unable
    #   parse
    def self.format_date(date)
      if date.nil?
        return "ERROR"
      end

      if date.instance_of? Date or date.instance_of? Time or date.instance_of? DateTime
        return date.strftime("%Y/%m/%d")
      elsif date.is_a? String and not date.empty?
        match = date.match(/(\d{4}\/\d{2}\/\d{2}).*/)

        if match.nil?
          return "ERROR"
        end

        capture_groups = match.captures

        return Date.strptime(capture_groups[0], "%Y/%m/%d").strftime("%Y/%m/%d")
      end

      "ERROR"
    end

  end
end
