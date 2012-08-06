middleman-favicon-maker
=======================
Generate favicon files in various sizes from a base image in your [Middleman](http://middlemanapp.com/) project.

This gem integrates [FaviconMaker](https://github.com/follmann/favicon_maker) effortless into your [Middleman](https://github.com/middleman/middleman) project.


## IMPORTANT:

**Updated to support Middleman version 3.0.0 and above.**

Due to Middleman code changes **this version is NOT compatible with version 2.x installs of Middleman**.

Use version **0.0.6** of the `middleman-favicon-maker` gem for version 2.x installs of Middleman.



## Install

### Standalone
    gem install middleman-favicon-maker

### Using Bundler (recommended)
    gem "middleman-favicon-maker"

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

**NOTE: The base image will not be copied to the build folder.**

## Customise integration


**NOTE! v3.x of this gem uses a `favicon_maker_` prefix on the configuration options, whereas v.0.0.6 uses a `favicon_` prefix only.**

**Why the change?  Consistency with the official activation keyword `:favicon_maker`.**


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

&copy; 2011 Andreas Follmann. See LICENSE for details.