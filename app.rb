require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  if Count.count == 0
    Count.create(number: 0)
  end
end

get '/' do
  @number= Count.first.number
  erb :index
end
post '/plus' do
  count = Count.first
  count.number += 1
  count.save
  redirect'/'
end

post '/minus' do
  count = Count.first
  count.number -= 1
  count.save
  redirect'/'
end

post '/clear' do
  count = Count.first
  count.number = 0
  count.save
  redirect'/'
end

post '/x2' do
  count = Count.first
  count.number *= 2;
  count.save
  redirect'/'
end

post '/÷2' do
  count = Count.first
  count.number /= 2;
  count.save
  redirect'/'
end

# post '/plus2' do
#   count = Count.first
#   count.number2 += 1
#   count.save
#   redirect'/'
# end