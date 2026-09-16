__git_branch() {
  git branch 2>/dev/null | grep '^\*' | sed 's/\* //' | xargs -i echo "[{}] "
}

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u \[\033[02m\]$(__git_branch)\[\033[00m\]($(date +"%H:%M:%S")) \[\033[01;34m\]\w\[\033[0
else
  PS1='${debian_chroot:+($debian_chroot)}\u:\w$(__git_branch)\$ '
fi

PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u: \w\a\]$PS1"
