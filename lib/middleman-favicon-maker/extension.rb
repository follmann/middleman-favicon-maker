module Middleman
  module FaviconMaker
    class << self
      def registered(app, options={})
        require "favicon_maker"

        options[:favicon_maker_root_dir]        ||= ''
        options[:favicon_maker_input_dir]       ||= ''
        options[:favicon_maker_output_dir]      ||= ''
        options[:favicon_maker_base_image]      ||= 'favicon_base.png'
        options[:favicon_maker_versions]        ||= ::FaviconMaker::Generator::ICON_VERSIONS.keys
        options[:favicon_maker_custom_versions] ||= {}

        app.after_configuration do
          # configs are either default or set by user in config.rb
          # due to Middleman extension limitations, we need to ensure they are sane
          # before we continue
          options[:favicon_maker_root_dir]   = root      if options[:favicon_maker_root_dir].empty?
          options[:favicon_maker_input_dir]  = source    if options[:favicon_maker_input_dir].empty?
          options[:favicon_maker_output_dir] = build_dir if options[:favicon_maker_output_dir].empty?
        end

        app.after_build do |builder|
          ::FaviconMaker::Generator.create_versions({
            :root_dir =>        options[:favicon_maker_root_dir],
            :input_dir =>       options[:favicon_maker_input_dir],
            :output_dir =>      options[:favicon_maker_output_dir],
            :base_image =>      options[:favicon_maker_base_image],
            :versions =>        options[:favicon_maker_versions],
            :custom_versions => options[:favicon_maker_custom_versions],
            :copy =>            true
          }) do |f, status|
            builder.say_status status, f.gsub(root + "/", "")
          end

          # remove favicon_base_image from the build dir
          builder.remove_file File.join(options[:favicon_maker_root_dir], options[:favicon_maker_output_dir], options[:favicon_maker_base_image])
        end
      end
      alias :included :registered
    end
  end
end
