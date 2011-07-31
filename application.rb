require 'rubygems'
require 'sinatra'
require 'haml'
require 'RMagick'

configure do
  set :views, File.join(File.dirname(__FILE__), 'views')
end

# root page
get '/' do
  @title = "Black & White"

  haml :index
end

post '/converted' do
  unless params[:file] && (tmpfile = params[:file][:tempfile])
    redirect '/'
  end

  # Change the content-type to display image on output
  headers['Content-Type'] = 'image/png'
  image = Magick::Image.read(tmpfile.path)[0]
  image = image.quantize(256, Magick::GRAYColorspace)
  image.format = 'png'
  image.to_blob
end
