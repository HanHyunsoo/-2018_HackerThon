require 'test_helper'

class WeniqueControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get product" do
    get :product
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get checkout" do
    get :checkout
    assert_response :success
  end

  test "should get categories" do
    get :categories
    assert_response :success
  end

  test "should get cart" do
    get :cart
    assert_response :success
  end

end
