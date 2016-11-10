# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all

10.times do
  Product.create(title: 'Programming Ruby', description:
                  %{<p>
                    Ruby is the fastest growing and most exciting dynamic language
  out there. If you need to get working programs delivered fast,
  you should add Ruby to your toolbox.
                    </p>},
                image_url: 'ruby.jpg', price: 99.99)

  Product.create(title: 'Programming Java', description:
                  %{<p>
                    Java is the fastest growing and most exciting dynamic language
  out there. If you need to get working programs delivered fast,
  you should add Java to your toolbox.
                    </p>},
                image_url: 'java.jpg', price: 99.99)
end
