require 'sinatra'
require 'slim'
require 'sqlite3'
require 'bcrypt'


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
