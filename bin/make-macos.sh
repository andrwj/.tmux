#!/bin/bash
cd ~/.tmux && cat .tmux.conf.local tmux.conf.common tmux.conf.macos tpm.conf > ~/.tmux.conf.local
