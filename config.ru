# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

use Rack::ReverseProxy do
  reverse_proxy(/^\/blog(\/.*)$/,
    'http://still-woodland-5761.herokuapp.com/$1',
    opts = {:preserve_host => true})
end