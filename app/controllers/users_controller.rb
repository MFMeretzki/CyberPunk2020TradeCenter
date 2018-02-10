class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
	
  def index
		@users = User.order(:nick)
  end
	
  def show
  end
	
  def new
    @user = User.new
  end
	
  def edit
  end
	
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'User' + @user.nick + 'was successfully created.' }
        format.json { render @user, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
	
  def update
		@user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url, notice: 'User #{@user.name} was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
	
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
	
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:nick, :password, :password_confirmation, :user_type)
    end
		
		def access_level
			3
		end
	
end
