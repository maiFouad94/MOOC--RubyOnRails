ActiveAdmin.register Lecture do
	belongs_to :course , :optional => true
	belongs_to :user , :optional => true
	
	show do
	  attributes_table do
	    row :content do |lecture|
	      raw(lecture.content)
	    end
	    row :attachment do |lecture|
		  link_to "view file" , lecture.attachment_url
	    end
	    row :created_at
	    row :updated_at
	    row :user do |lecture|
    	  User.find(lecture.user_id).name
        end
	    row :spam do |lecture|
		  lecture.users.size
	    end
      end  
    end

    index do
      column :id
      column :content do |lecture|
		raw(lecture.content)
	  end
      column :attachment do |lecture|
        link_to "view file" , lecture.attachment_url
      end
      column :created_at
      column :updated_at
      column :course
      column :user do |lecture|
    	User.find(lecture.user_id).name
      end
      column :spam do |lecture|
		lecture.users.size
	  end
      actions
    end

    form do |f|
      f.input :course
      f.input :content , :as => 'ckeditor'
      f.input :attachment
      f.input :user_id
      f.actions
    end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :content, :attachment, :course_id ,:user_id

end
