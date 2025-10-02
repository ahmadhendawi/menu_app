Restaurant.create!(
  name: "Burger Palace",
  slug: "burger-palace",
  email: "burger.palace@gmail.com",
  password: "burger123",
  password_confirmation: "burger123"

)
Restaurant.create!(
  name: "Pizza World",
  slug: "pizza-world",
  email: "pizza.world@gmail.com",
  password: "pizza123",
  password_confirmation: "pizza123"
)

# gonna add menu items for Burger Palace

MenuItem.create!(
  restaurant: Restaurant.find_by(slug: "burger-palace"),
  name: "Classic Burger",
  description: "A juicy beef patty with lettuce, tomato, and cheese.",
  price: 5.95,
  active: true,
  position: 1
)
MenuItem.create!(
  restaurant: Restaurant.find_by(slug: "burger-palace"),
  name: "Wedgy Fries",
  description: "Crispy wedges served with ketchup.",
  price: 2.65,
  active: true,
  position: 2
)
MenuItem.create!(
  restaurant: Restaurant.find_by(slug: "burger-palace"),
  name: "Swiss Mushroom Burger",
  description: "A cheesy chaos of Swiss cheese and sautéed mushrooms.",
  price: 4.99,
  active: false,
  position: 3
)

# gonna add menu items for Pizza World

MenuItem.create!(
  restaurant: Restaurant.find_by(slug: "pizza-world"),
  name: "Margherita Pizza",
  description: "Classic pizza with fresh tomatoes, mozzarella, and basil.",
  price: 6.00,
  active: true,
  position: 1
)
MenuItem.create!(
  restaurant: Restaurant.find_by(slug: "pizza-world"),
  name: "Garlic Bread",
  description: "A crispy and garlicky baguette",
  price: 3.49,
  active: true,
  position: 2
)
MenuItem.create!(
  restaurant: Restaurant.find_by(slug: "pizza-world"),
  name: "Veggie Pizza",
  description: "Your favorite veggies on a delicious pizza",
  price: 6.49,
  active: false,
  position: 3
)
# adding images to burger palace menu items

burger_palace = Restaurant.find_by(slug: "burger-palace")
classic_burger = burger_palace.menu_items.find_by(name: "Classic Burger")
classic_burger.images.attach(
  io: File.open(Rails.root.join("app/assets/images/classicburger.jpg")),
  filename: "classicburger.jpg",
  content_type: "image/jpeg"
)

burger_palace = Restaurant.find_by(slug: "burger-palace")
wedgy_fries = burger_palace.menu_items.find_by(name: "Wedgy Fries")
wedgy_fries.images.attach(
  io: File.open(Rails.root.join("app/assets/images/wedgy.jpg")),
  filename: "wedgy.jpg",
  content_type: "image/jpeg"
)

burger_palace = Restaurant.find_by(slug: "burger-palace")
swiss_mushroom_burger = burger_palace.menu_items.find_by(name: "Swiss Mushroom Burger")
swiss_mushroom_burger.images.attach(
  io: File.open(Rails.root.join("app/assets/images/swissmush.jpg")),
  filename: "swissmush.jpg",
  content_type: "image/jpeg"
)

# adding images to pizza world menu items

pizza_world = Restaurant.find_by(slug: "pizza-world")
margherita_pizza = pizza_world.menu_items.find_by(name: "Margherita Pizza")
margherita_pizza.images.attach(
  io: File.open(Rails.root.join("app/assets/images/margh.jpg")),
  filename: "margh.jpg",
  content_type: "image/jpeg"
)

pizza_world = Restaurant.find_by(slug: "pizza-world")
garlic_bread = pizza_world.menu_items.find_by(name: "Garlic Bread")
garlic_bread.images.attach(
  io: File.open(Rails.root.join("app/assets/images/garlic.jpg")),
  filename: "garlic.jpg",
  content_type: "image/jpeg"
)

pizza_world = Restaurant.find_by(slug: "pizza-world")
veggie_pizza = pizza_world.menu_items.find_by(name: "Veggie Pizza")
veggie_pizza.images.attach(
  io: File.open(Rails.root.join("app/assets/images/veggie.png")),
  filename: "veggie.png",
  content_type: "image/png"
)
