# sidekiq config
default[:app][:sidekiq] = {}
default[:app][:sidekiq][:config] = "#{node[:app][:config_path]}/sidekiq.yml"
default[:app][:sidekiq][:log] = "#{node[:app][:logs_path]}/sidekiq.log"
default[:app][:sidekiq][:pid] = "#{node[:app][:pids_path]}/sidekiq.pid"
default[:app][:sidekiq][:script] = "#{node[:app][:services_path]}/sidekiq-#{node[:app][:name]}"
default[:app][:sidekiq][:user] = "#{node[:app][:user]}"
default[:app][:sidekiq][:group] = "#{node[:app][:group]}"

default[:app][:monit][:sidekiq] = "#{node[:app][:monit][:path]}/sidekiq-#{node[:app][:name]}.conf"