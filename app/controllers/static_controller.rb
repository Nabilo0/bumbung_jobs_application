class StaticController < ApplicationController
	def index

  # response = Unirest.get "https://yoda.p.mashape.com/yoda?sentence=You+will+learn+how+to+speak+like+me+someday.++Oh+wait.",
  # headers:{
  #   "X-Mashape-Key" => "vxGXmAkKjomshOtw6d3nysdrKzK1p1ntw02jsna6xI8aEt5SfE",
  #   "Accept" => "text/plain"
  # }
  # byebug
  # @test = response.body
	end
	def new_data
	end

def love_calculator
  #{params[:query]}
response = Unirest.get "https://love-calculator.p.mashape.com/getPercentage?fname=#{params[:fname]}&sname=#{params[:sname]}",
  headers:{
    "X-Mashape-Key" => "vxGXmAkKjomshOtw6d3nysdrKzK1p1ntw02jsna6xI8aEt5SfE",
    "Accept" => "application/json"
  }
   # byebug
  @love = response.body["fname"]
  @love2 = response.body["sname"]
  @percentage = response.body["percentage"]
  @result = response.body["result"]



end
 	

  def send_data

 	email_test = valid_email(params[:email])
 	# byebug
 	if email_test != nil
  	 
 	if (params[:name] == nil or params[:message] == nil)
 		redirect_to newdata_path
    flash[:notice] = "SomeTHing Wrong"
 	else
		response = Unirest.post "http://jobs.bumbung.co/jobs/apply",
 		headers:{"Accept" => "application/json"},
		parameters:{ :full_name => "#{params[:name]}",:email => "#{params[:email]}", :message => "#{params[:message]}", :website => "#{params[:website]}", 
  	:github => "#{params[:gitub]}", :twitter => "#{params[:twitter]}", :linkedin => "#{params[:linkedin]}", :testmode => false}
  # byebug
      redirect_to root_path
 		 	flash[:notice] = "EveryThing gose RIGHT" 
 		 
 end

 else
 		 		redirect_to newdata_path
    		flash[:notice] = "SomeTHing Wrong"
   	end
			end

def valid_email(email)
  (email =~ /^(([A-Za-z0-9]*\.+*_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\+)|([A-Za-z0-9]+\+))*[A-Z‌​a-z0-9]+@{1}((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,4}$/i)
end
  
end
# image-gallery-2017.herokuapp.com
# or response.body["job"]["email"] or response.body["job"]["message"]
 # byebug
#   if response.body["job"]["full_name"]  == ""
#   redirect_to root_path
# 	 	flash[:notice] = "EveryThing gose RIGHT" 
# 	 else
# redirect_to new_data root_path
# flash[:notice] = "SomeTHing Wrong"
# 	 end
 # testmode: 	<%= text_field_tag :testmode %></br>
# dev@bumbung.co