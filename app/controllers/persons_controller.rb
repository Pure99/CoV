class PersonsController < ApplicationController
	def profile
		@tables = current_user.tables.all
	end
end
