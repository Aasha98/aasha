require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { address: @user.address, age: @user.age, blood: @user.blood, city: @user.city, contact: @user.contact, country: @user.country, doj: @user.doj, econtact: @user.econtact, email: @user.email, ename: @user.ename, fname: @user.fname, lname: @user.lname, password: 'secret', password_confirmation: 'secret', pincode: @user.pincode, pskill: @user.pskill, sal: @user.sal, salpm: @user.salpm, sskill1: @user.sskill1, sskill2: @user.sskill2, state: @user.state } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address: @user.address, age: @user.age, blood: @user.blood, city: @user.city, contact: @user.contact, country: @user.country, doj: @user.doj, econtact: @user.econtact, email: @user.email, ename: @user.ename, fname: @user.fname, lname: @user.lname, password: 'secret', password_confirmation: 'secret', pincode: @user.pincode, pskill: @user.pskill, sal: @user.sal, salpm: @user.salpm, sskill1: @user.sskill1, sskill2: @user.sskill2, state: @user.state } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
