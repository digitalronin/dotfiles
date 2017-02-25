Largely ripped off from here;

    https://github.com/holman/dotfiles

vim plugins
===========

I used to handle these as git submodules, but that started to get painful. So, I now keep my vim plugins as git checkouts in a separate directory, and use the following script to update the copies in this project;

      #!/bin/bash

      for plugin in `find . -maxdepth 1 -type d`
      do
        echo $plugin
        (
          cd $plugin
          if git pull origin master
          then
            target_dir="$HOME/.dotfiles/vim/vim.symlink/pack/digitalronin/start/$plugin"
            rm -rf $target_dir/* 2>/dev/null
            mkdir $target_dir 2>/dev/null
            git archive master | tar -x -C $target_dir
          fi
        )
      done

Brewfile
========

http://robots.thoughtbot.com/brewfile-a-gemfile-but-for-homebrew


