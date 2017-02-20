class TablesController < ApplicationController
	  before_filter :authenticate_user!, except: [:index, :show]
	def index
		@tables = Table.all
		#@p1 = Var.new
	end

	def show
		@table = Table.find(params[:id])
	end

	def new
		@table = Table.new
		@tables = Table.all
	end

	def create
		#render plain: params[:Table].inspect
		@table = Table.new(Table_params)
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

		if(@table.update(Table_params))
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


	private def Table_params
	params.require(:Table).permit(:title, :body, :date, :pr_1_mpa, :pr_1_p, :pr_28_mpa, :pr_28_p, :pr_pr_mpa, :pr_pr_p, :mark)
end
end
