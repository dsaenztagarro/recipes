# workstation
local_filepath = node['chef-repo']['filepath']

# remote server
hostname = node['chef-server']['hostname']
username = node['chef-server']['username']
user_host = "#{username}@#{hostname}"

bash 'get_config_files' do
  cwd ::File.dirname(local_filepath)
  code <<-EOH
    mkdir -p .chef
    scp -p #{user_host}:/tmp/id-admin.pem .chef
    scp -p #{user_host}:/tmp/id-org.pem .chef
  EOH
end
