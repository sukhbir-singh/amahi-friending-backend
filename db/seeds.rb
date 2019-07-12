# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AmahiUser.new(email:"abc@gmail.com").save
AmahiUser.new(email:"bcd@gmail.com").save
AmahiUser.new(email:"cde@gmail.com").save
System.new(amahi_user_id:1, api_key: "abcdef").save

# status: active (0), expired (1), accepted (2), rejected (3)
FriendRequest.new(amahi_user_id: 1, pin: "1234", invite_token: SecureRandom.urlsafe_base64.to_s, system_id: 1, status: 2, last_requested_at: Time.now()).save
FriendUser.new(amahi_user_id: 1, system_id: 1).save
