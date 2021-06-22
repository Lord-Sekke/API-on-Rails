FROM ruby:2.6.3


# Set the working directory to /myapp
RUN cd myapp/API-on-Rails &&\
    gem install bundler &&\
    gem update bundler &&\
    gem update mimemagic &&\
    bundle install
    
# Add a script to be executed every time the container starts.COPY entrypoint.sh /usr/bin/

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

#Expose 3000

# Start the main process. 
# Keep reading to see why we commented this line out! 
# CMD ["rails", "server", "-b", "0.0.0.0"]
