DOWNLOAD_DIR='/tmp'
HOMEDIR='/root'
OPTDIR='/opt'

cd $DOWNLOAD_DIR

# Download and extract gcc arm toolchain
wget https://launchpad.net/gcc-arm-embedded/4.7/4.7-2013-q3-update/+download/gcc-arm-none-eabi-4_7-2013q3-20130916-linux.tar.bz2
tar xjf gcc-arm-none-eabi-4_7-2013q3-20130916-linux.tar.bz2 -C $OPTDIR

## Add toolachain to PATH
echo 'export PATH=/root/gcc-arm-none-eabi-4_7-2013q3/bin:$PATH' >> $HOMEDIR/.bashrc
source $HOMEDIR/.bashrc

# Download and compile elftosb tool
wget http://repository.timesys.com/buildsources/e/elftosb/elftosb-10.12.01/elftosb-10.12.01.tar.gz
tar xvzf elftosb-10.12.01.tar.gz -C $OPTDIR
cd $OPTDIR/elftosb-10.12.01 && make
mv bld/linux/elftosb bld/linux/elftosb2
chmod a+x bld/linux/elftosb2
ln -s $OPTDIR/elftosb-10.12.01/bld/linux/elftosb2 /usr/sbin

# Download imx-bootlets
git clone https://github.com/RobertCNelson/imx-bootlets.git $HOMEDIR/imx-bootlets

# Download linux-fslc source
git clone https://github.com/Freescale/linux-fslc.git $HOMEDIR/linux-fslc
