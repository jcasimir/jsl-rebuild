require 'rubygems'
require 'sinatra'

get "/" do
  erb :index
end

get "/team" do
  erb :team
end

get "/news" do
  erb :news
end

get "/post" do
  erb :post
end

get "/courses" do
  erb :courses
end

get "/contact" do
  erb :contact
end