# Install requirements
%w{g++ libtool libicu-dev automake}.each do |pkg|
  apt_package pkg
end

# Install couchstore
cache_path  = Chef::Config['file_cache_path']
couchstore_src_path = "#{cache_path}/couchstore"
couchstore_git = node['couchstore']['git']
couchstore_ref = node['couchstore']['ref']

bash "install-couchstore" do
  cwd       couchstore_src_path
  code <<-EOH
    ./config/autorun.sh
    ./configure
    make
    sudo make install
EOH
  action :nothing
  not_if do
    ::File.exists?("#{couchstore_src_path}/.lib/libcouchstore.so")
  end
end

directory ::File.dirname(couchstore_src_path) do
  recursive true
end

git couchstore_src_path do
  repository  couchstore_git
  reference   couchstore_ref
  action    :checkout
  notifies :run, resources(:bash => "install-couchstore"), :immediately
end