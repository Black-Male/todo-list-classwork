class UsersController < ApplicationController

    before_action :session_expired?, only: [:check_login_status]

    # add new user
    def register
        user = User.create(user_params)
        if user.valid?
            save_user(user.id)
            app_response(message: "Registration Was Successful", status: :created, data: user)
        else
            app_response(message: "Something went wrong during registration :(", status: :unprocessable_entity, data: user.errors)
        end
    end

    # login a user
    def login
        sql = "username = :username OR email = :email"
        user = User.where(sql, {username: user_params[:username], email: user_params[:email] }).first
        if user&.authenticate(user_params[:password_digest])
            save_user(user.id)
            app_response(message: 'login was successful', status: :ok, data: user)
        else
            app_response(message: 'Invalid username/email or password', status: :unauthorized)
        end
    end

    def logout
        remove_user
        app_response(message: "Logout Successful", status: :ok)
    end

    # makes 
    def check_login_status
        app_response(message: 'success', status: :ok)
    end

    private

    def user_params
        params.permit(:username, :email, :password_digest)
    end
end
