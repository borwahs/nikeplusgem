class Hash

  # Removes keys from Hash that aren't provided in params
  #
  # @param params [Hash] The keys to keep in the returned hash
  #
  # @return [Hash] A hash with only the keys provided
  def only(params)
    self.select {|param| params.include?(param)}
  end

end
