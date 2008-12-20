require 'rubygems'
require 'rush'

class RushDeploy
  def initialize(options = {})
    return nil if options[:host].blank? || options[:path].blank?
    @server = Rush::Box.new(options[:host])
    @dir = @server[options[:path]].create
  end

  def cmd(cmd_str, options = {})
    puts "== #{cmd_str} #{options.inspect unless options == {}}"
    result = @dir.bash(cmd_str, options)
    puts result unless result.blank?
    result
  end
  
  def run(cmds)
    cmds.each { |c| cmd(c) }
  end
end
