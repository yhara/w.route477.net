require 'cgi'
require 'slim'

set :markdown_engine, :redcarpet
set :markdown,
  no_intra_emphasis: true,
  tables: true,
  fenced_code_blocks: true,
  autolink: true

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :hikidoc, level: 2

helpers do
  def title_of(path)
    return CGI.unescape(File.basename(path, ".html")).encode("utf-8", "euc-jp")
  end

  def link_to_page(title)
    # double escape is needed (eg. "Scheme/SRFI18")
    url = "/w/#{CGI.escape CGI.escape title}.html"
    return [
      "<a href='#{url}'>",
      title,
      "</a>"
    ].join
  end
end
