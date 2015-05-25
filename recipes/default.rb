#
# Cookbook Name:: application-sidekiq
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

upload_file 'sidekiq.yml' do
  path "#{node[:app][:config_path]}/sidekiq.yml"
end

%w{sidekiq.sh sidekiq.conf}.each do |f|
  upload_template "#{node[:app][:config_path]}/#{f}" do
    source "#{f}.erb"
  end
end

bash 'Setup sidekiq service' do
  code <<-EOL
    sudo cp "#{node[:app][:config_path]}/sidekiq.sh" "#{node[:app][:sidekiq][:script]}" && sudo chown #{node[:app][:sidekiq][:user]}:#{node[:app][:sidekiq][:group]} #{node[:app][:sidekiq][:script]} && sudo chmod ugo+x #{node[:app][:sidekiq][:script]}
    sudo cp "#{node[:app][:config_path]}/sidekiq.conf" "#{node[:app][:monit][:sidekiq]}"
  EOL

  notifies :restart, 'service[monit]', :immediately
end

include_recipe 'application-sidekiq::service'