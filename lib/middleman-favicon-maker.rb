module Middleman
  module Features
    module FaviconMaker
      class << self
        def registered(app)
          require "favicon_maker"
      
          app.set :favicon_root_dir, app.root
          app.set :favicon_input_dir, app.views
          app.set :favicon_output_dir, app.build_dir
          app.set :favicon_base_image, "favicon_base.png"
          app.set :favicon_versions, ::FaviconMaker::Generator::ICON_VERSIONS.keys
          
          app.after_build do
            ::FaviconMaker::Generator.create_versions({
              :root_dir => app.settings.favicon_root_dir,
              :input_dir => app.settings.favicon_input_dir,
              :output_dir => app.settings.favicon_output_dir,
              :base_image => app.settings.favicon_base_image,
              :versions => app.settings.favicon_versions,
              :custom_versions => app.settings.favicon_custom_versions,
            }) do |filepath|
              say_status :generated, filepath.gsub(app.root + "/", "")
            end
          end
      
          # exclude favicon_base_image from being copied to build dir
          app.build_reroute do |destination, request_path|
            if request_path.include? app.settings.favicon_base_image
              throw
            end
          end
        end
        alias :included :registered
      end
    end
  end
end