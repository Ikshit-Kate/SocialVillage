# frozen_string_literal: true

require 'test_helper'

class BusinessesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get businesses_new_url
    assert_response :success
  end

  test 'should get show' do
    get businesses_show_url
    assert_response :success
  end

  test 'should get edit' do
    get businesses_edit_url
    assert_response :success
  end

  test 'should get index' do
    get businesses_index_url
    assert_response :success
  end
end
