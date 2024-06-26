# frozen_string_literal: true
require File.expand_path("test/test_helper.rb")

class ThemesForRailsTest < ::ActiveSupport::TestCase
  setup do
    @common = Object.new
    @common.extend ThemesForRails::CommonMethods
    @common.theme_name = "awesome"
    ThemesForRails.config.clear
  end

  test 'should use config base_dir to build theme path' do
    ThemesForRails.config.base_dir = '/some_path'
    assert_match /some_path/, @common.theme_view_path
  end

  test 'should use config views_dir to build theme path' do
    ThemesForRails.config.views_dir =':root/skinner/:name/views'
    assert_match /skinner/, @common.theme_view_path_for('awesome')
    assert_match /skinner/, @common.theme_view_path
  end

  test 'should use config base_dir to build theme path for theme' do
    ThemesForRails.config.base_dir ='some_path'
    assert_match /some_path/, @common.theme_view_path_for('doodley')
  end

end