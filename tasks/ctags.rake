namespace :ctags do
  desc 'Install exuberant ctags'
  task :install => :copy_ctags_preferences do
    unless File.exists?('/usr/local/bin/ctags')
      puts 'Installing ctags from homebrew...'
      puts `brew install ctags`
      print 'Using ctags at: '
      puts `which ctags`
      puts `ctags --version`
      puts 'If this is not exuberant ctags, make sure /usr/local/bin preceeds /usr/bin in your path'
    end
  end

  task :copy_ctags_preferences do
    if File.exists?(File.expand_path('~/.ctags'))
      puts 'Ctags configuration already installed at ~/.ctags'
    else
      `cp #{File.expand_path('../../etc/ctags', __FILE__)} ~/.ctags`
    end
  end
end
