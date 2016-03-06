class FamilymembersController < ApplicationController
	respond_to :js, :json
	
	def new
		@member = Familymember.new
	end

	def create
		current_user
		@familymember = Familymember.new(familymember_params)
		@tree = Tree.find(params[:tree_id])
		if @tree.familymembers? == false
			@familymember.origin = true
		end
		@familymember.tree_id = @tree.id
		if @familymember.save
			redirect_to(:back)
		end
	end

	def create_child
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
			@familymember.make_siblings(@parent)
		end
		@top = @tree.find_origin
		@tree = Tree.find(params[:tree_id])	
		@chart = {children: @top.fill_array, first_name: @top.first_name, id: @top.id, tree_id: @tree.id}.to_json
		respond_to do |format|
			format.js
		end
	end

	def create_parent
		current_user
		@child = Familymember.find(familymember_params[:child_id])
		@familymember = Familymember.new(familymember_params.except!(:child_id))
		@tree = Tree.where(id: params[:tree_id]).first
		
		@familymember.tree_id = @tree.id
		if @familymember.save
			if @child.id
				@new_parent_relationship = ChildRelationship.new
				@new_parent_relationship.parent_id = @familymember.id

				@new_parent_relationship.child_id = @child.id
				@new_parent_relationship.save
			end
			# Changes the origin to the parent if the child was the current origin.
			if @child.origin == true
				@child.origin = false
				@child.save
				@familymember.origin = true
				@familymember.save
			end
		end
		redirect_to (:back)
	end

	def create_partner
		current_user
		@partner = Familymember.find(familymember_params[:partner_id])
		@familymember = Familymember.new(familymember_params.except!(:kind, :partner_id))
		@tree = Tree.where(id: params[:tree_id]).first
		# If this is the first familymember of a tree, it is set as the origin.
		if @tree.familymembers? == false
			@familymember.origin = true
		end
		
		@familymember.tree_id = @tree.id
		if @familymember.save
			if @partner.id
				@new_partner_relationship = PartnerRelationship.new
				@new_partner_relationship.second_partner_id = @familymember.id
				@new_partner_relationship.first_partner_id = @partner.id
				@new_partner_relationship.save
			end	
		end
		redirect_to (:back)
	end


	def show
		current_user
		@familymember = Familymember.find(params[:id])
		@tree = Tree.find(params[:tree_id])
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

	def new_parent
		@child = Familymember.find(params[:id])
		@parent = Familymember.new
		@tree = Tree.find(params[:tree_id])
		respond_to do |format|
			format.js
		end
	end

	def new_partner
		@new_partner_relationship = PartnerRelationship.new
		@partner = Familymember.find(params[:id])
		@new_partner = Familymember.new
		@tree = Tree.find(params[:tree_id])
		respond_to do |format|
			format.js
		end
	end

	def destroy
		current_user
		@tree = Tree.find(params[:tree_id])	
		@familymember = Familymember.find(params[:id])
		if @familymember.destroy
			@top = @tree.find_origin
			if @tree.familymembers?
				@chart = {children: @top.fill_array, first_name: @top.first_name, id: @top.id, tree_id: @tree.id}
			end
			respond_to do |format|
				format.js
				format.json { render json: @chart }
			end
			
		end
	end

	def json_return
		current_user
		@tree = Tree.find(params[:tree_id])	
		@top = @tree.find_origin
		if @tree.familymembers?
			@chart = {children: @top.fill_array, first_name: @top.first_name, id: @top.id, tree_id: @tree.id}
		end
		respond_to do |format|
			format.json { render json: @chart.to_json }
		end


	end

	private

	def familymember_params
		params.require(:familymember).permit(:first_name, :last_name, :birthday, :death, :birth_loc, :death_loc, :parent_id, :child_id, :partner_id, :kind, :gender)
	end
end
