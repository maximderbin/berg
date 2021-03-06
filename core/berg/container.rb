require "dry/web/container"

module Berg
  class Container < Dry::Web::Container
    configure do
      config.name = :core
      config.auto_register = %w[lib/authentication]
    end

    load_paths! "lib", "core"
  end
end
