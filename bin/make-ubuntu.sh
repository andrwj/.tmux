#!/bin/bash
cd ~/.tmux && cat .tmux.conf.local tmux.conf.common tmux.conf.ubuntu-server > ~/.tmux.conf.local
