# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.all.each do |user|
  user.destroy
end

ActiveRecord::Base.connection.reset_pk_sequence!('users')

User.create! :name => 'Andreea', :email => 'andreea.c.damian@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :confirmation_token => 'KRvf5RyyyPVJWPdZGpWo', :confirmed_at => DateTime.now, :confirmation_sent_at => DateTime.now, :role => :admin
User.create! :name => 'Liviu',   :email => 'liviu.damian@rogers.com',    :password => 'topsecret', :password_confirmation => 'topsecret', :confirmation_token => 'KRvf5RyyyPVJWPdZGpWo', :confirmed_at => DateTime.now, :confirmation_sent_at => DateTime.now, :role => :admin
User.create! :name => 'Levi',    :email => 'levi.l.damian@gmail.com',    :password => 'topsecret', :password_confirmation => 'topsecret', :confirmation_token => 'KRvf5RyyyPVJWPdZGpWo', :confirmed_at => DateTime.now, :confirmation_sent_at => DateTime.now, :role => :admin
User.create! :name => 'L.D.',    :email => 'l_damian@gmail.com',         :password => 'topsecret', :password_confirmation => 'topsecret', :confirmation_token => 'KRvf5RyyyPVJWPdZGpWo', :confirmed_at => DateTime.now, :confirmation_sent_at => DateTime.now, :role => :admin
