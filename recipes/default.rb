#
# Cookbook Name:: flyway-cli
# Recipe:: default
#
# Copyright 2013, ringohub
#
# All rights reserved - Do Not Redistribute
#

execute "flyway-cli" do
  command <<-EOH
     wget http://repo1.maven.org/maven2/com/googlecode/flyway/flyway-commandline/2.2.1/flyway-commandline-2.2.1.tar.gz -P /tmp
     tar xzfC /tmp/flyway-commandline-2.2.1.tar.gz /opt
     ln -s /opt/flyway-2.2.1 /opt/flyway
  EOH
end

execute "mysql-connector" do
  command <<-EOH
     wget http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-5.1.26.tar.gz -P /tmp
     tar xzfC /tmp/mysql-connector-java-5.1.26.tar.gz /opt/flyway/jars
  EOH
end
