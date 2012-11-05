require 'test_helper'

class PatientDocumentsControllerTest < ActionController::TestCase
  setup do
    @patient_document = patient_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_document" do
    assert_difference('PatientDocument.count') do
      post :create, :patient_document => @patient_document.attributes
    end

    assert_redirected_to patient_document_path(assigns(:patient_document))
  end

  test "should show patient_document" do
    get :show, :id => @patient_document.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @patient_document.to_param
    assert_response :success
  end

  test "should update patient_document" do
    put :update, :id => @patient_document.to_param, :patient_document => @patient_document.attributes
    assert_redirected_to patient_document_path(assigns(:patient_document))
  end

  test "should destroy patient_document" do
    assert_difference('PatientDocument.count', -1) do
      delete :destroy, :id => @patient_document.to_param
    end

    assert_redirected_to patient_documents_path
  end
end
