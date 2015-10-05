# workstation
repo_filepath = node['chef-repo']['filepath']

# remote server
cookbook_filepath = node['chef-server-cookbook']['permissions_filepath']

bash 'get_config_files' do
  cwd ::File.dirname(repo_filepath)
  code <<-EOH
    mkdir -p .chef
    cp -p vagrant #{cookbook_filepath}/userlocal.pem .chef
    cp -p vagrant #{cookbook_filepath}/mychef.pem .chef
  EOH
end
