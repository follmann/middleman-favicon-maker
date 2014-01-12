require "middleman-core"
require "middleman-favicon-maker/version"

::Middleman::Extensions.register(:favicon_maker) do
  require "middleman-favicon-maker/extension"
  ::Middleman::FaviconMaker::FaviconMakerExtension
end

