require 'hugebag/view_helpers'
require 'hugebag/controller_helpers'
require 'hugebag/migration_helpers'

module Hugebag
  class Railtie < Rails::Railtie
    initializer 'railtie.configure_rails_initialization' do
      ActionView::Base.send :include, ViewHelpers
      ActionController::Base.send :include, ControllerHelpers
      ActiveRecord::Migration.send :include, MigrationHelpers
    end
  end
end