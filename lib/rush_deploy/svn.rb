class SVN
  def self.current_revision
    `svn info`.grep(/^Revision: /).first.split(': ')[1].chomp
  end
  
  def self.url
    `svn info`.grep(/^URL: /).first.split(': ')[1].chomp
  end
end