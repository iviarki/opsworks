#
# Cookbook Name:: opsworks
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


execute "yum clean" do
 command "yum clean all"
end

execute "yum update" do
 command "yum -y update"
end