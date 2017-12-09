ActiveAdmin.register Post do
permit_params :title, :banner_image, :published_at, :description, :user_id, :published

	index do
		column :title
		column :banner_image
		column :description do | post |
			post.description.html_safe
		end
		column :published_at
		column :published
		column :created_at
		 column "" do |resource|
		  links = ''.html_safe
		  links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
		  links += link_to I18n.t('active_admin.view'), resource_path(resource), :method => :patch, :class => "member_link show_link"
		  links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
		  links
	  end
	end

	show do
    attributes_table do
      row :title
      row :banner_image
		  row :description do | post |
			  post.description.html_safe
		  end
		  row :published_at
		  row :published
		  row :created_at
    end
  end
  
	form(html: { multipart: true }) do |f| 
		f.inputs "Post" do
			f.input :title
			f.input :banner_image
			f.input :description, label: "Description", as: :ckeditor   
			f.input :published_at
			f.input :published 		  
			f.submit
	  end
	end
end
