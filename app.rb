require 'sinatra'
require 'slim'
require 'sqlite3'
require 'bcrypt'

get("/") do
    slim(:start)
end

get("/albums") do
    db = SQLite3::Database.new("db/chinook-crud.db")
    db.results_as_harsh = true
    result = db.execute("SELECT * FROM albums")
    p result
    slim(:"albums/index",locals:{albums:result})
end

get("/albums/new") do
    slim(:"albums/new")

end

end

get("/albums/:id") do
    id = params[:id].to_i
    db = SQLite3::Database.new("db/chinook-crud.db")
    db.results_as_harsh = true
    result = db.execute("SELECT * FROM albums WHERE AlbumId = ?",id).first
    ...
    slim(:"albums/show", locals:{result:result})
end






get("/") do
    slim(:register)
end

post("/users/new") do
    username = params[:username]
    password = params[:password]
    password_confirm = params[:password_confirm]

    if (password == password_confirm)
        #Lägg till användare
        password_digest = Bcrypt::Password.create(password)
        db = SQlite3::Database.new('db/')...
    
    
    
    else
        #Felhantering
        "Lösenorden matchade inte"
    


end
