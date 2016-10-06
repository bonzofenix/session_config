require 'session_config/version'
require 'yaml'

class String
  def underscore
    self.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
  end
end

module SessionConfig
  def set_conf(key, val)
    conf = {}
    Dir.mkdir(session_config_dir) unless Dir.exists?(session_config_dir)
    conf = YAML.load_file(conf_file_path) if File.exists?(conf_file_path)
    conf[key] = val
    File.open(conf_file_path, 'w'){|f| f.write(conf.to_yaml) }
  end

  def session_config_dir
    "#{ENV['HOME']}/.#{self.to_s.underscore}"
  end

  def conf_file_path
    "#{session_config_dir}/conf.yml"
  end

  def get_conf(key)
    conf = {}
    conf = YAML.load_file(conf_file_path) if File.exists?(conf_file_path)
    conf[ key ]
  end
end
