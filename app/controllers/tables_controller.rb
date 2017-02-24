class TablesController < ApplicationController
	  before_filter :authenticate_user!, except: [:index]
	def index
		@tables = current_user.tables.all
	end

	def show
		@table = current_user.tables.find(params[:id])
	end

	def new
		@table = Table.new
		@tables = Table.all
	end

	def create
		@table = current_user.tables.create(table_params)
		
		if@table.save
			redirect_to @table
		else
			render 'new'
		end
	end

	def edit
		@table = current_user.tables.find(params[:id])
		
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

		redirect_to root_url
	end


	private def table_params
	params.require(:table).permit(:user, :title, :body)
end
end
