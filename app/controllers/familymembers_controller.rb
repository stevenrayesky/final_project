class FamilymembersController < ApplicationController

	def new
		@member = Familymember.new
	end

	def create
		current_user
		@familymember = Familymember.new(familymember_params)
		@tree = Tree.where(id: params[:tree_id])
		# If this is the first familymember of a tree, it is set as the origin.
		if @tree.familymembers == nil
			@familymember.origin = true
		end
		@familymember.tree_id = @tree.id
		if @familymember.save
			redirect_to (:back)
		end
	end

	def show
		current_user
	end

	def update
		@familymember = Familymember.find(params[:id])
		@familymember.update(familymember_params)
		if @familymember.save
			redirect_to (:back)
		end
	end

	def destroy
		@familymember = Familymember.find(params[:id])
		if @familymember.destroy
			redirect_to (:back)
		end
	end

	private

	def familymember_params
		params.require(:familymember).permit(:first_name, :last_name, :birthday, :death, :birth_loc, :death_loc)
	end
end
