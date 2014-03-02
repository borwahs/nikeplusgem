module NikePlusGem
  class Helpers

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
