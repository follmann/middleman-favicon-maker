# middleman-favicon-maker
[![Gem Version](https://badge.fury.io/rb/middleman-favicon-maker.svg)](http://badge.fury.io/rb/middleman-favicon-maker)
[![Code Climate](https://codeclimate.com/github/follmann/middleman-favicon-maker.png)](https://codeclimate.com/github/follmann/middleman-favicon-maker)

[FaviconMaker](https://github.com/follmann/favicon_maker) is a gem which generates favicon files in various sizes from a base image. This gem integrates FaviconMaker effortlessly into your [Middleman](https://github.com/middleman/middleman) project.

## Installation

### Dependencies

Before you can use FaviconMaker, you need to install [ImageMagick](http://www.imagemagick.org/script/index.php). On OS&nbsp;X, the easiest way to do this is to run:

``` shell
brew install imagemagick
```

### Using Bundler

``` ruby
gem "middleman-favicon-maker", "~> 4.0"
```

If you're using Middleman version 2.x, use version 0.0.6 of middleman-favicon-maker.

## Integrating with Middleman
### Templates
Create an image e.g. named `_favicon_template.png` and place it in your source directory. The leading underscore prevents it from being copied into the build directory. Ideally, this image's dimensions would be 152 x 152 or have multiple templates for different ranges (small, medium, big). In your config.rb, extend the `configure :build` block. The image formats used for templates should be either PNG or SVG (since v3.6).

### Simple config
This config assumes that a PNG file named `_favicon_template.png` lives in the source folder. The generated icons are stored in the build folder root.

``` ruby
configure :build do
  ...
  activate :favicon_maker, :icons => {
    "_favicon_template.png" => [
      { icon: "apple-touch-icon-152x152-precomposed.png" },
      { icon: "apple-touch-icon-114x114-precomposed.png" },
      { icon: "apple-touch-icon-72x72-precomposed.png" },
    ]
  }
  ...
end
```

### Advanced config
Using all configuration options. The `template_dir` and `output_dir` point to source and build dir if not set, you can use absolute or relative paths. You can use multiple template files that suit the different resolutions better. `format` and `size` are optional and only required when the size of the icon and/or the file format is not encoded in the filename. Multiple resolutions in one file is only supported for the .ico format.

``` ruby
configure :build do
  ...
  activate :favicon_maker do |f|
    f.template_dir  = 'source/images'
    f.icons = {
      "_favicon_template_hires.png" => [
        { icon: "apple-touch-icon-152x152-precomposed.png" },
        { icon: "apple-touch-icon-114x114-precomposed.png" },
        { icon: "apple-touch-icon-72x72-precomposed.png" },
        { icon: "mstile-144x144", format: :png },
      ],
      "_favicon_template_lores.png" => [
        { icon: "favicon.png", size: "16x16" },
        { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
      ]
    }
  end
  ...
end
```

### List of icons you might be interested in
This is a moving target. Feel free to extend it and submit the change.

``` ruby
  [
    { icon: "apple-touch-icon-180x180-precomposed.png" },             # Same as apple-touch-icon-57x57.png, for iPhone 6 Plus with @3× display
    { icon: "apple-touch-icon-152x152-precomposed.png" },             # Same as apple-touch-icon-57x57.png, for retina iPad with iOS7.
    { icon: "apple-touch-icon-144x144-precomposed.png" },             # Same as apple-touch-icon-57x57.png, for retina iPad with iOS6 or prior.
    { icon: "apple-touch-icon-120x120-precomposed.png" },             # Same as apple-touch-icon-57x57.png, for retina iPhone with iOS7.
    { icon: "apple-touch-icon-114x114-precomposed.png" },             # Same as apple-touch-icon-57x57.png, for retina iPhone with iOS6 or prior.
    { icon: "apple-touch-icon-76x76-precomposed.png" },               # Same as apple-touch-icon-57x57.png, for non-retina iPad with iOS7.
    { icon: "apple-touch-icon-72x72-precomposed.png" },               # Same as apple-touch-icon-57x57.png, for non-retina iPad with iOS6 or prior.
    { icon: "apple-touch-icon-60x60-precomposed.png" },               # Same as apple-touch-icon-57x57.png, for non-retina iPhone with iOS7.
    { icon: "apple-touch-icon-57x57-precomposed.png" },               # iPhone and iPad users can turn web pages into icons on their home screen. Such link appears as a regular iOS native application. When this happens, the device looks for a specific picture. The 57x57 resolution is convenient for non-retina iPhone with iOS6 or prior. Learn more in Apple docs.
    { icon: "apple-touch-icon-precomposed.png", size: "57x57" },      # Same as apple-touch-icon.png, expect that is already have rounded corners (but neither drop shadow nor gloss effect).
    { icon: "apple-touch-icon.png", size: "57x57" },                  # Same as apple-touch-icon-57x57.png, for "default" requests, as some devices may look for this specific file. This picture may save some 404 errors in your HTTP logs. See Apple docs
    { icon: "favicon-196x196.png" },                                  # For Android Chrome M31+.
    { icon: "favicon-160x160.png" },                                  # For Opera Speed Dial (up to Opera 12; this icon is deprecated starting from Opera 15), although the optimal icon is not square but rather 256x160. If Opera is a major platform for you, you should create this icon yourself.
    { icon: "favicon-96x96.png" },                                    # For Google TV.
    { icon: "favicon-32x32.png" },                                    # For Safari on Mac OS.
    { icon: "favicon-16x16.png" },                                    # The classic favicon, displayed in the tabs.
    { icon: "favicon.png", size: "16x16" },                           # The classic favicon, displayed in the tabs.
    { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },         # Used by IE, and also by some other browsers if we are not careful.
    { icon: "mstile-70x70.png", size: "70x70" },                      # For Windows 8 / IE11.
    { icon: "mstile-144x144.png", size: "144x144" },
    { icon: "mstile-150x150.png", size: "150x150" },
    { icon: "mstile-310x310.png", size: "310x310" },
    { icon: "mstile-310x150.png", size: "310x150" }
  ]
```

## Markup meta links

Specifying meta links is only necessary if you want to support non-iOS devices. Safari mobile will automatically look for the icon files in the root directory. If you'd like to know more about how this works, check out this great blog post: [Everything you always wanted to know about touch icons](http://mathiasbynens.be/notes/touch-icons)

### HTML

``` html
<link rel="apple-touch-icon-precomposed" sizes="180x180" href="apple-touch-icon-180x180-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="152x152" href="apple-touch-icon-152x152-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="apple-touch-icon-144x144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="apple-touch-icon-114x114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="apple-touch-icon-72x72-precomposed.png" />
<link rel="apple-touch-icon-precomposed" href="apple-touch-icon-precomposed.png" />
<link rel="shortcut icon" href="favicon.png" />
<link rel="icon" type="image/ico" href="favicon.ico" />
```

### HAML

``` haml
%link{ rel: "apple-touch-icon", sizes: "180x180", href: "apple-touch-icon-180x180-precomposed.png" }
%link{ rel: "apple-touch-icon", sizes: "152x152", href: "apple-touch-icon-152x152-precomposed.png" }
%link{ rel: "apple-touch-icon", sizes: "144x144", href: "apple-touch-icon-144x144-precomposed.png" }
%link{ rel: "apple-touch-icon", sizes: "114x114", href: "apple-touch-icon-114x114-precomposed.png" }
%link{ rel: "apple-touch-icon", sizes: "72x72", href: "apple-touch-icon-72x72-precomposed.png" }
%link{ rel: "apple-touch-icon", href: "apple-touch-icon-precomposed.png" }
%link{ rel: "shortcut icon", href: "favicon.png" }
%link{ rel: "icon", type: "image/ico", href: "favicon.ico" }
```
## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

&copy; 2011-2014 Andreas Follmann. See LICENSE for details.
