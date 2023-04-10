module Roseflow
  module Rails
    class InteractionController < ApplicationController
      def initialize(interaction)
        super
        @interaction = interaction
      end

      def call
        context = params[:context] || {}
        result = @interaction.call(context)
        render json: result
      end
    end
  end
end