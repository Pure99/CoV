class PersonsController < ApplicationController
	def profile
		@tables = Table.all
	end
end
