workers Integer(ENV['WEB_CONCURRENCY'] || 4)
threads_count = Integer(ENV['MAX_THREADS'] || 1)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  # ActiveRecord::Base.establish_connection

  ActiveRecord::Base.connection_pool.disconnect!

  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.configurations.keys.each do |key|
      config = ActiveRecord::Base.configurations[key]
      config['reconnect'] = true

      config['pool'] = ENV['DB_POOL'] || ENV['MAX_THREADS']     || 1

      # TODO This can cause problems?
      config['reaping_frequency'] = ENV['DB_REAPING_FREQUENCY'] || 10 # seconds

      config['connect_timeout'] = ENV['DB_CONNECT_TIMEOUT']     || 10 # seconds
      config['read_timeout']    = ENV['DB_READ_TIMEOUT']        || 30 # seconds
      config['write_timeout']   = ENV['DB_WRITE_TIMEOUT']       || 30 # seconds

      ActiveRecord::Base.establish_connection(config)
    end
  end
end

on_worker_shutdown do
  ActiveRecordConnection.teardown
end

on_worker_fork do
  # let nginx know we are ready
  FileUtils.touch('/tmp/app-initialized')
end
