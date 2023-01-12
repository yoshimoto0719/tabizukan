# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
#   email: 'ysmt.0719@gmail.com',
#   password: 'Yuta0719'
#   )

admins = [
  {email: 'ysmt.0719@gmail.com', password: 'Yuta0719' },
]

admins.each do |admin|
  admin_data = Admin.find_by(email: admin[:email])
  if admin_data.nil?
    Admin.create(email: admin[:email], password: admin[:password])
  end
end

# Tag.create([
#     { name: '国内' },
#     { name: '海外' },
#     ])

tags = %w[国内 海外]
tags.each do |tag|
  Tag.find_or_create_by(name: tag)
end