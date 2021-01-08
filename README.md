# sm_vim_ahk

Fork of [vim_ahk](https://github.com/rcmdnk/vim_ahk) for using vim shortcuts in SuperMemo :). To use just run the script with ahk.

You can change various configurations by adding them in the file vim.ahk before the line that creates the Vim() instance, `vim := new VimAhk()`.

See the readme of the original repo for additional installation and configuration information.

## Main Modes

|Mode|Description|
|:---|:----------|
|Insert mode|Original Windows state - Same as original|
|Normal mode|Vim movement commands can be used to navigate through text inside of elements, and sometimes in the knowledge tree|
|Visual mode|Visual block mode has been disabled as it is not supported. Use visual mode to select text before making cloze, extract, etc|
|Command mode|Disabled|

The initial state is the Normal mode.

SM_Vim tries to minimize the use of the mouse while staying true to a lot of vim navigation. The goal is not to recreate vim in SM but to allow for text selection and navigation, repetitions etc with the keyboard alone.

Batch processing and folder operations etc will still need to be performed with mouse or traditional scripts. [MasterHowToLearn's fork](https://github.com/MasterHowToLearn/SuperMemoVim) was referenced but changes are a lot more minimal.

As command mode was only used for saving and quitting, it has been disabled.

Finally, a separate file, `/bind/vm_sm_scripts.ahk` has been added for other common shortcuts that other ahk scripts have for SM, such as setting priorities, concept hooks, etc. Add your scripts to this file. Since these do not interfere with the text editing process, SM_Vim allows them in all modes.

## Option Changes

`VimEscNormal = 0` , ESC will not go to Normal Mode!

`VimJJ = 1` , typing `jj` in Insert Mode will return to Normal Mode.

### Disabled Keys

For SM_Vim, the `VimDisableUnused` Configuration is set to 2 by default, these means a-z (+Shift), numbers and symbols have been disabled while not in insert mode. However, the following shortcuts have been enabled:

* a: Edit First Answer
* q: Edit First Question
* 1-5 : Response Shortcuts (only when a not inside a text box and review window is active)

e: Edit texts stays **disabled** by default. You can re-enable normal mode a functionality, and disable a and q SM functionality if preferred.

You can enable more shortcuts as needed by removing the line blocking them in the file `/bind/vim_disable.ahk` (using level 2)

Alternatively, you can change the configuration setting `VimDisableUnused` to 1 in the `vim.ahk` file. This stops `vim_ahk` from disabling any keys while not in insert mode.

## Command Changes

Below is a summary of the changes in shortcuts compared to the original vim_ahk. New commands/functions are **bolded** and removed/disabled commands are in ~~strikethrough~~

### Insert Mode

|Key/Commands|Function|
|:----------:|:-------|
|~~Esc~~ | Disabled by default |
|Ctrl-[| Enter the normal mode. Holding (0.5s) these keys emulate normal Ctrl-[.|
|jj|Enter the normal mode **enabled by default**.|
|Custom two letters|If two-letter mapping is set.|

ESC/Ctrl-[ switch off IME if IME is on.
ESC acts as ESC when IME is on and converting instructions.
Ctrl-[ switches off IME and enters the normal mode even if IME is on.

Long press ESC (Ctrl-[) will send these original keys, if `VimLongEscNormal` (`VimLongCtrlBracketNormal` is not enabled (0).

If `VimLongEscNormal` (`VimLongCtrlBracketNormal`) is enabled,
single press will send original keys
and long press will change the mode to the normal mode.

If using a custom two-letter hotkey to enter the normal mode, the two letters must be different.

### Normal Mode

### Mode Change

|Key/Commands|Function|
|:----------:|:-------|
| ~~a~~| a has been disabled as it interferes with existing SM shortcut a: edit first answer.|
|i/I/A/o/O | The remaining shortcuts should work as usual. Does nothing if text caret is not available. o/O only work when editing the elements in the element window.|
|~~Ctrl-v~~| Visual block mode is disabled|
|v/V|Enter the visual mode of Character-wise/Line-wise/Block-wise.|
|~~:~~|Command line mode is disabled|

### Move

|Key/Commands|Function|
|:----------:|:-------|
|h/j/k/l|Left/Down/Up/Right.|
|~~Ctrl + h/j/k/l~~| Disabled as they interfere with SM shortcuts|
|0/$| To the start/end of the line.|
|Ctrl-a/Ctrl-e| To the start/end of the line (emacs like).|
|^| To the starting non-whitespace character of the line.|
|w/W/e/E| Move a word forward (all work the same way: goes to the beginning of the word). NOTE: e is a shortcut for edit texts but it has not been disabled.|
|b/B| Move a word backward (b/B:  the beginning of the word).|
|Ctrl-u/Ctrl-d| Go Up/Down 10 line.|
|Ctrl-b/Ctrl-f| PageUp/PageDown.|
|gg/G| Go to the top/bottom of the file|

In addition, `Repeat` is also available for some commands.

|Example Commands|Action|
|:----------:|:-------|
|4j| Down 4 lines|
|3w| Move 3 words forward|
|100j| Down 100 lines|

**Repeat does not work outside of the main element window!!**

### Yank/Cut(Delete)/Change/Paste

|Key/Commands|Function|
|:----------:|:-------|
|yy, Y| Copy the line.|
|dd| Cut the line.|
|D| Cut from here to the end of the line.|
|cc| Change the line (enter the insert mode).|
|C| Cut from here to the end of the line and enter the insert mode.|
|x/X| Delete a character under/before the cursor (not registered in the clipboard).|
|p/P| Paste to the next/current place. If copy/cut was done with the line-wise visual mode, it pastes to the next/current line. Some commands (such yy/dd) also force to paste as line-wise.|

y/d/c+Move Command can be used, too.

* e.g.) `yw` -> copy next one word.
* e.g.) `d3w` -> delete next 3 words.

### Others

|Key/Commands|Function|
|:----------:|:-------|
|u/Ctrl-r| Undo/Redo.|
|~~R~~| R (replace multiple characters) has been disabled|
|**R**| (R)efocus the element window. Use to return to element focus from the knowledge tree etc |
|r| Replace one character|
|J| Combine two lines.|
|.| It is fixed to do: `Replace a following word with a clipboard` (useful to use with a search).|
|~| Change case.|
|/| Start search - Opens Ctrl+F searchbox in supermemo|
|~~n/N~~| Search next/previous not supported for SM|
|~~*~~| Disabled. You can perform Ctrl+F3 search on the selected text with Tab + S|
|~~ZZ/ZQ~~|Like Command mode, this has been disabled|

### Visual Mode

|Key/Commands|Function|
|:----------:|:-------|
|~~Esc~~/Ctrl-[| Enter the normal mode.|
|Move command| Most of move commands in the normal mode are available.|
| **x** | **Extract the selected text.** Use d to cut text instead|
| ~~x/X~~ | New functionality of x is extraction like `Alt+x` in SM. Use d to cut text instead.|
|y/d/c| Copy/Cut/Cut and insert|
|Y/D/C| Move to the end of line, then Copy/Cut/Cut and the insert mode (`D`=`X`)|
|~~*~~| ~~Search the selected word.~~ Disabled|
|**z**| Create a cloze of selected text|
|**n**| Create a (n)ew cloze in item cards - replaces selected text with cloze [...] and copies text to the clipboard|
|**m**| Make cloze and paste - same as `n` but also pastes the text into the answer field.|
|**s**| Search selected word (Ctrl+F3 search)|
|**f**| Format selection as plain html|
|**h**| Highlight selected text|

### Command Mode

All commands are disabled

### New Script shortcuts (Any Mode)

|Key/Commands|Function|
|:----------:|:-------|
|Tab + Q/W/E/R/T/Y | Assign priority to current element. Feel free to change ranges. Currently Q is urgent (0-5), WE applicable but less urgent (5-30), RTY used for interests and exploration (30-100)
|Tab + D| Cut drills|
|Tab + H| Open element in html editor (Ctrl + F9)|
|Tab + L| Clear Search Highlights|
|Tab + S| Split the article|

Add your own scripts to `/bind/vim_sm_scripts.ahk` to allow them in any mode.
