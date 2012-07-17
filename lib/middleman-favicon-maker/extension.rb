module Middleman
  module FaviconMaker
    class << self
      def registered(app, options={})
        app.set :favicon_maker_root_dir,        ""
        app.set :favicon_maker_input_dir,       ""
        app.set :favicon_maker_output_dir,      ""
        app.set :favicon_maker_base_image,      "favicon_base.png"
        app.set :favicon_maker_versions,        []
        app.set :favicon_maker_custom_versions, {}
        
        app.after_configuration do
          # configs are either default or set by user in config.rb
          # due to Middleman extension limitations, we need to ensure they are sane
          # before we continue
          app.set :favicon_maker_root_dir,    root                if favicon_maker_root_dir.empty?
          app.set :favicon_maker_input_dir,   source              if favicon_maker_input_dir.empty?
          app.set :favicon_maker_output_dir,  build_dir           if favicon_maker_output_dir.empty?
          app.set :favicon_maker_base_image,  "favicon_base.png"  if favicon_maker_base_image.empty?
          
          unless favicon_maker_root_dir.empty?
            require "favicon_maker"
            if favicon_maker_versions.empty?
              app.set :favicon_maker_versions,    ::FaviconMaker::Generator::ICON_VERSIONS.keys
            end
          end
          
        end
        
        app.after_build do |builder|
          
          ::FaviconMaker::Generator.create_versions({
            :root_dir => favicon_maker_root_dir,
            :input_dir => favicon_maker_input_dir,
            :output_dir => favicon_maker_output_dir,
            :base_image => favicon_maker_base_image,
            :versions => favicon_maker_versions,
            :custom_versions => favicon_maker_custom_versions,
            :copy => true
          }) do |f|
            builder.say_status :generated, f.gsub(root + "/", "")
          end
          
          # remove favicon_base_image from the build dir
          builder.remove_file File.join(favicon_maker_root_dir, favicon_maker_output_dir, favicon_maker_base_image)
          
        end
        
      end
      alias :included :registered
      
    end
    
  end
  
end
