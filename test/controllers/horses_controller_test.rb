require 'test_helper'

class HorsesControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
    @horse = horses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:horses)
  end

  test "should get new" do
    get :new, client_id: @client
    assert_response :success
  end

  test "should create horse" do
    assert_difference('Horse.count') do
      post :create, horse: { comment: @horse.comment, name: @horse.name, photo: @horse.photo }, client_id: @client
    end
    assert_redirected_to client_horse_path(@client.id, assigns(:horse))
  end

  test "should show horse" do
    get :show, id: @horse, client_id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @horse, client_id: @client
    assert_response :success
  end

  test "should update horse" do
    patch :update, id: @horse, horse: { comment: @horse.comment, name: @horse.name, photo: @horse.photo }, client_id: @client
    assert_redirected_to client_horse_path(@client.id, assigns(:horse))
  end

  test "should destroy horse" do
    assert_difference('Horse.count', -1) do
      delete :destroy, id: @horse, client_id: @client
    end

    assert_redirected_to client_path(@client)
  end
end
