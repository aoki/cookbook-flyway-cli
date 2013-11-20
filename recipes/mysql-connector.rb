#
# Cookbook Name:: flyway-cli
# Recipe:: default
#
# Copyright 2013, ringohub
#
# All rights reserved - Do Not Redistribute
#

install_dir ="#{node['flyway-cli']['install_dir']}/flyway/jars"

execute "mysql-connector" do
  command <<-EOH
     wget http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-5.1.26.tar.gz -P /tmp
     tar xzfC /tmp/mysql-connector-java-5.1.26.tar.gz #{install_dir} 
     ln -nfs #{install_dir}/mysql-connector-java-5.1.26/mysql-connector-java-5.1.26-bin.jar #{install_dir}/mysql-connector-java-5.1.26-bin.jar
  EOH
  not_if { File.exists?("#{install_dir}/mysql-connector-java-5.1.26") }
end
