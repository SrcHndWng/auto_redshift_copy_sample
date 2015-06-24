require 'settingslogic'

module AutoRedshiftCopySample
  class CommandSettings < Settingslogic
    source File.expand_path("../../config/command.yml", __FILE__)
    namespace ENV['BATCH_ENV'] ? ENV['BATCH_ENV'] : 'development'
  end
end
