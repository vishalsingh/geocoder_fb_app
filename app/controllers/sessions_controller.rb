class SessionsController < ApplicationController

		def new
          redirect_to '/auth/facebook'
		end

		def create
			  auth = request.env['omniauth.auth']
 			   user = User.where(:provider => auth['provider'], :uid => auth['uid']).first || User.create_with_omniauth(auth)
			   #render :text=>'<pre>' + auth.to_yaml and return
               session[:user_id] = user.id
               

               redirect_to locations_path, :notice=>"You are login successfully"


			 # @authorization = User.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  #redirect_to root_url, :notice => "Signed in!"
			 #  if @authorization
			 #    render :text => "Welcome back #{@authorization.user.name}! You have already signed up."
		  # else
			 #    user = User.new :name => auth_hash["user_info"]["name"], :email => auth_hash["user_info"]["email"]
    #             
			 #    user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
			 #    user.save
			 
			 #    render :text => "Hi #{user.name}! You've signed up."
			 #  end
        end


	   def destroy
	     session[:user_id] = nil
	     redirect_to root_url
	   end

end
