require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'list'
)

  require './models/todo'


  get '/' do
    erb :index
  end


  get '/api/todos' do
    content_type :json
    todos = Todo.all
    todos.to_json
  end

  get '/api/todos/:id' do
    content_type :json
    todo = Todo.find(params[:id].to_i)
    todo.to_json
  end

  post '/api/todos' do
    content_type :json
    todo = Todo.create(params[:todo])
    todo.to_json
  end

  put '/api/todos/:id' do
    content_type :json
    todo = Todo.find(params[:id].to_i).update(params[:todo])
    todo.to_json
  end

  patch '/api/todos/:id' do
    content_type :json
    todo = Todo.find(params[:id].to_i).update(params[:todo])
    todo.to_json
  end

  delete '/api/todos/:id' do
    content_type :json
    id = params[:id].to_i
    todo = Todo.destroy(id)
  end


  # CREATE TABLE todos (id SERIAL PRIMARY KEY, task TEXT, complete BOOLEAN, due_date TIMESTAMP);
