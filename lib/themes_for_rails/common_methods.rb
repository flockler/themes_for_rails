# frozen_string_literal: true

module ThemesForRails
  module CommonMethods

    include ThemesForRails::Interpolation

    def theme_name
      @cached_theme_name ||= begin
        case @theme_name
        when Symbol
          self.respond_to?(@theme_name, true) ? self.send(@theme_name) : @theme_name.to_s
        when String then @theme_name
        else
          nil
        end
      end
    end
    
    def theme_name=(name)
      @theme_name = name
    end

    def set_theme(name)
      self.theme_name = name
      if valid_theme?
        add_theme_view_path
      end
    end
    

    def valid_theme?
      !self.theme_name.nil?
    end
    
    # will add the view path for the current theme
    def add_theme_view_path
      add_theme_view_path_for(self.theme_name)
    end
    
    # will add the view path for a given theme name
    def add_theme_view_path_for(name)
      self.view_paths.insert 0, ::ActionView::FileSystemResolver.new(theme_view_path_for(name))
    end

    def public_theme_path
      theme_view_path("/")
    end

    def theme_asset_path
      theme_asset_path_for(theme_name)
    end

    def theme_view_path
      theme_view_path_for(theme_name)
    end

    def theme_view_path_for(theme_name)
      interpolate(ThemesForRails.config.views_dir, theme_name)
    end

    def theme_asset_path_for(theme_name)
      interpolate(ThemesForRails.config.assets_dir, theme_name)
    end
  end
end
