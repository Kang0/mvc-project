class DatabaseVinylController < ApplicationController

  get '/database/new' do
    if logged_in?
      erb :'/DatabaseVinyl/new'
    else
      redirect '/login'
    end
  end

  post '/database/new' do
    if params[:artist].empty? | params[:album_name].empty? | params[:year_released].empty?
      redirect '/database/new'
    else
      @dbvinyl = DatabaseVinyl.create(:artist => params[:artist], :album_name => params[:album_name], :record_label => params[:record_label], :year_released => params[:year_released], :genre => params[:genre], :user_id => session[:user_id])

      redirect "/database/vinyls"

      # @user = User.find_by(id: session[:user_id])
      # binding.pry
      # @user_vinyls = UserVinyl.new
      # @vinyl.user_vinyls << @user_vinyls
      # @user.user_vinyls << @user_vinyls
      # redirect "/users/#{@user.slug}"
    end
  end

  get '/database/vinyls' do
    @dbvinyls = DatabaseVinyl.all
    erb :'/DatabaseVinyl/show_database'
  end

end