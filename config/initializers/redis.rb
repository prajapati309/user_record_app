# config/initializers/redis.rb
require 'redis'

redis_url = ENV['REDIS_URL'] || 'redis://localhost:6379/0'

# If you are using Redis for Sidekiq, set it as the Sidekiq server's Redis connection
Sidekiq.configure_server do |config|
  config.redis = { url: redis_url, namespace: 'user_record_app' }
end

# If you are using Redis for other parts of your app, configure it here as well
$redis = Redis.new(url: redis_url)
