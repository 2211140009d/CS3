class TopController < ApplicationController
    def main
        if session[:login_uid]
            render "main"
        else
            render "login"
        end
    end
    
    def login
        user = User.find_by(uid: params[:uid])
            #if User.find_by(uid: params[:uid]) and User.find_by(pass: params[:pass]) 
        if user and BCrypt::Password.new(user.pass) == params[:pass]
            session[:login_uid] = params[:uid]
            redirect_to top_main_path
        else
             render "error",status: 422
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end


