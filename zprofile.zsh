#!/bin/zsh

# MacPorts Installer addition on 2016-09-04_at_16:34:44: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Miniconda
# Need this to get conda in the PATH so that we can then activate specific environments.
export PATH="/Users/errontitus/miniconda3/bin:$PATH"

# Mysql shell
export PATH=$PATH:/usr/local/mysql/bin

# CCP4
source /Applications/ccp4-7.0/bin/ccp4.setup-sh

# Dials
# IMPORTANT: have had problems with phenix not running its own software (running dials scripts instead) if this is sourced after phenix setup.
source /Applications/dials-v1-14-1/dials_env.sh

# Phenix
# IMPORTANT: do this after dials. Otherwise, certain phenix tools will use incompatible dials code.
source /Applications/phenix-1.15.2-3472/phenix_env.sh

# Amber
export AMBERHOME=/Users/errontitus/Amber/amber16
source /Users/errontitus/Amber/amber16/amber.sh

# Modeller installation
export KEY_MODELLER="MODELIRANJE"

# Rosetta
export PATH="/Users/errontitus/bin/rosetta-3.8/bin:$PATH"
# I now use the default location of the database.
# export ROSETTA_38_DATABASE="/Users/errontitus/bin/rosetta-3.8/database"

# Everything custom below here.

# Various tools.
export PATH="/Users/errontitus/bin:$PATH"
# Xtal scripts
export PATH="/Users/errontitus/bin/crystallography:$PATH"
# Modeller scripts
export PATH="/Users/errontitus/bin/modeller_scripts:$PATH"
# Modeller scripts
export PATH="/Users/errontitus/bin/chimera_scripts:$PATH"
# PDB tools
export PATH="/Users/errontitus/bin/pdb_tools:$PATH"
# LaTex
export PATH="/usr/local/texlive/2018/bin/x86_64-darwin:$PATH"
# AWK scripts
export AWKPATH="/Users/errontitus/bin:/Users/errontitus/bin/crystallography:$AWKPATH"

# Aliases
#
# For most programs we use an alias instead of a symlink.
#
# This is because for programs invoked by symlink, the working directory becomes the directory in which the symlink
# is stored, which creates a number of subtle problems.
#
# For example, a program like Chimera needs to find its own python stack when it starts up.
# But it does not know where its python is installed, so it just examines the directory from which the symlink
# was invoked. This happens because the C library function that gives the path of the running program returns the symlink path
# rather than the path of the program invoked by the symlink.
#
# Therefore, Chimera launched in this way will fail to find its python stack.
#
# A wrapper to launch from /Applications (see below) would solve the problem, but then your
# working directory is in /Applications. This creates a different problem: you can't pass relative paths for various inputs.
# cd $HOME/bin
# echo "#!/bin/sh" > chimera
# echo "exec /Applications/Chimera.app/Contents/MacOS/chimera \"\$@\"" >> chimera
#
# chmod u+x chimera
# chmod u+x clustal-omega-1.2.3-macosx
# chmod u+x muscle3.8.31_i86darwin64
# chmod u+x PhyML-3.1_macOS-MountainLion
#
alias chimera=/Applications/Chimera.app/Contents/MacOS/chimera
alias pymol=/Applications/PyMOL.app/Contents/MacOS/MacPyMOL
alias clustalo="~/bin/clustalo/clustal-omega-1.2.3-macosx"
alias muscle="~/bin/muscle/muscle3.8.31_i86darwin64"
alias phyml="~/bin/phyml/PhyML-3.1_macOS-MountainLion"
alias jalview="java -classpath /Applications/Jalview/jalview.jar:/Applications/Jalview/lib/* jalview.bin.Jalview"
alias t_coffee="/Users/errontitus/bin/tcoffee/Version_11.00.8cbe486/bin/t_coffee"
alias mash="/Users/errontitus/bin/mash/mash-OSX64-v2.1/mash"


alias awk="/opt/local/bin/gawk"
alias cdb="cd ~/bin"
alias cdd="cd ~/Dropbox"
alias cdg="cd ~/Documents/Github"
alias cdh="cd ~"

# weblogo3

# If I move my xtal pipelien to Xia2, then maybe it's not too much work to port my scripts to zsh.
# Then I can leave tcsh behind.
# tcsh

# Activate the default python env
source activate python27default
