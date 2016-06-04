###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Set markdown template engine
set :markdown_engine, :kramdown
set :markdown, :fenced_code_blocks => true, :smartypants => true

# put configuration variables into .env file
activate :dotenv

# use asset host
activate :asset_host, host: "//#{ENV['CDN_HOST']}"

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
end
