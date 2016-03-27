stack = search("aws_opsworks_stack").first
layer = search("aws_opsworks_layer").first

template "/etc/motd.opsworks-static" do
  source "motd.erb"
  mode "0644"
  variables({
    :stack => stack['name'],
    :layers => layer['name'],
    :instance => search("aws_opsworks_instance", "self:true").first
  })
end
