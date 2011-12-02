module ExtjsScaffold
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :file_name, :desc => "Name of file used to hold Ext.application", :aliases => '-n'
      class_option :app_name, :desc => "Name of app used in Ext.application", :aliases => '-a'

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end
      
      def create_application_file
        empty_directory File.join("app/assets", "javascripts")
        template 'App.js', File.join('app/assets/javascripts/', app_file_name)
      end
      
      def create_model_file
        empty_directory File.join("app/assets/javascripts", "model")
        template 'ParentComboModel.js', File.join('app/assets/javascripts/model/', 'ParentCombo.js')
      end
      
      def create_util_file
        empty_directory File.join("app/assets/javascripts", "util")
        template 'Format.js', File.join('app/assets/javascripts/util/', 'Format.js')
      end
      
      def create_ux_files
        empty_directory File.join("app/assets/javascripts", "ux")
        # data
        empty_directory File.join("app/assets/javascripts/ux", "data")
        empty_directory File.join("app/assets/javascripts/ux/data", "proxy")
        
        template 'Actionable.js', File.join('app/assets/javascripts/ux/data/', 'Actionable.js')
        template 'Updateable.js', File.join('app/assets/javascripts/ux/data/', 'Updateable.js')
        template 'Rails.js', File.join('app/assets/javascripts/ux/data/proxy/', 'Rails.js')
      
        # form
        empty_directory File.join("app/assets/javascripts/ux", "form")
        empty_directory File.join("app/assets/javascripts/ux/form", "field")
        
        template 'FormPanel.js', File.join('app/assets/javascripts/ux/form/', 'Panel.js')
        template 'ParentComboField.js', File.join('app/assets/javascripts/ux/form/field', 'ParentCombo.js')
        template 'SearchField.js', File.join('app/assets/javascripts/ux/form/field/', 'SearchField.js')
        
        #grid
        empty_directory File.join("app/assets/javascripts/ux", "grid")
        template 'GridPanel.js', File.join('app/assets/javascripts/ux/grid/', 'Panel.js')
        
        #toolbar
        empty_directory File.join("app/assets/javascripts/ux", "toolbar")
        template 'ScrollingToolbar.js', File.join('app/assets/javascripts/ux/toolbar/', 'Scrolling.js')
        
        #window
        empty_directory File.join("app/assets/javascripts/ux", "window")
        template 'EditWindow.js', File.join('app/assets/javascripts/ux/window/', 'EditWindow.js')
        
      end
     
      protected
      
      def app_file_name
        file_name = options.file_name || rails_app_name
        [file_name, :js].compact.join(".")
      end
      
      def app_name
        options.app_name || rails_app_name
      end
      
      def rails_app_name
        # get app name and convert to capcase
        Rails.root.to_s.split('/').last.titlecase.split.join
      end
    end
  end
end