#!/bin/bash
cd ~/.tmux && cat .tmux.conf.local tmux.conf.common tmux.conf.macos geovim.conf > ~/.tmux.conf.local
