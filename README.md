middleman-favicon-maker
=======================
Generate favicon files in various sizes from a base image in your [Middleman](http://middlemanapp.com/) project.

This gem integrates [FaviconMaker](https://github.com/follmann/favicon_maker) effortless into your [Middleman](https://github.com/middleman/middleman) project.

## Install

### Standalone
    gem install middleman-favicon-maker

> Note: Use version **0.0.6** of the `middleman-favicon-maker` gem for version 2.x installs of Middleman.

### Using Bundler (recommended)
    gem "middleman-favicon-maker"

#### Don't forget ImageMagick
> ImageMagick is a dependecy of a dependecy of favicon_maker and therefore of this Gem as well. People tripped over this before, so be sure to have it installed. 
> e.g. on OSX a simple ```$ brew install imagemagick``` does it.

## How to integrate into a middleman project
1. Put a file called **favicon_base.png** into your source folder (ideally with the **dimensions of 114x114 pixels**)
<br><br>
2. In your config.rb extend the `configure :build` block with:

        configure :build do
          ...
          activate :favicon_maker
          ...
        end

That results in the following files being created in your middleman build directory:

    build/apple-touch-icon-57x57-precomposed.png
    build/apple-touch-icon-72x72-precomposed.png
    build/apple-touch-icon-114x114-precomposed.png
    build/apple-touch-icon-precomposed.png
    build/apple-touch-icon.png
    build/favicon.ico
    build/favicon.png

> Note: The base image will not be copied to the build folder.

## Customise integration

> Note: version **3.x** of this gem uses the `favicon_maker_` prefix for configuration options to be consistent with the activation keyword `:favicon_maker`. Until version **0.0.6** the `favicon_` prefix has been used.

You can set the following options for `middleman-favicon-maker`:

    :favicon_maker_root_dir  # default: app.root
    :favicon_maker_input_dir # default: app.views -> source/
    :favicon_maker_output_dir # default: app.build_dir -> build/
    :favicon_maker_base_image # default: "favicon_base.png"
    :favicon_maker_versions # default: ::FaviconMaker::Generator::ICON_VERSIONS.keys
    :favicon_maker_custom_versions # default: {}

    e.g.
    set :favicon_maker_input_dir, "favicons"
    set :favicon_maker_custom_versions, {:apple_extreme_retina => {:filename => "apple-touch-icon-228x228-precomposed.png", :dimensions => "228x228", :format => "png"}}

## Copyright

&copy; 2011-2013 Andreas Follmann. See LICENSE for details.
