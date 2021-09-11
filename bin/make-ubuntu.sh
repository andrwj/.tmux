#!/bin/bash
cd ~/.tmux && cat .tmux.conf.local tmux.conf.common tmux.conf.ubuntu-server tmux-prefix.conf tmux-lab.conf > ~/.tmux.conf.local
