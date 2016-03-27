template "/etc/motd.opsworks-static" do
  source "motd.erb"
  mode "0644"
  variables({
    :stack => search("aws_opsworks_stack").first,
    :layers => search("aws_opsworks_layer").first,
    :instance => search("aws_opsworks_instance", "self:true").first
  })
end
