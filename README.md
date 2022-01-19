# Log Parser

Log Parser Challenge

## Install RVM and Ruby

### **Install GPG keys**

gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

### **Basic stable RVM Install**

\curl -sSL https://get.rvm.io | bash -s stable

### **Install Ruby**

rvm install ruby-3.1.0

rvm use 3.1.0 --default

### **Check your ruby installation**

which ruby

### **Install Bundler to manage your gems**

gem install bundler

### **Install Rspec**

gem install rspec

## **Run your application**

ruby main.rb

## **Run Rspec tests**

rspec ./spec/read_first_line_spec.rb
