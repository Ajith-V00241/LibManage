require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save with missing data" do
    u = User.new(email: "ajith@example.com", password: "123456", password_confirmation: "123456" , date_of_membership: "2020-01-01 13:38:09", totalcheckout: 0, phone: "9566371149", address: "319, Madhakottai Road, Thanjavur")
    assert_not u.save, "saved without name"
    u = User.new(email: "ajith@example.com", password: "123456", password_confirmation: "123456" , date_of_membership: "2020-01-01 13:38:09", totalcheckout: 0, name: "name", address: "319, Madhakottai Road, Thanjavur")
    assert_not u.save, "saved without phone"
    u = User.new(email: "ajith@example.com", password: "123456", password_confirmation: "123456" , date_of_membership: "2020-01-01 13:38:09", totalcheckout: 0, phone: "9566371149", name: "name")
    assert_not u.save, "saved without address"
    u = User.new(name:"name", password: "123456", password_confirmation: "123456" , date_of_membership: "2020-01-01 13:38:09", totalcheckout: 0, phone: "9566371149", name: "name")
    assert_not u.save, "saved without email"
  end

  test "should not save with mismatch passwords" do
    u = User.new(email: "ajith@example.com", password: "123457", password_confirmation: "123456" , date_of_membership: "2020-01-01 13:38:09", totalcheckout: 0, phone: "9566371149", name: "name")
    assert_not u.save, "password mismatch"
  end

  test "should not save with same phone number" do
    u1 = User.new(email: "ajith@example.com", password: "123457", password_confirmation: "123456" , date_of_membership: "2020-01-01 13:38:09", totalcheckout: 0, phone: "9566371149", name: "name")
    u1.save
    u2 = User.new(email: "ajithmani@example.com", password: "123457", password_confirmation: "123456" , date_of_membership: "2020-01-01 13:38:09", totalcheckout: 0, phone: "9566371149", name: "name")
    assert_not u2.save, "phone number is not unique"
  end

 
  
end
