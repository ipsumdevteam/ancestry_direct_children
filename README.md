# Ancestry Direct Children
---

## Installation

```
gem install ancestry_direct_children
bundle install
```
## Add column to your models

+ Add a migration to the desired model(s)

```
rails g migration add_direct_children_count_to_[table] direct_children_count:integer
```

> If your use case doesn't require INT you may use SMALLINT or equivalent

+ Migrate your database:

Rails 5:

```
bin/rails db:migrate
```

Rails 4 or less:

```
rake db:migrate
```
