service 'sidekiq' do
  start_command "sudo monit start sidekiq-#{node[:app][:name]}"
  stop_command "sudo monit stop sidekiq-#{node[:app][:name]}"
  restart_command "sudo monit restart sidekiq-#{node[:app][:name]}"
  supports restart: true, stop: true, start: true
end