require 'rails_helper'

module Roseflow::Rails::Engine
  RSpec.describe "routing", type: :routing do
    routes { Roseflow::Rails::Engine.routes }

    before do
      Object.const_set('TestInteractionOne', Class.new do
        extend Roseflow::Interaction
        extend Roseflow::Interaction::WithHttpApi

        api_resource_name "test_one"

        def self.call(context)
          context
        end
      end)

      Object.const_set('TestInteractionTwo', Class.new do
        extend Roseflow::Interaction
        extend Roseflow::Interaction::WithHttpApi

        api_resource_name "test_two"

        def self.call(context)
          context
        end
      end)
    end

    after do
      # Remove the test interactions after running the test
      Object.send(:remove_const, :TestInteractionOne)
      Object.send(:remove_const, :TestInteractionTwo)
    end

    it "routes to TestInteractionOne" do
      expect(post: "/interactions/test_one").to route_to(controller: "test_interaction_one", action: "call")
    end

    it "routes to TestInteractionTwo" do
      expect(post: "/interactions/test_two").to route_to(controller: "test_interaction_two", action: "call")
    end
  end
end