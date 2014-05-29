require "favicon_maker"

module Middleman
  module FaviconMaker
    class FaviconMakerExtension < Extension

      option :template_dir, nil, "Template dir for icon templates"
      option :output_dir,   nil, "Output dir for generated icons"
      option :icons,        {}, "Hash with template filename (key) and Array of Hashes with icon configs"

      def after_configuration
        options[:template_dir]  ||= source_path if options[:template_dir].nil?
        options[:output_dir]    ||= build_path  if options[:output_dir].nil?
      end

      def after_build(builder)

        template_files = []
        ::FaviconMaker.generate do
          setup do
            template_dir  options[:template_dir]
            output_dir    options[:output_dir]
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

      private
      def source_path
        File.join(app.root, app.settings[:source])
      end

      def build_path
        File.join(app.root, app.settings[:build_dir])
      end
    end
  end
end
