

# Add a script to be executed every time the container starts.COPY entrypoint.sh /usr/bin/
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
#Expose 3000

# Start the main process. 
# Keep reading to see why we commented this line out! 
# CMD ["rails", "server", "-b", "0.0.0.0"]
