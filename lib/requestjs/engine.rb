module Requestjs
  class Engine < ::Rails::Engine
    initializer "requestjs.assets" do
      if Rails.application.config.respond_to?(:assets)
        Rails.application.config.assets.precompile += %w( rails-requestjs requestjs )
      end
    end

    initializer "requestjs.importmap", before: "importmap" do |app|
      app.config.importmap.paths << Engine.root.join("config/importmap.rb")
    end
  end
end
