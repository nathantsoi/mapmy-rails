module Openlayers
  module Rails
    class Engine < ::Rails::Engine
      # Make rails look at the vendored assets

      # Enabling assets precompiling under rails 3.1
      if ::Rails.version >='3.1'
        initializer :assets do |config|
          ::Rails.application.config.assets.precompile += %w( openlayers/theme/default/style.css )
        end
      end

    end
  end
end
