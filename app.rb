require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

### Squared
get("/square/new") do

  erb(:square_home)

end

get("/square/results") do
  @number = params.fetch("number").to_i

  @sq_number = (@number ** 2).to_f

  @page = "Square"

  params["Square"] = @sq_number

  erb(:results)
end

### Square root
get("/square_root/new") do

  erb(:square_root_home)

end

get("/square_root/results") do
  @number = params.fetch("number").to_i

  @sqrt_number = (@number ** (1/2)).to_f

  erb(:square_root)
end
