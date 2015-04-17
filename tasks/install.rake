desc 'Install vim configuration'
task :install => ['ctags:install', 'git:install_ctags', 'copy_tmux_config'] do
  unless File.exists?(File.expand_path('~/.vim/.bundle/Vundle.vim'))
    `mkdir ~/.vim/.bundle`
    `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/.bundle/Vundle.vim`
    `brew update`
    `brew install vim`
    `brew install reattach-to-user-namespace`
  end
end

task :copy_tmux_config do
  if File.exists?(File.expand_path('~/.tmux.conf'))
    puts 'Tmux configuration already exists at ~/.tmux.conf'
  else
    `cp #{File.expand_path('../../etc/tmux.conf', __FILE__)} ~/.tmux.conf`
  end
end
task :default => [:install]
