require 'sinatra'
require 'sinatra/namespace' # namespace

module MyAppModule
  class App < Sinatra::Base
    register Sinatra::Namespace

    get '/' do # корнневой обычный url
    'Hello My Sinatra - Easy and Wide world!'
    end

    # Перенаправление
    get '/redirect' do
    redirect to('/hello/World')
    end

    # Именованные параметры как переменные блока
    get '/hello-block/:name' do |n|
    "Hello, #{n}!"
    end

    # Регулярные выражения в шаблонах
    get %r{/meta/hello/([\w]+)} do |c|
    "Hello, #{c}!"
    end

    # Использование splat с параметрами блока
    get '/download/*.*' do |path, ext|
    [path, ext].to_s # => ["path/to/file", "xml"]
    end

    # Необязательные параметры
    get '/jobs.?:format?' do
    'Да, работает этот маршрут!'
    end

    namespace '/api/v1' do
      get '/hello/:name' do #маршрут с именованным параметром :name
        "Sinatra приветствует тебя, #{params[:name]}!"
      end

      get '/*' do # маршрут с маской * - все остальное
        "I don't know what is the #{params[:splat]}. It's what you typed."
      end
    end
  end
end
