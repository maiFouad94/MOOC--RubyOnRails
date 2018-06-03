ActiveAdmin.register User do
    index do
      column :id
      column :name
      column :email
      column :DOB
      column :gender
      column :image do |ad|
        image_tag ad.image.thumb.url
      end
      actions
    end

	  show do
		  attributes_table do
        row :name
        row :email
        row :DOB
        row :gender
        row :image do |ad|
          image_tag ad.image.thumb.url
        end
      end  
    end

	  form do |f|
		  f.input :name 
		  f.input :email 
		  f.input :DOB ,:start_year=>1900
		  f.input :gender 
		  f.input :image 
		  f.input :password 
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
#   permitted << :other if params[:action] == 'create' && current_user.try(:admin?)
#   permitted
# end
permit_params :name, :email, :DOB, :gender, :image, :password, :password_confirmation

end
