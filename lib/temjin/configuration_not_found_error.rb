module Temjin
  class ConfigurationNotFoundError < StandardError
    def initialize(message = nil)
      message ||= "Configuration not found. Please run `temjin config init`."
      super(message)
    end
  end
end
