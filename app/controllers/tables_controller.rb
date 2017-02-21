class TablesController < ApplicationController
	  before_filter :authenticate_user!, except: [:index, :show]
	def index
		@tables = Table.all
	end

	def show
		@table = Table.find(params[:id])
	end

	def new
		@table = Table.new
		@tables = Table.all
	end

	def create
		@user = User.find(params[:user_id])
		@table = @user.tables.create(table_params)
		if@table.save
			redirect_to @table
		else
			render 'new'
		end
	end

	def edit
		@table = Table.find(params[:id])
		
	end	

	def update 
		@table = Table.find(params[:id])

		if(@table.update(table_params))
			redirect_to @table
		else
			render 'edit'
		end
	end	

	def destroy 
		@table = Table.find(params[:id])
		@table.destroy

		redirect_to home_path
	end


	private def table_params
	params.require(:table).permit(:user, :title, :body)
end
end
