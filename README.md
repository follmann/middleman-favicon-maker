# middleman-favicon-maker [![Build Status](https://secure.travis-ci.org/follmann/middleman-favicon-maker.png)](http://travis-ci.org/follmann/middleman-favicon-maker)

[FaviconMaker](https://github.com/follmann/favicon_maker) is a gem which generates favicon files in various sizes from a base image. This gem integrates FaviconMaker effortlessly into your [Middleman](https://github.com/middleman/middleman) project.

## Installation

### Dependencies

Before you can use FaviconMaker, you need to install [ImageMagick](http://www.imagemagick.org/script/index.php). On OS&nbsp;X, the easiest way to do this is to run:

``` shell
brew install imagemagick
```

### Using Bundler (recommended)

``` ruby
gem "middleman-favicon-maker", "~> 3.2"
```

If you're using Middleman version 2.x, use version 0.0.6 of middleman-favicon-maker.

### Standalone

``` shell
gem install middleman-favicon-maker
```

## Integrating with Middleman

Create a favicon_base.png image and place it in your source directory. Ideally, this image's dimensions would be 144 x 144. In config.rb, extend the `configure :build` block:

``` ruby
configure :build do
  ...
  activate :favicon_maker
  ...
end
```

When you build your Middleman project, middleman-favicon-maker will generate the following files  in your build directory:

* apple-touch-icon-144x144-precomposed.png
* apple-touch-icon-120x120-precomposed.png
* apple-touch-icon-114x114-precomposed.png
* apple-touch-icon-72x72-precomposed.png
* apple-touch-icon-57x57-precomposed.png
* apple-touch-icon-precomposed.png
* apple-touch-icon.png
* favicon.ico
* favicon.png

The base image will not be copied into the build folder.

## Customizing middleman-favicon-maker

Version 3.x of this gem uses the `favicon_maker_` prefix for configuration options to be consistent with the activation keyword `:favicon_maker`. Previously the `favicon_` prefix was used.

You can set the following options for middleman-favicon-maker:

``` ruby
:favicon_maker_root_dir        # default: app.root
:favicon_maker_input_dir       # default: app.views -> source/
:favicon_maker_output_dir      # default: app.build_dir -> build/
:favicon_maker_base_image      # default: "_favicon_base.png"
:favicon_maker_versions        # default: [ :fav_png, :fav_ico ]
:favicon_maker_custom_versions # default: {}
```

For example:

``` ruby
activate :favicon_maker,
  :favicon_maker_input_dir       =>"favicons"
  :favicon_maker_custom_versions => {:apple_extreme_retina => {:filename => "apple-touch-icon-228x228-precomposed.png", :dimensions => "228x228", :format => "png"}}
```

## Markup meta links

Specifying meta links is only necessary if you want to support non-iOS devices. Safari mobile will automatically look for the icon files in the root directory. If you'd like to know more about how this works, check out this great blog post: [Everything you always wanted to know about touch icons](http://mathiasbynens.be/notes/touch-icons)

### HTML

``` html
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="apple-touch-icon-144x144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="apple-touch-icon-114x114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="apple-touch-icon-72x72-precomposed.png" />
<link rel="apple-touch-icon-precomposed" href="apple-touch-icon-precomposed.png" />
<link rel="shortcut icon" href="favicon.png" />
<link rel="icon" type="image/ico" href="favicon.ico" />
```

### HAML

``` haml
%link{ rel: "apple-touch-icon", sizes: "144x144", href: "apple-touch-icon-144x144-precomposed.png" }
%link{ rel: "apple-touch-icon", sizes: "114x114", href: "apple-touch-icon-114x114-precomposed.png" }
%link{ rel: "apple-touch-icon", sizes: "72x72", href: "apple-touch-icon-72x72-precomposed.png" }
%link{ rel: "apple-touch-icon", href: "apple-touch-icon-precomposed.png" }
%link{ rel: "shortcut icon", href: "favicon.png" }
%link{ rel: "icon", type: "image/ico", href: "favicon.ico" }
```

## Copyright

&copy; 2011-2013 Andreas Follmann. See LICENSE for details.
