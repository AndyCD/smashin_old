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

roles = [:student, :guardian, :teacher, :admin]

role_ids = []
roles.each do |id, role|
  role_ids << id
end

roles_count = role_ids.length
p "#{roles_count} roles"

number_of_users = 200
users = []

number_of_users.times do |i|
  if i % 13 == 0
    new_user = {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'topsecret',
      password_confirmation: 'topsecret',
      confirmed_at: DateTime.now,
      confirmation_sent_at: DateTime.now,
      role: role_ids[Random.rand(0...roles_count)],
      deleted_at: DateTime.now
    }
  else
    new_user = {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'topsecret',
      password_confirmation: 'topsecret',
      confirmed_at: DateTime.now,
      confirmation_sent_at: DateTime.now,
      role: role_ids[Random.rand(0...roles_count)]
    }
  end
  users << new_user
end

User.create(users)

p "#{number_of_users} new users created"
