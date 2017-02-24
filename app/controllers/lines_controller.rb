class LinesController < ApplicationController
	def create
    @table = Table.find(params[:table_id])
    @line = @table.lines.create(line_params)
    redirect_to table_path(@table)
  end
  
  def destroy
    @table = Table.find(params[:table_id])
    @line = @table.lines.find(params[:id])
    @line.destroy
    redirect_to table_path(@table)
  end
  
  private def line_params
    params.require(:line).permit(:date, :pr_1_mpa, :pr_1_p, :pr_28_mpa, :pr_28_p, :pr_pr_mpa, :pr_pr_p, :note, :mark)
  end
end
