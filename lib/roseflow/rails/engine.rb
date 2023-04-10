module Roseflow
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Roseflow::Rails
    end
  end
end
