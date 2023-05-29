# Base image
FROM ruby:3.1.3

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y nodejs postgresql-client && \
    gem install bundler

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install project dependencies
RUN bundle install --jobs 4 --retry 3

# Copy application code
COPY . .

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
