require "middleman-core"

::Middleman::Extensions.register(:favicon_maker) do
  require "middleman-favicon-maker/extension"
  ::Middleman::FaviconMaker
end