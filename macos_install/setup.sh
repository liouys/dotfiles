#!/bin/bash
# Main install script


DOTFILES_DIRECTORY="${HOME}/.dotfiles"
DOTFILES_TARBALL_PATH="https://github.com/seanly/dotfiles/tarball/master"

# If missing, download and extract the dotfiles repository
if [[ ! -d ${DOTFILES_DIRECTORY} ]]; then
    printf "$(tput setaf 6)Downloading dotfiles...\033[m\n"
    mkdir ${DOTFILES_DIRECTORY}
    # Get the tarball
    curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOTFILES_TARBALL_PATH}
    # Extract to the dotfiles directory
    tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOTFILES_DIRECTORY}
    # Remove the tarball
    rm -rf ${HOME}/dotfiles.tar.gz
fi

cd ${DOTFILES_DIRECTORY}

source ./macos_install/utils.sh

# Before relying on Homebrew, check that packages can be compiled
e_header "Installing XCode Command Line Tools..."
xcode-select --install
e_success "XCode Command Line Tools install complete!"


# Git configs
e_header "Configure your Git settings: "
nano ${DOTFILES_DIRECTORY}/gitconfig
e_success "Git settings updated!"


link() {
    # Force create/replace the symlink.
    ln -fs "${DOTFILES_DIRECTORY}/${1}" "${HOME}/${2}"
}

mirrorfiles() {
    # Create the necessary symbolic links between the `.dotfiles` and `HOME`
    # directory. The `bash_profile` sources other files directly from the
    # `.dotfiles` repository.
    link "macos_install/.aliases"           ".aliases"
    link "macos_install/.bash_profile"      ".bash_profile"
    link "macos_install/.functions"         ".functions"
    #link ".git-completion"                 ".git-completion"
    link "gitconfig"                        ".gitconfig"
    link "gitignore_global"                 ".gitignore_global"
    link "macos_install/.inputrc"           ".inputrc"

    e_success "Dotfiles update complete!"
}

# Ask before potentially overwriting files
seek_confirmation "Warning: This step may overwrite your existing dotfiles."

if is_confirmed; then
    mirrorfiles
    source ${HOME}/.bash_profile
else
    e_warning "Skipped dotfiles settings."
fi

# Install Brew and Cask packages
seek_confirmation "Warning: This step install Brew, Cask, Brew Cask Upgrade, MAS and applications."

if is_confirmed; then
    e_header "Please, configure you Brew settings and packages before installation."
    sleep 2
    nano ${DOTFILES_DIRECTORY}/macos_install/brew.sh
    bash ./macos_install/brew.sh
    e_success "Brew and applications are installed!"
else
    e_warning "Skipped Brew settings update."
fi

# Create a directory for projects and development
e_header "Creating Projects directory in Home"
mkdir ${HOME}/Projects

e_success "Reboot and enjoy!"
