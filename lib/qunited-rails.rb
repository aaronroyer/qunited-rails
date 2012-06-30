require 'qunited/rails/version'

module Qunited
  module Rails
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load 'qunited/rails/tasks/qunited.rake'
      end
    end
  end
end
