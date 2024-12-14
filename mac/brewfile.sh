# Specify directory to install
cask_args appdir: "/opt"

# Tap Homebrew
tap 'homebrew/bundle'
tap "homebrew/core"

# Install packages
brew 'git'
brew 'git-crypt'
brew 'git-lfs'

# Images, Video
brew 'ffmpeg'
