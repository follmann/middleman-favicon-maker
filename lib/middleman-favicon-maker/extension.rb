require "favicon_maker"
require "pathname"

module Middleman
  module FaviconMaker
    class FaviconMakerExtension < Extension

      option :template_dir, nil, "Template dir for icon templates"
      option :output_dir,   nil, "Output dir for generated icons"
      option :icons,        {},  "Hash with template filename (key) and Array of Hashes with icon configs"

      def after_configuration
        options[:template_dir] ||= app.config.source
        options[:output_dir]   ||= app.config.build_dir
      end

      def after_build(builder)
        ::FaviconMaker.generate do
          setup do
            template_dir  options[:template_dir]
            output_dir    options[:output_dir]
          end

          options[:icons].each do |input_filename, icon_configs|
            from input_filename do
              icon_configs.each do |icon_config|
                icon icon_config[:icon], icon_config
              end
            end
          end

          each_icon do |filepath, _template_filepath|
            builder.trigger(:created, relative_path_to_root(filepath))
          end
        end
      end

      def manipulate_resource_list(resources)
        options[:icons].each do|src, items|
          resources += items.map do|item|
            ::Middleman::Sitemap::Resource.new(
              app.sitemap,
              item[:icon],
              File.join(app.root, relative_path_to_root(options[:template_dir]), src)
            )
          end
        end
        resources
      end

      private

      def relative_path_to_root(filepath)
        pathname = Pathname.new(filepath)
        if pathname.absolute?
          pathname.relative_path_from(Pathname.new(app.root)).to_s
        else
          filepath
        end
      end
    end
  end
end
