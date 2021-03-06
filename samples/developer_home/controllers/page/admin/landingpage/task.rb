require "sqlite3"
require "pp"
class AdminTaskScreen < Sinatra::Base
    configure do
        enable :sessions
        set :root, File.dirname(__FILE__)
        set :views, Proc.new { File.join(root, "../../../../templates/admin/landingpage/task") }
    end

    get '/admin/landingPage/task/all' do
        unless session[:username]
            halt "Access denied, please <a href='/login'>login</a>."
        end
        @session = session

        db_file = "db/landingpage.db"
        db = SQLite3::Database.new db_file

        @items=[]
        db.execute( "select id,icon,title,text,url,status from task" ) do |row|
            @items << { "id" => row[0],"icon" => row[1], "title" => row[2], "text" => row[3], "url" => row[4], "status" => row[5] }
        end
        erb :all
    end

    get '/admin/landingPage/task/new' do
        unless session[:username]
            halt "Access denied, please <a href='/login'>login</a>."
        end
        erb :new
    end

    get '/admin/landingPage/task/edit/:id' do
        unless session[:username]
            halt "Access denied, please <a href='/login'>login</a>."
        end

        id = params["id"]

        db_file = "db/landingpage.db"
        db = SQLite3::Database.new db_file

        db.execute( "select id,icon,title,text,url,status from task where id = '#{id}'" ) do |row|
            @item = { "id" => row[0],"icon" => row[1], "title" => row[2], "text" => row[3], "url" => row[4], "status" => row[5] }
        end

        erb :text
    end

    post '/admin/landingPage/task/edit/:id' do

        if session[:role] != "admin"
            return {"error" => true,"message" => "not admin"}.to_json
        end

        db_file = "db/landingpage.db"
        db = SQLite3::Database.new db_file

        id = params["id"]
        title = params["title"]
        text = params["text"]
        icon = params["icon"]
        url = params["url"]
        status = params["status"]

        sql ="update task set `title`='#{title}',`text`='#{text}',`icon`='#{icon}',`url`='#{url}',`status`='#{status}' where id = '#{id}'"
        db.execute( sql )
        redirect '/admin/landingPage/task/all'
    end

    post '/admin/landingPage/task/new' do

        # id = params["id"]
        if session[:role] != "admin"
            return {"error" => true,"message" => "not admin"}.to_json
        end
        
        title = params["title"]
        text = params["text"]
        image = params["image"]

        db.execute( "update banner set `title`='#{title}',`text`='#{text}',`img`='#{image}'" )
        "ok"
    end
end