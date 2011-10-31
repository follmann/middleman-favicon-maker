middleman-favicon-maker
============
Generate favicon files in various sizes from a base image in your middleman project.

This gem integrates [FaviconMaker](https://github.com/follmann/favicon_maker) effortless into your [Middleman](https://github.com/tdreyno/middleman) project.

## Install
### Standalone
    gem install middleman-favicon-maker

### Using Bundler (recommended)
    ...
    gem "middleman-favicon-maker"
    ...

## How to integrate into a middleman project
In your config.rb extend the configure :build block with:

    configure :build do
      ...
      activate :favicon_maker
      ...
    end

### Customise integration
You can set the following options for favicon-maker:

    :favicon_root_dir  # default: app.root
    :favicon_input_dir # default: app.views -> source/
    :favicon_output_dir # default: app.build_dir -> build/
    :favicon_base_image # default: "favicon_base.png"
    :favicon_versions # default: ::FaviconMaker::Generator::ICON_VERSIONS.keys
    
    e.g.
    set :favicon_input_dir, "favicons"

## Copyright

Copyright (c) 2011 Andreas Follmann. See LICENSE for details.