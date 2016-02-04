require 'test_helper'

class LinehaulsControllerTest < ActionController::TestCase
  setup do
    @linehaul = linehauls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:linehauls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create linehaul" do
    assert_difference('Linehaul.count') do
      post :create, linehaul: { route: @linehaul.route }
    end

    assert_redirected_to linehaul_path(assigns(:linehaul))
  end

  test "should show linehaul" do
    get :show, id: @linehaul
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @linehaul
    assert_response :success
  end

  test "should update linehaul" do
    patch :update, id: @linehaul, linehaul: { route: @linehaul.route }
    assert_redirected_to linehaul_path(assigns(:linehaul))
  end

  test "should destroy linehaul" do
    assert_difference('Linehaul.count', -1) do
      delete :destroy, id: @linehaul
    end

    assert_redirected_to linehauls_path
  end
end
