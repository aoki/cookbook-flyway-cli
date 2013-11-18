#
# Cookbook Name:: flyway-cli
# Recipe:: default
#
# Copyright 2013, ringohub
#
# All rights reserved - Do Not Redistribute
#

install_dir = "/opt/flyway"
version = "2.2.1"

if version < "2.2" then
  Chef::Log::error "#{cookbook_name} is supported versions in more than 2.2."
  exit 1
end

directory "#{install_dir}/versions" do
  owner     "root"
  group     "wheel"
  action    :create
  recursive true
end

execute "flyway-cli" do
  command <<-EOH
     wget http://repo1.maven.org/maven2/com/googlecode/flyway/flyway-commandline/#{version}/flyway-commandline-#{version}.tar.gz -P /tmp
     tar xzfC /tmp/flyway-commandline-#{version}.tar.gz #{install_dir}/versions
     ln -nfs #{install_dir}/versions/flyway-#{version} #{install_dir}/flyway
  EOH
end

execute "mysql-connector" do
  command <<-EOH
     wget http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-5.1.26.tar.gz -P /tmp
     tar xzfC /tmp/mysql-connector-java-5.1.26.tar.gz /opt/flyway/flyway/jars
  EOH
end
