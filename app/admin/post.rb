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
		actions
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
