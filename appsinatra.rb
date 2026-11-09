require 'sinatra'
require 'sinatra/namespace' # namespace

get '/' do # корнневой обычный url
  'Hello My Sinatra - Easy and Wide world!'
end

get '/hello/:name' do #маршрут с именованным параметром :name
  "Sinatra приветствует тебя, #{params[:name]}!"
end

get '/*' do # маршрут с маской * - все остальное
  "I don't know what is the #{params[:splat]}. It's what you typed."
end