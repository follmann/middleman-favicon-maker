middleman-favicon-maker [![Build Status](https://secure.travis-ci.org/follmann/middleman-favicon-maker.png)](http://travis-ci.org/follmann/middleman-favicon-maker)
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
1. Put a file called **favicon_base.png** into your source folder (ideally with the **dimensions of 144x144 pixels**)
<br><br>
2. In your config.rb extend the `configure :build` block with:

        configure :build do
          ...
          activate :favicon_maker
          ...
        end

That results in the following files being created in your middleman build directory:

    build/apple-touch-icon-144x144-precomposed.png
    build/apple-touch-icon-120x120-precomposed.png
    build/apple-touch-icon-114x114-precomposed.png
    build/apple-touch-icon-72x72-precomposed.png
    build/apple-touch-icon-57x57-precomposed.png
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

## Meta links to include in your markup
> This is not strictly neccessary if you only want to support iOS devices. Since the filenames used for the icons are picked up automatically by iOS if the files sit in the root dir, similar to how a favicon.ico is found. If you wnat to make sure Android and Blackberry use the icons as well, you have to reference them in the document.
> More information on this topic: [Everything you always wanted to know about touch icons](http://mathiasbynens.be/notes/touch-icons)

### HTML
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="apple-touch-icon-144x144-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="apple-touch-icon-114x114-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="apple-touch-icon-72x72-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" href="apple-touch-icon-precomposed.png" />
    <link rel="shortcut icon" href="favicon.png" />
    <!-- should actually be placed in your root dir -->
    <link rel="icon" type="image/ico" href="favicon.ico" />
### HAML
    %link{ rel: "apple-touch-icon", sizes: "144x144", href: "apple-touch-icon-144x144-precomposed.png" }
    %link{ rel: "apple-touch-icon", sizes: "114x114", href: "apple-touch-icon-114x114-precomposed.png" }
    %link{ rel: "apple-touch-icon", sizes: "72x72", href: "apple-touch-icon-72x72-precomposed.png" }
    %link{ rel: "apple-touch-icon", href: "apple-touch-icon-precomposed.png" }
    %link{ rel: "shortcut icon", href: "favicon.png" }
    / should actually be placed in your root dir
    %link{ rel: "icon", type: "image/ico", href: "favicon.ico" }

## Copyright

&copy; 2011-2013 Andreas Follmann. See LICENSE for details.
