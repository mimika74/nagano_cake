class Admin::SessionsController < ApplicationController

  #def new
  #end

  #def create
    #@admin1 = Admin.find(params[:email], params[:encrypted_password])
   # redirect_to "/admin"
 # end

  #def destroy
  #  logout
  #  redirect_to "/admin/sign_in"
  #end#

protected
 def after_sign_in_path_for(resource)
   admin_admin_sign_in_path
 end


end
