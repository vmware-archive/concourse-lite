# better error messages from Hash.fetch
env = ENV.to_hash

unless env.include?("AWS_ACCESS_KEY_ID") &&  env.include?("AWS_SECRET_ACCESS_KEY")
  raise "$AWS_ACCESS_KEY_ID and $AWS_SECRET_ACCESS_KEY must be provided in the environment"
end

def tags_from_environment(env)
  env.fetch("INSTANCE_TAGS", "").split(",").collect { |t|
    t.split("=")
  }.inject({
    "Name" => env.fetch("INSTANCE_NAME", "Concourse"),
  }) do |tags, tag|
    tags[tag[0]] = tag[1]
    tags
  end
end

Vagrant.configure("2") do |config|
  config.vm.hostname = "concourse"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.ssh.username = "ubuntu"
  config.ssh.private_key_path = env.fetch("SSH_PRIVATE_KEY", "~/.ssh/id_rsa_bosh")

  config.vm.provider :aws do |v|
    v.access_key_id =       env.fetch("AWS_ACCESS_KEY_ID")
    v.secret_access_key =   env.fetch("AWS_SECRET_ACCESS_KEY")
    v.keypair_name =        env.fetch("INSTANCE_KEYPAIR", "bosh")
    v.block_device_mapping = [{
      :DeviceName => "/dev/sda1",
      "Ebs.VolumeSize" => env.fetch("INSTANCE_DISK_SIZE", "50").to_i
    }]
    v.instance_type =       env.fetch("INSTANCE_TYPE", "m3.xlarge")
    v.security_groups =     [env.fetch("INSTANCE_SECURITY_GROUP_ID", "inception")]
    v.subnet_id =           env.fetch("INSTANCE_SUBNET_ID") if env.include?("INSTANCE_SUBNET_ID")
    v.tags =                tags_from_environment(env)
  end

  meta_data_public_ip_url = "http://169.254.169.254/latest/meta-data/public-ipv4"
  meta_data_local_ip_url = "http://169.254.169.254/latest/meta-data/local-ipv4"

  PUBLIC_IP = <<-PUBLIC_IP_SCRIPT
public_ip_http_code=`curl -s -o /dev/null -w "%{http_code}" #{meta_data_public_ip_url}`

if [ $public_ip_http_code == "404" ]; then
  local_ip=`curl -s #{meta_data_local_ip_url}`
  echo "There is no public IP for this instance"
  echo "The private IP for this instance is $local_ip"
else
  public_ip=`curl -s #{meta_data_public_ip_url}`
  echo "The public IP for this instance is $public_ip"
fi
  PUBLIC_IP_SCRIPT
  config.vm.provision :shell, id: "public_ip", run: "always", inline: PUBLIC_IP
end
