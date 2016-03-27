instance = search("aws_opsworks_instance", "self:true").first

template "/etc/motd.opsworks-static" do
  source "motd.erb"
  mode "0644"
  variables({
    :stack => search("aws_opsworks_stack").first,
    :layers => search("aws_opsworks_layer").first,
    :layer_names => instance[:layer_ids].map{|my_layer_id| search(:aws_opsworks_layer, "layer_id:#{my_layer_id}").first}.join(', '),
    :instance => instance
  })
end
