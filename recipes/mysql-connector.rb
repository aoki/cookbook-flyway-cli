#
# Cookbook Name:: flyway-cli
# Recipe:: default
#
# Copyright 2013, ringohub
#
# All rights reserved - Do Not Redistribute
#

execute "mysql-connector" do
  command <<-EOH
     wget http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-5.1.26.tar.gz -P /tmp
     tar xzfC /tmp/mysql-connector-java-5.1.26.tar.gz /opt/flyway/flyway/jars
     ln -nfs /opt/flyway/flyway/jars/mysql-connector-java-5.1.26/mysql-connector-java-5.1.26-bin.jar /opt/flyway/flyway/jars//mysql-connector-java-5.1.26-bin.jar
  EOH
end
