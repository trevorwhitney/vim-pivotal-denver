desc 'Install vim configuration'
task :install => ['ctags:install', 'git:install_ctags'] do
  unless File.exists?(File.expand_path('~/.vim/.bundle/Vundle.vim'))
    `mkdir ~/.vim/.bundle`
    `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/.bundle/Vundle.vim`
    `vim +PluginInstall +qall`
  end
end

task :default => [:install]
