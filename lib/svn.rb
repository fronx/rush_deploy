class SVN
  def self.current_revision
    `svn info`.grep(/^Revision: /).first.split(': ')[1]
  end
  
  def self.url
    "http://svn2.assembla.com/svn/fronx"
  end
end

# puts SVN.current_revision