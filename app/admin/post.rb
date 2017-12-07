ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 # permit_params :list, :of, :attributes, :on, :model
  permit_params :title, :banner_image, :published_at, :description, :user_id, :published
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  
  form(:html => { :multipart => true }) do |f| 
  	f.inputs "Post" do
      f.input :title
      f.input :banner_image
      f.cktext_area :description     
      f.input :published_at
      f.input :published 		  
 		  f.submit
 	  end
  end
 end
