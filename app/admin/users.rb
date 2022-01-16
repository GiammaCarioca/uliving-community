ActiveAdmin.register User do
  permit_params :real_name, :username, :email, :password_confirmation, :photo, :studio_number, :phone_number, :is_admin, :birthday_date, :description

  form do |f|
    f.inputs "User info" do
      f.input :real_name
      f.input :studio_number
      f.input :phone_number
      f.input :birthday_date
      f.input :description
    end

    f.inputs "Account info" do
      f.input :username
      f.input :email
      f.input :password_confirmation
      f.input :is_admin
    end

    f.actions
  end

  controller do
    resources_configuration[:self][:finder] = :find_by_username
  end
end
