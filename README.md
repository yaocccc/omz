<!-- markdown-toc GFM -->

* [o╦╗](#o)
* [FUTURES](#futures)
  * [USAGE](#usage)
  * [UPDATE](#update)
  * [FILE TREE](#file-tree)
  * [REQUIRES](#requires)
  * [CONFIGURATION](#configuration)
  * [PLUGINS](#plugins)

<!-- markdown-toc -->

# o╦╗

fork自 oh my zsh，更纯净 更快速

![avatar](./screenshots/show.gif)

# FUTURES

- 快速跳转到目录 `z dirname` 可用tab补全
- fzf-tab支持 使用fzf取代原生tab候选、预览
- 输入命令过程中展示最近使用同开头的命令 右键采用
- 高亮输入命令 绿色正确 红色错误
- `extract` 或 `x` 命令解压任意格式压缩文件
- 选择性开启hook，可实现新开终端自动进入最后进入的目录 `export _OMZ_APPLY_CHPWD_HOOK=true`
- 常用git快捷命令集成

## USAGE

```shell
  # 找一个地方clone本仓库 例如 ~/.config
  git clone https://github.com/yaocccc/omz

  # 在你的zsh配置里 source ~/.config/omz/omz.zsh (举例)
  echo "source ~/config/omz/omz.zsh" >> $ZSH/init.zsh

  # 请务必安装fzf和lua 依赖
```

## UPDATE

```plaintext
  cd $OMZ && git pull
```

## FILE TREE

```plaintext
omz
  ├── cache/              -- 部分需要缓存的配置
  ├── lib/                -- 部分依赖文件
  │   ├── omz.sh          -- omz.sh
  │   ├── img_preview.sh  -- 图片预览脚本 for fzf
  │   └── file_preview.sh -- 文件预览脚本 for fzf
  ├── config/
  │   ├── fzf.zsh         -- fzf 及 fzf-tab配置
  │   ├── git.zsh         -- git相关配置
  │   ├── hook.zsh        -- 命令或启动钩子配置
  │   └── omz.zsh         -- omz基础配置
  ├── plugins/            -- 插件
  ├── themes/             -- 主题
  ├── omz.zsh             -- 配置入口
  └── README.md           -- README
```

## REQUIRES

- zsh
- fzf
- fd
- bat (可选 更好的文本预览效果)
- exa (可选 更好的目录预览效果)
- ueberzug (可选 可在x11终端下预览图片)

```plaintext
  请自行安装fd
  On macOS: brew install fd
  On Arch Linux: pacman -S fd
  On Ubuntu: apt install fd-find && ln -s $(which fdfind)
  On Debian: sudo apt-get install fd-find && ln -s $(which fdfind) ~/.local/bin/fd

  请自行安装fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
```

## CONFIGURATION

```plaintext
# 以下env如果需要请在source omz.zsh 前定义

_OMZ_APPLY_PREEXEC_HOOK
  是否允许OMZ开启"命令发生前"相关hook
  默认false
  行为:
    1. 执行命令前 将修改当前终端会话的title为: $cmd

_OMZ_APPLY_CHPWD_HOOK
  是否允许OMZ开启"pwd变更后"相关hook
  默认false
  行为:
    1. 载入时，会自动切换到上一次cd过的目录
    2. 发生cd命令时，自动记录当前cd的目录(在缓存文件中)
```

## PLUGINS

1. z.lua
    > `z keyword`  
    > 按使用频率跳转到keyword关联目录  
    > 例如 `z zsh` 可快速跳转到 `~/.config/zsh` 目录  

2. extract  
    > `extract xxx` 或 `x xxx`  
    > extract一个压缩文件  
    > 可根据不同压缩文件类型进行解压 无需记忆长解压指令  

3. zsh-autosuggestions  
    > 输入命令时从history中找到最符合的命令  
    > \<right> 使用该 suggestion  

4. zsh-syntax-highlighting  
    > 高亮输入命令  

5. fzf-tab  
    > tab时使用fzf进行候选选择  

6. 常用git命令支持(非插件)
    > `gco` = `git checkout`  
    > `gpo` = `git push origin <当前分支>`  
    > `gpl` = `git pull origin <当前分支>`  
    > `gd` = `git diff`  
    > `gs` = `git status`  
    > `gss` = `更简洁的 git status`  
    > `gam` = `git add all 并 git commit -m '内容'`, e.g. `git commit update readme`  
    > `gll` = `简洁打印 git log`, 默认展示10条 若想展示更多 `gll 100`  
    > `glll` = `详细打印 git log`, 默认展示10条 若想展示更多 `glll 100`  
    >> 展示 glll效果如下 PS: 实际使用带颜色 可自行根据 [此文件:git.zsh](https://github.com/yaocccc/omz/blob/master/config/git.zsh) 内容配置对应颜色
    >> 
    >> $ glll  
    >> \* e797da3 2022-12-14 15:18 user1: fix: 透传减轻下游负载  
    >> \* ed8a8ba 2022-12-14 14:41 user1: fix: 查询时透传id  
    >> \*   7c2799b 2022-12-13 19:04 user1: Merge branch 'abc' into 'master'  
    >> |\  
    >> | * 3f2441b 2022-12-13 19:01 user1: fix: 修复安全隐患
    >> |/  
    >> \*   70a46da 2022-12-13 18:27 user2: Merge branch 'fix/abcd' into 'master'  
