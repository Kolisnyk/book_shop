require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  # test "the truth" do
  #   assert true
  # end
  test "product  attributesmust not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "prodect price must be positive" do
    product = Product.new(title: "C++", description: "one more",
                          image_url: "one.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
    product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
    product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new( title: "C++", description: "one more", price: 1,
                 image_url: image_url )
  end

  test "image_url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(title: products(:personal).title, description: "hi",
    price: 1, image_url: "hello.gif")

    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end
end