require 'bundler/setup'

# https://github.com/middleman/middleman/pull/560
require "rubygems"
require "middleman-core/load_paths"

Middleman.setup_load_paths

require "middleman-core"
require "middleman-core/preview_server"

module Middleman::PreviewServer
  def self.preview_in_rack
    @options = { latency: 0.25  }
    @app = new_app
    start_file_watcher
  end
end

Middleman::PreviewServer.preview_in_rack

app = Middleman::PreviewServer.app.class.to_rack_app
wrapper = proc{|env|
  if env["PATH_INFO"] =~ %r{/w/(.*)}
    [301, {"Location" => "http://#{env['SERVER_NAME']}/#{$1}"}, []]
  else
    app.call(env)
  end
}

run wrapper

