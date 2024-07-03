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
  @number = params.fetch("number").to_f

  @sq_number = (@number ** 2).to_f

  @page = "Square"

  @results = {"Number"=>@number, "Square"=>@sq_number}

  erb(:results)
end

### Square root
get("/square_root/new") do

  erb(:square_root_home)

end

get("/square_root/results") do
  @number = params.fetch("number").to_f

  @sqrt_number = (@number ** (0.5)).to_f

  @page = "Square Root"

  @results = {"Number"=>@number, "Square Root"=>@sqrt_number}

  erb(:results)
end

### Payment
get("/payment/new") do

  erb(:payment_home)

end

get("/payment/results") do

  @apr = params.fetch("apr").to_f
  @month_rate = @apr / 100 / 12

  @num_years = params.fetch("num_years").to_f
  @num_months = @num_years * 12

  @principal = params.fetch("principal").to_f

  @numerator = (@month_rate * @principal)
  @denominator = (1 - (1 + @month_rate)**(-1*@num_months))


  @results = {"APR"=>@apr.to_fs(:percentage, {:precision=>4}), "Number of years"=>@num_years, "Principal"=>@principal.to_fs(:currency)}
  @results["Payment"] =  (@numerator / @denominator).to_f.to_fs(:currency)

  @page = "Payment"

  erb(:results)

end

### Random
get("/random/new") do

  erb(:random_home)

end

get("/random/results") do
  @min = params.fetch("minimum").to_f

  @max = params.fetch("maximum").to_f

  @rand_number = rand(@min..@max)

  @results = {"Minimum"=>@min, "Maximum"=>@max, "Random Number"=>@rand_number}

  @page = "Random"

  erb(:results)
end
