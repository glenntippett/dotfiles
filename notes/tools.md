# Tools I'm using

<!--toc:start-->
- [Tools I'm using](#tools-im-using)
<!--toc:end-->

kitty
terminal emulator

neovim
been using the nightly version

tmux
terminal multiplexer, mainly used for splitting terminal windows
and managing sessions with vim.
Also handy for keeping a long running task running in the background

fzf
search for files in current directory,
also used in neovim for fuzzy finding files, buffers, etc.

ripgrep
search content of files in current directory, alias rg
example with case insensitive search:

```bash
rg -i "thing to search for"
```

mdless
view markdown files in terminal

csvlens
view csv files in terminal

Yazi
a terminal file manager
<https://yazi-rs.github.io/docs/quick-start>

gping
Ping with a graph

```bash
brew install gping
```

<https://github.com/orf/gping>

meetingbar
```bash
brew install meetingbar
```

herb-lint
The Herb Linter provides comprehensive HTML+ERB validation with a set of configurable rules to enforce best practices and catch common errors.

https://herb-tools.dev/projects/linter#command-line

```bash
npm install -g @herb-tools/linter
```

use with command:

```bash
herb-lint
```

use herb lint to check modified files:

```bash
herb-lint $(git status -s | grep -E '\.(html|erb|rb)$' | awk '{print $2}')
```

