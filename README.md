.tmux
=====

겁나 제대로 설정잡힌  `.tmux.conf`. 원래 저장소는 [@gpakosz/.tmux](https://github.com/gpakosz/.tmux). 아래 번역들은 첨삭과 변경을 가해 원본과 다른 부분이 많다는 점에 주의!


![Screenshot](https://cloud.githubusercontent.com/assets/553208/19740585/85596a5a-9bbf-11e6-8aa1-7c8d9829c008.gif)

설치
------------

준비사항:

  - 버전 **`>= 2.3`** 이상의 tmux. 리눅스, 맥, 오픈BSD, 잡종 Cygwin 또는 WSL
  - awk, perl, sed
  - `$TERM` 환경변수는 반드시 `xterm-256color` 값으로 설정해야 함!

터미널에서 아래 명령들 수행.  (기존 파일 백업 잊지 마셈: ~/.tmux.conf)

```
$ cd
$ git clone https://github.com/andrwj/.tmux.git
$ ln -s -f .tmux/.tmux.conf
$ ln -s -f .tmux/.tmux.conf.local .

# 맥 사용자인 경우 어쩔 수 없이 깔아야 함. 설치하지 않으면 인생이 피곤해짐.
$ brew install reattach-to-user-namespace
```

설정 변경은 오직 `~/.tmux.conf.local` 에서만 진행할 것!  

[customize]: #enabling-the-powerline-look

Vim 사용자는 `$EDITOR`  환경 변수값을  `vim` will으로 설정해야 키바인딩과 기타 기능이 활성화됨.

tmux가 뭔지 어떻게 사용하는지 1도 모르는 사용자는, 그냥 적당히 웹서칭을 통해 필요한 내용을 알아보셈. 굳이 책 구입같은 건 하지말기를 권함.



[bhtmux2]: https://pragprog.com/book/bhtmux2/tmux-2
[@bphogan]: https://twitter.com/bphogan




키보드 바로가기
--------

tmux를 사용할 때는 항상 `prefix`라 불리는 키를 먼저 입력해야 함! 기본 값은 `C-b`인데  vim 사용할 때 불편해서 `C-a`로 바꿔뒀음. 보통 `C-b`도 가능하게 설정해두는 경우가 많지만, 여기서는 알짤없이 `C-a`로만 사용합니다. 

키 조합 표시 설명:
  - `<prefix>` <kbd>Ctrl</kbd> + <kbd>a</kbd> 입력 한다는 뜻.
  - `<prefix> c` <kbd>Ctrl</kbd> + <kbd>a</kbd> 누른 뒤 <kbd>c</kbd> 입력  한다는 뜻.
  - `<prefix> C-c` <kbd>Ctrl</kbd> + <kbd>a</kbd> 누른 뒤 <kbd>Ctrl</kbd> + <kbd>c</kbd> 입력 한다는 뜻.


용어 설명:


   - `세션`<sup>session</sup> tmux 실행 단위.
   - `윈도우`<sup>window</sup> tmux 표시 단위 중 최상위 집합.  세션은 윈도우의 집합이다. *(새 터미널이나 새 iTerm2 윈도우를 만들지 않고 하나의 터미널 혹은 iTerm2 인스턴스를 사용한다)*
   - `창`<sup>pane</sup> 윈도우 내의 특정 구역. 윈도우는 창의 집합이다. 사용자에게 창은 셸<sup>shell</sup>이다.
    

키보드 조합 설정:

 - **창** <sup>pane</sup>
 
   - `<prefix> |` 현재 창<sup>pane</sup>을 수직으로 분할
   - `<prefix> -` 현재 창<sup>pane</sup>을 수평으로 분할
   - `<prefix>` + `h` (왼쪽) | `j` (아래) | `k` (위) | `l` (오른쪽) -- Vim 동작방식으로 창<sup>pane</sup> 전환
   - `<prefix>` + `H`, `J`, `K`, `L` -- 창<sup>panem</sup> 크기 조절  (한번 누를 때 마다 2 칸씩 조절. 마우스로도 조절 가능)
   - `<prefix> Enter ` 현재 창<sup>pane</sup> 최대화/복귀 (토글<sup>toggle</sup>)
   - `<prefix> <` 또는 `<prefix> >` 창<sup>panes</sup> 위치 바꾸기<sup>swap</sup>



 - **내용 복사**

   - `<prefix> e` 복사모드 전환/해제 (토글). 또는 마우스모드 사용시 영역선택 후 <kbd>Cmd</kbd>-<kbd>c</kbd> or <kbd>Ctrl</kbd>-<kbd>c</kbd>

   - `복사모드`<sup>copy-mode-vi</sup>에서 키 조합:

     - `v` 선택 시작 / 시각모드
     - `C-v` 블록모드/시각모드 사이 전환
     - `H` 현재 줄의 처음으로 이동
     - `L` 현재 줄의 끝으로 이동
     - `y` 최상위 `붙여넣기 버퍼`<sup>paste-buffer</sup>에 선택영역 복사
     - `Escape` 현재 작업 취소


 - **닫기** 
   - `<prefix> q` 창<sup>pane</sup> 닫기
   - `<prefix> Q` tmux 강제 종료
   - `<prefix> &` 응답없는 창<sup>pane</sup> 닫기


 - **세션** <sup>session</sup>

   - `<prefix> $` 세션 이름 설정
   - `<prefix> C-c` 새로운 세션 시작.
   - `<prefix> C-f` 이름입력해서 다른 세션으로 바꾸기


 - **윈도우** <sup>window</sup>

   - `<prefix> C-h`(previous) 또는 `<prefix> C-l`(next) **윈도우**<sup>window</sup> 간 전환
   - `<prefix> Tab` 직전의 활성 윈도우를 전면으로 가져오기


 - **버퍼** <sup>buffer</sup>

   - `<prefix> b` paste-buffers 목록 표시
   - `<prefix> p` paste-buffer 에서 내용 가져오기
   - `<prefix> P` 내용을 가져올 paste-buffer 선택하기
   
 
 - **기타**

   - `<prefix> m` 마우스 사용 설정/해제 (토글)
   - `<prefix> w` 세션<sup>session</sup>, 윈도우<sup>window</sup>, 창<sup>pane</sup> 목록 표시. (구조적 표현, 세션/윈도우/창 사이를 손쉽게 전환 가능)
   - `<prefix> C-e` `$EDITOR`에 설정된 편집기로 `~/.tmux.conf.local` 설정 파일 열기. (EDITOR 설정이 없을 경우, 기본값 
'vim')
   - `<prefix> r` 설정파일 다시 읽어들이기
   - `C-l` 화면정리! tmux history 삭제!
   - `<prefix> U` (가능한 경우) Urlview 열기
   - `<prefix> F` (가능한 경우) Facebook PathPicker 열기 



특징
--------

 - visual theme inspired by [Powerline][]
 - [maximize any pane to a new window with `<prefix> Enter`][maximize-pane]
 - SSH/Mosh aware username and hostname status line information
 - mouse mode toggle with `<prefix> m`
 - automatic usage of [`reattach-to-user-namespace`][reattach-to-user-namespace]
   if available
 - laptop battery status line information
 - uptime status line information
 - optional highlight of focused pane
 - configurable new windows and panes behavior (optionally retain current path)
 - SSH/Mosh aware split pane (reconnects to remote server)
 - copy to OS clipboard (needs [`reattach-to-user-namespace`][reattach-to-user-namespace]
   on macOS, `xsel` or `xclip` on Linux)
 - support for 4-digit hexadecimal Unicode characters
 - [Facebook PathPicker][] integration if available
 - [Urlview][] integration if available

[Powerline]: https://github.com/Lokaltog/powerline
[maximize-pane]: http://pempek.net/articles/2013/04/14/maximizing-tmux-pane-new-window/
[reattach-to-user-namespace]: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
[Facebook PathPicker]: https://facebook.github.io/PathPicker/
[Urlview]: https://packages.debian.org/stable/misc/urlview

The "maximize any pane to a new window with `<prefix> Enter`" feature is different
from builtin `resize-pane -Z` as it allows you to further split a maximized
pane. It's also more flexible by allowing you to maximize a pane to a new
window, then change window, then go back and the pane is still in maximized
state in its own window. You can then minimize a pane by using `<prefix> Enter`
either from the source window or the maximized window.

![Maximize pane](https://cloud.githubusercontent.com/assets/553208/9890858/ee3c0ca6-5c02-11e5-890e-05d825a46c92.gif)

Mouse mode allows you to set the active window, set the active pane, resize
panes and automatically switches to copy-mode to select text.

![Mouse mode](https://cloud.githubusercontent.com/assets/553208/9890797/8dffe542-5c02-11e5-9c06-a25b452e6fcc.gif)


설정 변경
-------------

While this configuration tries to bring sane default settings, you may want to
customize it further to your needs. Instead of altering the `~/.tmux.conf` file
and diverging from upstream, the proper way is to edit the `~/.tmux.conf.local`
file.

Please refer to the default `~/.tmux.conf.local` file to know more about
variables you can adjust to alter different behaviors. Pressing `<prefix> e`
will open `~/.tmux.conf.local` with the editor defined by the `$EDITOR`
environment variable (defaults to `vim` when empty).

### Powerline 갬성 사용하기

Powerline originated as a status-line plugin for Vim. Its popular eye-catching
look is based on the use of special symbols: <img width="80" alt="Powerline Symbols" style="vertical-align: middle;" src="https://cloud.githubusercontent.com/assets/553208/10687156/1b76dda6-796b-11e5-83a1-1634337c4571.png" />

To make use of these symbols, there are several options:

- use a font that already bundles those: this is e.g. the case of the
  [2.030R-ro/1.050R-it version][source code pro] of the Source Code Pro font
- use a [pre-patched font][powerline patched fonts]
- use your preferred font along with the [Powerline font][powerline font] (that
  only contains the Powerline symbols): [this highly depends on your operating
  system and your terminal emulator][terminal support], for instance here's a
  screenshot of iTerm2 configured to use `PowerlineSymbols.otf`
  ![iTerm2 + Powerline font](https://user-images.githubusercontent.com/553208/62243890-8232f500-b3de-11e9-9b8c-51a5d38bdaa8.png)

[source code pro]: https://github.com/adobe-fonts/source-code-pro/releases/tag/2.030R-ro/1.050R-it
[powerline patched fonts]: https://github.com/powerline/fonts
[powerline font]: https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
[terminal support]: http://powerline.readthedocs.io/en/master/usage.html#usage-terminal-emulators
[Powerline manual]: http://powerline.readthedocs.org/en/latest/installation.html#fonts-installation

Please see the [Powerline manual] for further details.

Then edit the `~/.tmux.conf.local` file (`<prefix> e`) and adjust the following
variables (아래 문자가 보이지 않는다면 사용중인 폰트에 문자가 빠진 것이다. Nerd Font 설치 권함):

```
tmux_conf_theme_left_separator_main=''
tmux_conf_theme_left_separator_sub='|'
tmux_conf_theme_right_separator_main=''
tmux_conf_theme_right_separator_sub=''
```
### 상태바 설정변경

Contrary to the first iterations of this configuration, by now you have total
control on the content and order of `status-left` and `status-right`.

Edit the `~/.tmux.conf.local` file (`<prefix> C-e`) and adjust the
`tmux_conf_theme_status_left` and `tmux_conf_theme_status_right` variables to
your own preferences.

This configuration supports the following builtin variables:

 - `#{battery_bar}`: horizontal battery charge bar
 - `#{battery_percentage}`: battery percentage
 - `#{battery_status}`: is battery charging or discharging?
 - `#{battery_vbar}`: vertical battery charge bar
 - `#{circled_session_name}`: circled session number, up to 20
 - `#{hostname}`: SSH/Mosh aware hostname information
 - `#{hostname_ssh}`: SSH/Mosh aware hostname information, blank when not
   connected to a remote server through SSH/Mosh
 - `#{loadavg}`: load average
 - `#{pairing}`: is session attached to more than one client?
 - `#{prefix}`: is prefix being depressed?
 - `#{root}`: is current user root?
 - `#{synchronized}`: are the panes synchronized?
 - `#{uptime_d}`: uptime days
 - `#{uptime_h}`: uptime hours
 - `#{uptime_m}`: uptime minutes
 - `#{uptime_s}`: uptime seconds
 - `#{username}`: SSH/Mosh aware username information
 - `#{username_ssh}`: SSH aware username information, blank when not connected
   to a remote server through SSH/Mosh

Beside custom variables mentioned above, the `tmux_conf_theme_status_left` and
`tmux_conf_theme_status_right` variables support usual tmux syntax, e.g. using
`#()` to call an external command that inserts weather information provided by
[wttr.in]:
```
tmux_conf_theme_status_right='#{prefix}#{pairing}#{synchronized} #(curl wttr.in?format=3) , %R , %d %b | #{username}#{root} | #{hostname} '
```

![Weather information from wttr.in](https://user-images.githubusercontent.com/553208/52175490-07797c00-27a5-11e9-9fb6-42eec4fe4188.png)

[wttr.in]: https://github.com/chubin/wttr.in#one-line-output

💡 You can also define your own custom variables. See the sample
`.tmux.conf.local` file for instructions.

Finally, remember `tmux_conf_theme_status_left` and
`tmux_conf_theme_status_right` end up being given to tmux as `status-left` and
`status-right` which means they're passed through `strftime()`. As such, the `%`
character has a special meaning and needs to be escaped by doubling it, e.g.
```
tmux_conf_theme_status_right='#(echo foo %% bar)'
```
See `man 3 strftime`.

### Using TPM plugins

This configuration now comes with built-in [TPM] support:
- use the `set -g @plugin ...` syntax to enable a plugin
- whenever a plugin introduces a variable to be used in `status-left` or
  `status-right`, you can use it in `tmux_conf_theme_status_left` and
  `tmux_conf_theme_status_right` variables, see instructions above 👆
- ⚠️ do not add `set -g @plugin 'tmux-plugins/tpm'`
- ⚠️ do not add `run '~/.tmux/plugins/tpm/tpm'` to `~/.tmux.conf` or your
- `~/.tmux.conf.local` copy ← people who are used to alter
  `.tmux.conf` to add TPM support will have to adapt their configuration

⚠️ The TPM bindings differ slightly from upstream:
  - installing plugins: `<prefix> + I`
  - uninstalling plugins: `<prefix> + Alt + u`
  - updating plugins: `<prefix> + u`

See `~/.tmux.conf.local` for instructions.

[TPM]: https://github.com/tmux-plugins/tpm

### Accessing the macOS clipboard from within tmux sessions (tmux `< 2.6`)

[Chris Johnsen created the `reattach-to-user-namespace`
utility][reattach-to-user-namespace] that makes `pbcopy` and `pbpaste` work
again within tmux.

To install `reattach-to-user-namespace`, use either [MacPorts][] or
[Homebrew][]:

    $ port install tmux-pasteboard

or

    $ brew install reattach-to-user-namespace

Once installed, `reattach-to-usernamespace` will be automatically detected.

[MacPorts]: http://www.macports.org/
[Homebrew]: http://brew.sh/

### Using the configuration under Cygwin within Mintty

**I don't recommend running this configuration with Cygwin anymore. Forking
under Cygwin is extremely slow and this configuration issues a lot of
`run-shell` commands under the hood. As such, you will experience high CPU
usage. As an alternative consider using [Mintty terminal for WSL][wsltty].**

![cygwin](https://cloud.githubusercontent.com/assets/553208/19741789/67a3f3d8-9bc2-11e6-9ecc-499fc0228ee6.png)

It is possible to use this configuration under Cygwin within Mintty, however
support for Unicode symbols and emojis lacks behind Mac and Linux.

Particularly, Mintty's text rendering is implemented with GDI which has
limitations:

- color emojis are only available through DirectWrite starting with Windows 8.1
- display of double width symbols, like the battery discharging symbol indicator
  (U+1F50B) is buggy

To get Unicode symbols displayed properly, you have to use [font linking].
Open `regedit.exe` then navigate to the registry key at
`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink`
and add a new entry for you preferred font to link it with the Segoe UI Symbol
font.

![regedit](https://cloud.githubusercontent.com/assets/553208/19741304/71a2f3ae-9bc0-11e6-96aa-4c09a812c313.png)

[font linking]: https://msdn.microsoft.com/en-us/goglobal/bb688134.aspx

문제해결
---------------

 - **I'm running tmux `HEAD` and things don't work properly. What should I do?**

   Please open an issue describing what doesn't work with upcoming tmux. I'll do
   my best to address it.

 - **Status line is broken and/or gets duplicated at the bottom of the screen.
   What gives?**

   This particularly happens on Linux when the distribution provides a version
   of glib that received Unicode 9.0 upgrades (glib `>= 2.50.1`) while providing
   a version of glibc that didn't (glibc `< 2.26`). You may also configure
   `LC_CTYPE` to use an `UTF-8` locale. Typically VTE based terminal emulators
   rely on glib's `g_unichar_iswide()` function while tmux relies on glibc's
   `wcwidth()` function. When these two functions disagree, display gets messed
   up.

   This can also happen on macOS when using iTerm2 and "Use Unicode version 9
   character widths" is enabled in `Preferences... > Profiles > Text`

   For that reason, the default `~/.tmux.conf.local` file stopped using Unicode
   characters for which width changed in between Unicode 8.0 and 9.0 standards,
   as well as Emojis.

 - **I installed Powerline and/or (patched) fonts but can't see Powerline
   symbols.**

   First, you don't need to install Powerline. You only need fonts patched with
   Powerline symbols or the standalone `PowerlineSymbols.otf` font. Then make
   sure your `~/.tmux.conf.local` copy uses the right code points for
   `tmux_conf_theme_left_separator_XXX` values.

 - **I'm using Bash On Windows (WSL), colors and Powerline look are broken.**

   There is currently a [bug][1681] in the new console powering Bash On Windows
   preventing text attributes (bold, underscore, ...) to combine properly with
   colors. The workaround is to search your `~/.tmux.conf.local` copy and
   replace attributes with `'none'`.

   Also, until Window's console replaces its GDI based render with a DirectWrite
   one, Powerline symbols will be broken.

   The alternative is to use the [Mintty terminal for WSL][wsltty].

[1681]: https://github.com/Microsoft/BashOnWindows/issues/1681
[wsltty]: https://github.com/mintty/wsltty


