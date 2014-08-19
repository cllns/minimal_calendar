Minimal Calendar
===

Minimal Calendar is the Rails application behind
[bostonreadings.com](http://bostonreadings.com), a list of upcoming fiction, poetry
(and more!) readings in the Greater Boston area.

The site is essentially one page, for most users.
For admin users, there is an additional page for editing events.

Each listing is made up of a:
- Title
- Subtitle
- Location
- Start time
- URL
- End time (currently not used)

The first four fields are displayed all wrapped in a link to the URL.
The listings are shown in chronological order, with all events in the past not
being shown at all.


Development
---
As of August 2014, Minimal Calendar is under active development.

Please check out the [todo file](todo.md).

Minimal Calendar is primarily a "portfolio project". That is, I am using it to
show my web development skills.



Getting Started
---
First

`git clone https://github.com/cllns/minimal_calendar.git`

and

`cd minimal_calendar`

then edit the configuration file

`$EDITOR config/application.rb`

and change the values for:

- `config.site_name`
- `config.meta_description`
- `config.meta_keywords`

then edit the secrets

`$EDITOR config/secrets.yaml`

and **change the very last line** to be your desired `username:password` rather
than the default (annoyingly verbose, by intention) `changeme:MoreImportantlyChangeThisPassword`.

Please note that this password will be:

1. Stored in your code in plaintext forever (so be careful about sharing it!)
2. Transmitted insecurely, since HTTPS is **not** set up

so it is wise to choose a unique password (perhaps a silly one?). Just make sure
it's long and complex.

Then we need to create the database

`rake db:create:all`

and create the database tables

`rake db:migrate`

and load them up with some sample data (optional)

`rake db:seed`

then run your app!

`rails server`

You can view the site at [localhost:3000](localhost:3000) and login at [localhost:3000/login](localhost:3000/login)

from there, things should be self-explanatory!
