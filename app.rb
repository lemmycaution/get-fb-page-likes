require 'sinatra'
require 'koala'

FIELDS = {fields: 'likes'}.freeze

configure do
  set :graph, Koala::Facebook::API.new(
    Koala::Facebook::OAuth.new(ENV['APP_ID'], ENV['APP_SECRET']).get_app_access_token
  ) 
end

get '/:id' do
  content_type :json 
  settings.graph.get_object(params[:id], FIELDS).to_json
end