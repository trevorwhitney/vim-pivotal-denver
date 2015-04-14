namespace :git do
  task :configure_template_dir do
    @template_dir = `git config --global init.templatedir`
    next if $? == 0

    @template_dir = '~/.git_template'
    `git config --global init.templatedir #{@template_dir}`
  end

  task :create_hooks_directory do
    `mkdir -p ~/.git_template/hooks`
  end

  task :copy_ctags_script => :create_hooks_directory do
    unless File.exists?('~/.git_template/hooks/ctags')
      ctags_script = File.expand_path('../../bin/ctags', __FILE__)
      `cp #{ctags_script} ~/.git_template/hooks`
      `git config --global alias.ctags '!.git/hooks/ctags'`
    end
  end

  task :copy_hooks => :create_hooks_directory do
    post_commit = File.expand_path('../../bin/post-commit', __FILE__)
    post_merge= File.expand_path('../../bin/post-merge', __FILE__)
    post_checkout = File.expand_path('../../bin/post-checkout', __FILE__)
    post_rewrite = File.expand_path('../../bin/post-rewrite', __FILE__)
    [post_rewrite, post_commit, post_merge, post_checkout].each do |hook|
      `cp #{hook} ~/.git_template/hooks`
    end
  end

  desc 'Configure git integration with ctags'
  task :install_ctags => ['ctags:install', :configure_template_dir, :copy_ctags_script, :copy_hooks]
end

