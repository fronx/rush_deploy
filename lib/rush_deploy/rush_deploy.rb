require 'rubygems'
require 'rush'

module RushDeploy
  class Remote
    def initialize(options = {})
      return nil if options[:host].blank? || options[:path].blank?
      @server = Rush::Box.new(options[:host])
      @dir = @server[options[:path]].create
      Local.deploy_file.copy_to @dir['lib/tasks/']
    end
    
    def run(str_or_array)
      cmds = str_or_array.is_a?(Array) ? str_or_array : [str_or_array]
      cmds.each do |cmd|
        puts "== #{cmd}"
        result = @dir.bash(cmd)
        puts result unless result.blank?
      end
    end

    def last_revision
      deploy_info[0] rescue nil
    end
    
    def last_migration
      deploy_info[1] rescue nil
    end
    
    def deploy_info
      @dir['deploy_info'].contents.split("\n")
    end
  end

  class Local
    def self.dir
      @dir ||= Rush::Dir.new(`pwd`.chomp.ensure_trailing_slash)
    end
    
    def self.deploy_file
      dir['lib/tasks/deploy.rake']
    end
    
    def self.set_rollback_marker(current_migration_version)
      dir['deploy_info'].write(SVN.current_revision + current_migration_version.to_s)
    end
    
    def self.last_revision
      deploy_info[0] rescue nil
    end
    
    def self.last_migration
      deploy_info[1] rescue nil
    end
    
    def self.deploy_info
      dir['deploy_info'].contents.split("\n")
    end
  end
  
end