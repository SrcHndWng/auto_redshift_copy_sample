require 'settingslogic'

module AutoRedshiftCopySample
  class Settings < Settingslogic
    source File.expand_path("../../config/application.yml", __FILE__)
    namespace ENV['BATCH_ENV'] ? ENV['BATCH_ENV'] : 'development'
  end
end
