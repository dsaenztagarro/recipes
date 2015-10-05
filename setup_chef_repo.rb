# workstation
local_filepath = node['chef-repo']['filepath']

# remote server
hostname = node['chef-server']['hostname']
username = node['chef-server']['username']
permissions_filepath = node['chef-server']['permissions_filepath']
remote_filepath = "#{username}@#{hostname}:/#{permissions_filepath}"

bash 'get_config_files' do
  cwd ::File.dirname(local_filepath)
  code <<-EOH
    mkdir -p .chef
    scp -p vagrant #{remote_filepath}/userlocal.pem #{local_filepath}/.chef
    scp -p vagrant #{remote_filepath}/mychef.pem #{local_filepath}/.chef
  EOH
end
