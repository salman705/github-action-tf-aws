#!/bin/bash

# Install prerequisites
sudo apt-get update
sudo apt-get install -y unzip openjdk-11-jdk

# Download and install Nexus
wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -zxvf latest-unix.tar.gz -C /opt
sudo mv /opt/nexus-3.* /opt/nexus

# Configure Nexus
sudo sed -i 's|#run_as_user="nexus"|run_as_user="nexus"|' /opt/nexus/bin/nexus.rc

# Start Nexus
sudo /opt/nexus/bin/nexus start
