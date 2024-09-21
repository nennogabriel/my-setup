# Remember to run as root
# sudo sh ./us-int-keyboard.sh

# Install cedilla
sudo echo "GTK_IM_MODULE=cedilla" >> /etc/environment
sudo echo "QT_IM_MODULE=cedilla" >> /etc/environment
