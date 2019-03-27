eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

for dir in $HOME/.gem/ruby/*; do
  [ -d "$dir/bin" ] && PATH="${dir}/bin:${PATH}"
done
