test_name "Setup environment" do

  step "Ensure Ruby is installed on Bolt controller" do
    case bolt['platform']
    when /windows/
      # use chocolatey to install latest ruby
      execute_powershell_script_on(bolt,"Set-ExecutionPolicy AllSigned; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))")
      execute_powershell_script_on(bolt, 'choco install ruby')
    when /debian|ubuntu/
      # install system ruby packages
      install_package(bolt, 'ruby')
      install_package(bolt, 'ruby-dev')
    when /el-|centos|fedora/
      # install system ruby packages
      install_package(bolt, 'ruby')
      install_package(bolt, 'ruby-devel')
    when /osx/
      # ruby dev tools should be already installed
    else
      fail_test("Platform #{bolt['platform']} is not supported as a bolt controller at this time")
    end
  end

end
