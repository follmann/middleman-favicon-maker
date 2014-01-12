# middleman-favicon-maker [![Build Status](https://secure.travis-ci.org/follmann/middleman-favicon-maker.png)](http://travis-ci.org/follmann/middleman-favicon-maker)

[FaviconMaker](https://github.com/follmann/favicon_maker) is a gem which generates favicon files in various sizes from a base image. This gem integrates FaviconMaker effortlessly into your [Middleman](https://github.com/middleman/middleman) project.

## Installation

### Dependencies

Before you can use FaviconMaker, you need to install [ImageMagick](http://www.imagemagick.org/script/index.php). On OS&nbsp;X, the easiest way to do this is to run:

``` shell
brew install imagemagick
```

### Using Bundler

``` ruby
gem "middleman-favicon-maker", "~> 3.5"
```

If you're using Middleman version 2.x, use version 0.0.6 of middleman-favicon-maker.

## Integrating with Middleman

Create a favicon_template.png image and place it in your source directory. Ideally, this image's dimensions would be 152 x 152. In config.rb, extend the `configure :build` block:

### Simple config
This config assumes that a PNG file named favicon_template.png lives in the source folder. The generated icons are stored in the build folder root.

``` ruby
configure :build do
  ...
  activate :favicon_maker, :icons => {
    "favicon_template.png" => [
      { icon: "apple-touch-icon-152x152-precomposed.png" },
      { icon: "apple-touch-icon-114x114-precomposed.png" },
      { icon: "apple-touch-icon-72x72-precomposed.png" },
    ]
  }
  ...
end
```

### Advanced config
Using all configuration options. The template_dir/output_dir require absolute paths. You can use multiple template files that suit the different resolutions better. ```format``` and ```size``` are optional and only required when the size of the icon and/or the file format is not encoded in the filename. Multiple resolutions in one file is only supported for the .ico format.

``` ruby
configure :build do
  ...
  activate :favicon_maker do |f|
    f.template_dir  = File.join(root, 'source')
    f.output_dir    = File.join(root, 'build')
    f.icons = {
      "favicon_template_hires.png" => [
        { icon: "apple-touch-icon-152x152-precomposed.png" },
        { icon: "apple-touch-icon-114x114-precomposed.png" },
        { icon: "apple-touch-icon-72x72-precomposed.png" },
        { icon: "mstile-144x144", format: :png },
      ],
      "favicon_template_lores.png" => [
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
  :icons => [
    { icon: "apple-touch-icon-152x152-precomposed.png" },
    { icon: "apple-touch-icon-144x144-precomposed.png" },
    { icon: "apple-touch-icon-120x120-precomposed.png" },
    { icon: "apple-touch-icon-114x114-precomposed.png" },
    { icon: "apple-touch-icon-76x76-precomposed.png" },
    { icon: "apple-touch-icon-72x72-precomposed.png" },
    { icon: "apple-touch-icon-60x60-precomposed.png" },
    { icon: "apple-touch-icon-57x57-precomposed.png" },
    { icon: "apple-touch-icon-precomposed.png", size: "57x57" },
    { icon: "apple-touch-icon.png", size: "57x57" },
    { icon: "favicon-196x196.png" },
    { icon: "favicon-160x160.png" },
    { icon: "favicon-96x96.png" },
    { icon: "favicon-32x32.png" },
    { icon: "favicon-16x16.png" },
    { icon: "favicon.png", size: "16x16" },
    { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
    { icon: "mstile-144x144", format: "png" },
  ]

The template images are deleted from the build folder (Middleman copies them) after all icons have been generated.

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
%link{ rel: "apple-touch-icon", sizes: "152x152", href: "apple-touch-icon-144x144-precomposed.png" }
%link{ rel: "apple-touch-icon", sizes: "144x144", href: "apple-touch-icon-144x144-precomposed.png" }
%link{ rel: "apple-touch-icon", sizes: "114x114", href: "apple-touch-icon-114x114-precomposed.png" }
%link{ rel: "apple-touch-icon", sizes: "72x72", href: "apple-touch-icon-72x72-precomposed.png" }
%link{ rel: "apple-touch-icon", href: "apple-touch-icon-precomposed.png" }
%link{ rel: "shortcut icon", href: "favicon.png" }
%link{ rel: "icon", type: "image/ico", href: "favicon.ico" }
```

## Copyright

&copy; 2011-2014 Andreas Follmann. See LICENSE for details.
