class FamilymembersController < ApplicationController

	def new
		@member = Familymember.new
	end

	def create
		current_user
		@familymember = Familymember.new(member_params)
		@familymember.tree_id = params[:tree_id]
		if @familymember.save
			redirect_to (:back)
		end
	end

	def show
		current_user
	end



	private

	def member_params
		params.require(:familymember).permit(:first_name, :last_name, :birthday, :death, :birth_loc, :death_loc)
		
	end
end
