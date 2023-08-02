# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module SocialVillage
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Set the active job queue adapter to :sidekiq
    config.active_job.queue_adapter = :sidekiq

    config.generators.after_generate do |files|
      parsable_files = files.filter { |file| file.end_with?('.rb') }
      system("bundle exec rubocop -A --fail-level=E #{parsable_files.shelljoin}", exception: true)
    end
  end
end
