require 'application'

set :run, false
set :environment, :development

run Sinatra::Application
