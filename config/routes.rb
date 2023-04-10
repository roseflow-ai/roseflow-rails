Roseflow::Rails::Engine.routes.draw do
  interactions.each do |interaction_name|
    klass = const_get(interaction_name)

    next unless klass.singleton_class.included_modules.include?(Roseflow::Interaction) &&
                klass.singleton_class.included_modules.include?(Roseflow::Interaction::WithHttpApi)

    controller_klass = Class.new(InteractionController) do
      def initialize
        super(klass)
      end
    end

    const_set("#{interaction_name}Controller", controller_klass)
    post "/interactions/#{klass.api_resource_name}", to: "#{interaction_name.underscore}#call"
  end

  def interaction
    interaction_files.map do |file|
      File.basename(file, ".rb").camelize
    end
  end

  def interaction_files
    Dir.glob("#{engine_interactions_path}/*.rb") + Dir.glob("#{rails_application_interactions_path}/*.rb")
  end

  def engine_interactions_path
    File.expand_path("app/interactions", Roseflow::Rails::Engine.root)
  end

  def rails_application_interactions_path
    File.expand_path("app/interactions", Rails.root)
  end
end
