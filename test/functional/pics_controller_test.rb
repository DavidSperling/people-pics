require 'test_helper'

class PicsControllerTest < ActionController::TestCase
  setup do
    @pic = pics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pic" do
    assert_difference('Pic.count') do
      post :create, pic: { accessories: @pic.accessories, age: @pic.age, clothes: @pic.clothes, emotion: @pic.emotion, eye_color: @pic.eye_color, face_bottom: @pic.face_bottom, face_left: @pic.face_left, face_right: @pic.face_right, face_top: @pic.face_top, full_bottom: @pic.full_bottom, full_left: @pic.full_left, full_right: @pic.full_right, full_top: @pic.full_top, gender: @pic.gender, hair_color: @pic.hair_color, hair_length: @pic.hair_length, hair_style: @pic.hair_style, makeup: @pic.makeup, physique: @pic.physique, race: @pic.race, skin_color: @pic.skin_color, tags: @pic.tags, url: @pic.url, weight: @pic.weight }
    end

    assert_redirected_to pic_path(assigns(:pic))
  end

  test "should show pic" do
    get :show, id: @pic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pic
    assert_response :success
  end

  test "should update pic" do
    put :update, id: @pic, pic: { accessories: @pic.accessories, age: @pic.age, clothes: @pic.clothes, emotion: @pic.emotion, eye_color: @pic.eye_color, face_bottom: @pic.face_bottom, face_left: @pic.face_left, face_right: @pic.face_right, face_top: @pic.face_top, full_bottom: @pic.full_bottom, full_left: @pic.full_left, full_right: @pic.full_right, full_top: @pic.full_top, gender: @pic.gender, hair_color: @pic.hair_color, hair_length: @pic.hair_length, hair_style: @pic.hair_style, makeup: @pic.makeup, physique: @pic.physique, race: @pic.race, skin_color: @pic.skin_color, tags: @pic.tags, url: @pic.url, weight: @pic.weight }
    assert_redirected_to pic_path(assigns(:pic))
  end

  test "should destroy pic" do
    assert_difference('Pic.count', -1) do
      delete :destroy, id: @pic
    end

    assert_redirected_to pics_path
  end
end
