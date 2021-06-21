
# Use an official Ruby runtime as a parent image
FROM ruby:2.6.3
RUN apt-get update && apt-get install -y nodejs
# Set the working directory to /myapp
RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile

RUN apt-get install git
RUN gem install bundler
RUN gem update bundler
RUN gem update mimemagic
RUN bundle install

# Copy the current directory contents into the container at /myapp
RUN git clone https://github.com/axell-brendow/rails-market-place-api.git

# Add a script to be executed every time the container starts.COPY entrypoint.sh /usr/bin/
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
#Expose 3000

# Start the main process. 
# Keep reading to see why we commented this line out! 
# CMD ["rails", "server", "-b", "0.0.0.0"]
