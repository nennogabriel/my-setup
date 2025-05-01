#!/bin/zsh

print_header "Installing Applications"

# Homebrew GUI Applications
print_header "Installing Homebrew GUI Applications"
check_and_install "waterfox" "brew install waterfox"
check_and_install "chromium" "brew install chromium"
check_and_install "brave-browser" "brew install brave-browser"
check_and_install "vlc" "brew install vlc"
check_and_install "transmission" "brew install transmission"
check_and_install "dropbox" "brew install dropbox"
check_and_install "discord" "brew install discord"
check_and_install "tradingview" "brew install tradingview"
check_and_install "visual-studio-code" "brew install visual-studio-code"
check_and_install "cursor" "brew install cursor"
check_and_install "orbstack" "brew install orbstack"
check_and_install "rambox" "brew install rambox"

# Homebrew Command Line Tools
print_header "Installing Homebrew Command Line Tools"
check_and_install "wget" "brew install wget"
check_and_install "ffmpeg" "brew install ffmpeg"
check_and_install "yt-dlp" "brew install yt-dlp"
check_and_install "git-lfs" "brew install git-lfs"

# Mac App Store Applications
print_header "Installing Mac App Store Applications"
check_and_install "mas" "brew install mas"

# Install Mac App Store applications
install_mas_app "1352778147" "Bitwarden"
# install_mas_app "801463932" "Stockfish"
# install_mas_app "1499327230" "Art Text 4"
# install_mas_app "1616831348" "Affinity Design 2"
# install_mas_app "441258766" "Magnet"
# install_mas_app "1147396723" "Whatsapp Desktop"
install_mas_app "1141688067" "Coin Tick"
install_mas_app "747648890" "Telegram Desktop"
install_mas_app "803453959" "Slack"
# install_mas_app "1614666244" "Mattermost"
# install_mas_app "1604311726" "Opera Crypto Browser"
install_mas_app "1440147259" "AdGuard for Safari"
# install_mas_app "1485052491" "Dropzone 4"
# install_mas_app "1355679052" "Dropover"
# install_mas_app "1607635845" "Velja"
# install_mas_app "1452453066" "Hidden Bar"
# install_mas_app "1628987979" "Imageoptin"
install_mas_app "1333542190" "1Password" 