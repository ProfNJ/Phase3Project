puts "🌱 Seeding spices..."
User.destroy_all
Post.destroy_all
Comment.destroy_all
# Seed your database here
testUser = User.create(name: "UserName123")
testUser2 = User.create(name: "StunDipper214")
puts "✅ Done seeding!"
