# frozen_string_literal: true

require 'test_helper'

class BusinessProductsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get business_products_index_url
    assert_response :success
  end

  test 'should get edit' do
    get business_products_edit_url
    assert_response :success
  end

  test 'should get new' do
    get business_products_new_url
    assert_response :success
  end
end
