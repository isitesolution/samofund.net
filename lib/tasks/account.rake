namespace :account do
  task :default_users => :environment do
    # Create Client
    Client.create(:email => "ajec4223@yahoo.com", :password => "password", :password_confirmation => "password", :type => "Client")

    # Create Employee
    Employee.create(:email => "edwin_leo9@yahoo.com", :password => "password", :password_confirmation => "password", :type => "Client")
    Employee.create(:email => "ajcubeta@gmail.com", :password => "password", :password_confirmation => "password", :type => "Client")

    # Create Admin
    Admin.create(:email => "iesamonte@gmail.com", :password => "password", :password_confirmation => "password", :type => "Admin")
    Admin.create(:email => "andre@isitesolution.com", :password => "password", :password_confirmation => "password", :type => "Admin")
  end
end