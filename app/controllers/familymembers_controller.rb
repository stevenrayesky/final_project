class FamilymembersController < ApplicationController

	def new
		@member = Familymember.new
	end

	def create
		current_user
		@parent = Familymember.find(familymember_params[:parent_id])
		@familymember = Familymember.new(familymember_params.except!(:parent_id))
		@tree = Tree.where(id: params[:tree_id]).first
		# If this is the first familymember of a tree, it is set as the origin.
		if @tree.familymembers? == false
			@familymember.origin = true
		end
		
		@familymember.tree_id = @tree.id
		if @familymember.save
			if @parent.id
				@new_child_relationship = ChildRelationship.new
				@new_child_relationship.child_id = @familymember.id
				@new_child_relationship.parent_id = @parent.id
				@new_child_relationship.save
			end	
		end
		# @top = @tree.find_origin
		# if @tree.familymembers?
		# 	gon.watch.familymembers = {children: @top.fill_array, first_name: @top.first_name, id: @tree.id}
		# end
		redirect_to (:back)
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

	def edit
		@member = Familymember.find(params[:id])
		@tree = Tree.find(params[:tree_id])
		respond_to do |format|
			format.js
		end
	end

	def new_child
		@parent = Familymember.find(params[:id])
		@child = Familymember.new
		@tree = Tree.find(params[:tree_id])
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@tree = Tree.find(params[:tree_id])	
		@familymember = Familymember.find(params[:id])
		if @familymember.destroy
			@top = @tree.find_origin
			# if @tree.familymembers?
			# 	gon.familymembers = {children: @top.fill_array, first_name: @top.first_name, id: @tree.id}
			# end
			respond_to do |format|
				format.js
			end
			
		end
	end

	def gon
		# @tree = Tree.find(params[:tree_id])	
		# @familymember = Familymember.find(params[:id])
		# @top = @tree.find_origin
		# gon.watch.familymembers = {children: @top.fill_array, first_name: @top.first_name, id: @tree.id}
		# binding.pry
	end

	private

	def familymember_params
		params.require(:familymember).permit(:first_name, :last_name, :birthday, :death, :birth_loc, :death_loc, :parent_id)
	end
end
