# encoding: utf-8
module ThemesForRails
  module CommonMethods

    include ThemesForRails::Interpolation

    def theme_name
      @cached_theme_name ||= begin
        case @theme_name
        when Symbol then 
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
    
    public
    
    def valid_theme?
      !self.theme_name.nil?
    end
    
    # will add the view path for the current theme
    def add_theme_view_path
      add_theme_view_path_for(self.theme_name)
    end
    
    # will add the view path for a given theme name
    def add_theme_view_path_for(name)
      prepend_view_path ::ActionView::FileSystemResolver.new(default_theme_view_path)
      prepend_view_path ::ActionView::FileSystemResolver.new(theme_view_path_for(name))
      prepend_view_path ThemesForRails::DatabaseResolver.new(name, self.current_account) if ThemesForRails.config.database_enabled
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

    def default_theme_view_path
      interpolate(ThemesForRails.config.default_views_dir)
    end

    def theme_asset_path_for(theme_name)
      interpolate(ThemesForRails.config.assets_dir, theme_name)
    end

    def default_theme_asset_path
      interpolate(ThemesForRails.config.default_assets_dir)
    end
  end
end