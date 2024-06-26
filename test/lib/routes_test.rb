# frozen_string_literal: true
require File.expand_path("test/test_helper.rb")

module ThemesForRails
  class RoutingTest < ::ActionController::TestCase
    test "should recognize stylesheets route" do
      assert_generates('/themes/default/stylesheets/app.css', { 
        controller: 'themes_for_rails/assets', 
        action: 'stylesheets',
        theme: 'default', 
        asset: 'app.css'
      })
    end

    test "should recognize javascripts route" do
      assert_generates('/themes/default/javascripts/app.js', { 
        controller: 'themes_for_rails/assets', 
        action: 'javascripts',
        theme: 'default', 
        asset: 'app.js'
      })
    end

    test "should recognize images route" do
      assert_generates('/themes/default/images/logo.png', { 
        controller: 'themes_for_rails/assets', 
        action: 'images',
        theme: 'default', 
        asset: 'logo.png'
      })
    end

    test "should recognize nested route" do
      assert_generates('/themes/default/images/nested/logo.png', { 
        controller: 'themes_for_rails/assets', 
        action: 'images',
        theme: 'default', 
        asset: 'nested/logo.png'
      })
    end
  end
end
