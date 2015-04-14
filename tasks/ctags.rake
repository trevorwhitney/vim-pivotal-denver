namespace :ctags do
  desc 'Install exuberant ctags'
  task :install do
    unless File.exists?('/usr/local/bin/ctags')
      puts 'Installing ctags from homebrew...'
      puts `brew install ctags`
      print 'Using ctags at: '
      puts `which ctags`
      puts `ctags --version`
      puts 'If this is not exuberant ctags, make sure /usr/local/bin preceeds /usr/bin in your path'
    end
  end
end
