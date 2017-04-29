
class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  # set :views, 'app/views'
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    redirect to ('/landmarks')
  end


end
