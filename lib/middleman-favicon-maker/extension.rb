require 'favicon_maker'

module Middleman
  module FaviconMaker
    class FaviconMakerExtension < Extension
      option :template_dir, nil, 'Template dir for icon templates'
      option :icons, {}, 'Hash with template filename (key) and Array of Hashes with icon configs'

      def after_build builder
        ::FaviconMaker.generate do
          setup do
            template_dir File.join app.source_dir, options[:template_dir]
            output_dir app.build_dir
          end

          options[:icons].each do |input_filename, icon_configs|
            from input_filename do
              icon_configs.each do |icon_config|
                icon icon_config.delete(:icon), icon_config
              end
            end
          end

          each_icon do |filepath, template_filepath|
            builder.say_status :create, filepath
          end
        end
      end
    end
  end
end
