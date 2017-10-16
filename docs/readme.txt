# Install RVM
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Warning about GPG key
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# Re-launch download
\curl -sSL https://get.rvm.io | bash -s stable

# Edit bashrc (+ restart shell)
echo "source \$HOME/.rvm/scripts/rvm" >> ~/.bashrc

# List all rubies currently installed
rvm list

# List all rubies available
rvm list known

# Install gem
gem install bundler

# Install Rails
gem install rails (5min)

# Create new project
cd apps && rails new tasks

# Create scaffold
rails generate scaffold task name:string description:text picture:string

# Migrate
bundle exec rake db:migrate

(rails s)

# Browse to URL http://localhost:3000/tasks

# Open app/views/layouts/application.html.erb in your text editor and above the line

<%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
add

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.css">
and replace

<%= yield %>
with

<div class="container">
  <%= yield %>
</div>
Let’s also add a navigation bar and footer to the layout. In the same file, under <body> add

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">The Idea app</a>
    </div>
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/ideas">Ideas</a></li>
      </ul>
    </div>
  </div>
</nav>
and before </body> add

<footer>
  <div class="container">
    Rails Girls 2016
  </div>
</footer>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.js"></script>
Now let’s also change the styling of the ideas table. Open app/assets/stylesheets/application.css and at the bottom add

body { padding-top: 100px; }
footer { margin-top: 100px; }
table, td, th { vertical-align: middle; border: none; }
th { border-bottom: 1px solid #DDD; }


# Image upload
Open Gemfile in the project directory using your text editor and under the line

gem 'sqlite3'
add

gem 'carrierwave'
Coach: Explain what libraries are and why they are useful. Describe what open source software is.

Hit Ctrl+C in the terminal to quit the server.

In the terminal run:

bundle
Now we can generate the code for handling uploads. In the terminal run:

rails generate uploader Picture
Please start the rails server now.

Note: Some people might be using a second terminal to run the rails server continuously. If so you need to restart the Rails server process now. This is needed for the app to load the added library.

Open app/models/idea.rb and under the line

class Idea < ApplicationRecord
add

mount_uploader :picture, PictureUploader
Open app/views/ideas/_form.html.erb and change

<%= f.text_field :picture %>
to

<%= f.file_field :picture %>
Sometimes, you might get an TypeError: can’t cast ActionDispatch::Http::UploadedFile to string.

If this happens, in file app/views/ideas/_form.html.erb change the line

<%= form_for(idea) do |f| %>
to

<%= form_for(idea, html: {multipart: true}) do |f| %>
In your browser, add new idea with a picture. When you upload a picture it doesn’t look nice because it only shows a path to the file, so let’s fix that.

Open app/views/ideas/show.html.erb and change

<%= @idea.picture %>
to

<%= image_tag(@idea.picture_url, width: 600) if @idea.picture.present? %>
Now refresh your browser to see what changed.

Coach: Talk a little about HTML.

5.Finetune the routes

Open http://localhost:3000 (or your preview url, if you are using a cloud service). It still shows the “Welcome aboard” page. Let’s make it redirect to the ideas page.

Open config/routes.rb and after the first line add

root to: redirect('/ideas')
Test the change by opening the root path (that is, http://localhost:3000/ or your preview url) in your browser.

Coach: Talk about routes, and include details on the order of routes and their relation to static files.
