#!/bin/bash
cd ~/.tmux && cat .tmux.conf.local tmux.conf.common tmux.conf.macos tmux-lab.conf > ~/.tmux.conf.local
