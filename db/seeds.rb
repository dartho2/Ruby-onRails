puts "CREATED: "
Admin.create( :first_name => 'Admin',
              :email => 'admin@admin.com',
              :password => 'admin123',
              :password_confirmation => 'admin123')
puts "1 - Admin <admin@admin.com> <admin123>"
