class String
  def has_trailing_slash?
    self[-1] == '/'
  end

  def ensure_trailing_slash
    self + '/' unless has_trailing_slash?
  end
  
  def ensure_trailing_slash!
    self << '/' unless has_trailing_slash?
  end
end