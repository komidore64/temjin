module Temjin
  class Config
    attr_accessor :username, :key, :token

    attr_reader :file_path

    def initialize(options = {})
      options = { :path => File.join(ENV['HOME'], '.config', 'temjin.yml'),
                  :create => false }.merge(options.select { |k, _| [:path, :create].include?(k) })

      @file_path = options[:path]

      create_or_verify_file(options[:create])

      config = YAML.load_file(@file_path) || {}
      @username = config.dig('username')
      @key = config.dig('key')
      @token = config.dig('token')

      verify_format unless options[:create]
    end

    def create_or_verify_file(create_bool = false)
      if create_bool
        FileUtils.touch(file_path)
      else
        raise Temjin::ConfigurationNotFoundError unless File.exist?(file_path)
      end
    end

    def verify_format
      malformed = username.nil? || key.nil? || token.nil?
      raise Temjin::ConfigurationNotFoundError if malformed
    end

    def save!
      File.open(file_path, 'w') do |f|
        f.write({'username' => username, 'key' => key, 'token' => token}.to_yaml)
      end
    end
  end
end
