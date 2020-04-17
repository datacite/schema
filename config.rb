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

# Load data
activate :data_source do |c|
  c.root = "#{ENV['CDN_URL']}/data"
  c.files = [
    "authors.json",
    "links.json",
    "schemas.json"
  ]
end

# Set markdown template engine
set :markdown_engine, :pandoc
set :markdown, smartypants: true,
               csl: "styles/apa.csl",
               bibliography: "bibliography/references.bib"

# put configuration variables into .env file
activate :dotenv

# use asset host
activate :asset_host, host: "#{ENV['CDN_URL']}"

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def stage?
    ENV['RACK_ENV'] == "stage"
  end
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
end
