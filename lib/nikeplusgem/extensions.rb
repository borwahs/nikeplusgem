class Hash

  def only(params)
    self.select {|param| params.include?(param)}
  end

end
