# download mpi and anaconda
wget https://www.open-mpi.org/software/ompi/v1.10/downloads/openmpi-1.10.3.tar.gz
wget https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh

# run anaconda installation script
sudo bash Anaconda3-4.3.1-Linux-x86_64.sh -b -p /packages/anaconda3

# install mpi
tar -xvf openmpi-1.10.3.tar.gz
cd openmpi-1.10.3
./configure --prefix="/software/openmpi/1.10.3"
sudo make && sudo make install

# cleanup
cd ..
rm openmpi-1.10.3.tar.gz
rm -rf openmpi-1.10.3
