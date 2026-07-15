# Book Match

Book Match is a Rails application for discovering readers with overlapping book interests.

Users can browse books, favorite or unfavorite them, write reviews with ratings, and view other users. When two users have shared favorite books, the application marks them as a match.

Administrators can manage the book catalog and user accounts.

## Features

- Email/password authentication
- GitHub OAuth sign-in
- Book catalog browsing
- Favorite and unfavorite books
- Reviews and star ratings
- Reader matching based on shared favorites
- Administrative book management
- Administrative user management

## Local Development

### Tested Environment

This restoration has been tested with:

- macOS 14.7 on Apple Silicon
- Ruby 3.3.0 through `rbenv`
- Rails 6.0.6.1
- Bundler 4.0.16
- MySQL installed through Homebrew
- Node.js 23.11.0
- Yarn Classic 1.x
- Webpack 4.47.0

The application is an older Rails 6 project that has been updated enough to run on a modern Ruby and Apple Silicon environment.

### 1. Clone the Repository

```bash
git clone https://github.com/abogailo/book_match_cms.git
cd book_match_cms
```

### 2. Select the Project Ruby Version

Install Ruby 3.3.0 with `rbenv` if it is not already installed:

```bash
rbenv install 3.3.0
```

Set Ruby 3.3.0 for this repository:

```bash
rbenv local 3.3.0
```

Verify that the project is using the `rbenv` Ruby rather than the macOS system Ruby:

```bash
ruby -v
which ruby
which gem
```

`which ruby` should point to:

```text
~/.rbenv/shims/ruby
```

If a new terminal falls back to `/usr/bin/ruby`, initialize `rbenv` for that shell:

```bash
eval "$(rbenv init - zsh)"
```

For Bash:

```bash
eval "$(rbenv init - bash)"
```

### 3. Install Ruby Dependencies

Install the Bundler version recorded in `Gemfile.lock`:

```bash
gem install bundler -v 4.0.16 --no-document
rbenv rehash
```

Install the gems:

```bash
bundle install
```

Do not use `sudo gem install`. Gems should be installed inside the project-selected `rbenv` Ruby.

### 4. Install JavaScript Dependencies

The application uses Webpacker 4 and Yarn Classic.

```bash
yarn install
```

Compile the JavaScript assets:

```bash
./bin/webpack --progress
```

A successful build prints the generated application bundle and `manifest.json`.

### 5. Start MySQL

Start the local MySQL service:

```bash
brew services start mysql
```

Verify that it is running:

```bash
mysqladmin ping
```

Expected output:

```text
mysqld is alive
```

### 6. Create the Local MySQL User

The current development configuration expects:

```text
username: new_user
password: password
```

Open MySQL as the local root user:

```bash
mysql -u root
```

Then run:

```sql
CREATE USER IF NOT EXISTS 'new_user'@'localhost'
IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES
ON bookstore_cms_development.*
TO 'new_user'@'localhost';

GRANT ALL PRIVILEGES
ON bookstore_cms_test.*
TO 'new_user'@'localhost';

FLUSH PRIVILEGES;
EXIT;
```

These credentials are only intended for local development. A future cleanup should move database credentials into environment variables.

### 7. Create and Migrate the Databases

```bash
bundle exec rails db:create
bundle exec rails db:migrate
```

### 8. Start the Rails Server

```bash
bundle exec rails server
```

Open:

```text
http://localhost:3000
```

Use `http`, not `https`, for the local development server.

## Creating an Administrator

Create a user through the Sign Up page.

In a second terminal, enter the repository and start the Rails console:

```bash
cd ~/book_match_cms
bundle exec rails console
```

Promote the user by name:

```ruby
user = User.find_by!(name: "your_name")
user.update!(admin: true)
user.reload.admin
```

The final command should return:

```ruby
true
```

Exit the console:

```ruby
exit
```

Refresh the browser. The administrative book-management links should now be visible.

## Testing the Matching Feature

1. Create two separate users.
2. Sign in as each user in separate browser sessions.
3. Favorite the same book with both users.
4. Open **All Users**.
5. The application should display the users as a match because they share a favorite book.

## Stopping the Application

Stop the Rails server in its terminal:

```text
Control + C
```

Stop MySQL when it is no longer needed:

```bash
brew services stop mysql
```

Stop the Rails Spring preloader:

```bash
bin/spring stop
```

## Troubleshooting

### The terminal uses the macOS system Ruby

Symptom:

```text
/Library/Ruby/Gems/2.6.0
```

or:

```text
/usr/bin/ruby
```

Fix:

```bash
eval "$(rbenv init - zsh)"
cd ~/book_match_cms
rbenv local 3.3.0
```

Then verify:

```bash
which ruby
ruby -v
```

### `ActiveSupport::LoggerThreadSafeLevel::Logger` error

The restoration requires:

```ruby
require "logger"
```

at the beginning of `config/boot.rb`, along with the compatible `concurrent-ruby` version recorded in the bundle.

### `Psych::AliasesNotEnabled` error

The project uses YAML aliases in Rails configuration files. The compatible Psych version is recorded in the bundle.

### Rails reports `Compilation failed:` without details

Run Webpack directly:

```bash
./bin/webpack --progress
```

If the command lists emitted assets and creates `public/packs/manifest.json`, the asset build succeeded.

### MySQL socket connection fails

Start MySQL:

```bash
brew services start mysql
```

Then verify:

```bash
mysqladmin ping
```

## Project Status

The original application has been successfully restored locally on a modern Apple Silicon Mac.

Verified functionality includes:

- local account creation and login
- administrative book creation
- book editing and deletion controls
- favorites
- reviews and ratings
- user matching through shared favorite books
- MySQL persistence
- Webpacker asset compilation