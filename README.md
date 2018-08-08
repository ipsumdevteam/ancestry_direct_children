# Ancestry Direct Children
---

## Installation

+ Add the gem to your `Gemfile`

```
gem 'ancestry_direct_children'
```

+ Install the dependencies

```
bundle install
```

## Add column to your models

+ Add a migration to the desired model(s)

```
rails g migration add_direct_children_count_to[table] direct_children_count:integer
```

+ Migrate your database:

Rails 5:

```
bin/rails db:migrate
```

Rails 4 or less:

```
rake db:migrate
```
