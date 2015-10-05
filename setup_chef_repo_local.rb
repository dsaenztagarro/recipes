# workstation
repo_filepath = node['chef-repo']['filepath']

print repo_filepath

# remote server
cookbook_filepath = node['chef-server-cookbook']['filepath']

bash 'get_config_files' do
  cwd repo_filepath
  code <<-EOH
    mkdir -p .chef
    cp -f #{cookbook_filepath}/permissions/userlocal.pem .chef/
    cp -f #{cookbook_filepath}/permissions/orglocal-validator.pem .chef/
  EOH
end
