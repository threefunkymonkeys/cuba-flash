require 'minitest/autorun'
require 'rack/test'
require 'cuba'
require_relative '../lib/cuba/flash'

class MiniTest::Spec
  include Rack::Test::Methods

  def app
    Cuba.app
  end
end

Cuba.use Rack::Session::Cookie, :secret => "test"
Cuba.use Cuba::Flash

describe "Cuba Flash" do
  it "should show flash message" do
    Cuba.define do
      on get, root do
        flash[:info] = "Success"
        res.write flash[:info]
      end
    end

    get "/"

    assert_equal "Success", last_response.body
  end
  
  it "should not show same message twice" do
    Cuba.define do
      on get, root do
        flash[:info] = "Success"
        flash[:info]
        res.write flash[:info]
      end
    end

    get "/"

    assert_equal "", last_response.body
  end
end
