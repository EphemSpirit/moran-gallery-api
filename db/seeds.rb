User.destroy_all
Product.destroy_all
User.create!(email: "admin@website.com", role: 0, password: "password", password_confirmation: "password")
User.create!(email: "customer@website.com", role: 1, password: "password", password_confirmation: "password")

4.times do |i|
    Product.create(category: "Jewelry", price: 10.99, description: "Test Jewelry #{i}")
end

4.times do |i|
    Product.create(category: "Embroidery", price: 20.95, description: "Test Embroidery #{i}")
end

4.times do |i|
    Product.create(category: "Portraiture", price: 55.99, description: "Test Portrait #{i}")
end

