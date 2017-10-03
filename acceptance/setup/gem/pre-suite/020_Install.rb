gem_source = ENV['GEM_SOURCE'] || "https://rubygems.org"
gem_version = ENV['BOLT_GEM'] || "> 0.1.0"

test_name "Install Bolt gem" do
  step "Install Bolt gem" do
    install_command = "gem install --source #{gem_source} bolt -v '#{gem_version}'"
    case bolt['platform']
    when /windows/
      execute_powershell_script_on(bolt, install_command)
    else
      on(bolt, install_command)
    end
  end
end
