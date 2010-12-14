require 'test_helper'

class PackageHistoriesControllerTest < ActionController::TestCase
  setup do
    @package_history = package_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:package_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create package_history" do
    assert_difference('PackageHistory.count') do
      post :create, :package_history => @package_history.attributes
    end

    assert_redirected_to package_history_path(assigns(:package_history))
  end

  test "should show package_history" do
    get :show, :id => @package_history.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @package_history.to_param
    assert_response :success
  end

  test "should update package_history" do
    put :update, :id => @package_history.to_param, :package_history => @package_history.attributes
    assert_redirected_to package_history_path(assigns(:package_history))
  end

  test "should destroy package_history" do
    assert_difference('PackageHistory.count', -1) do
      delete :destroy, :id => @package_history.to_param
    end

    assert_redirected_to package_histories_path
  end
end
