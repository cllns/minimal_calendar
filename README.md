Minimal Calendar
===

Minimal Calendar is the Rails application behind
[bostonreadings.com](http://bostonreadings.com),
a list of upcoming fiction, poetry, nonfiction (and more!)
readings in the Greater Boston area.


The site is one page for typical users, which lists all the upcoming events.

For admin users, there is an additional page to edit the events. (Adding new
events is done via slight UI change on the main page.)

Each listing is made up of a:
- Title
- Subtitle (*optional*)
- Location
- Start time
- URL
- End time (currently not used)

The first four fields are displayed all wrapped in a link to the URL.
The listings are shown in chronological order, with all events in the past not
being shown at all.


Development
---
As of September 2014, Minimal Calendar is under active development.

Please check out the [todo file](todo.md).

Minimal Calendar is primarily a "portfolio project".


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

then copy secrets.yml file and change the production password

```
cp config/secrets-example.yml config/secrets.yml
$EDITOR config/secrets.yml
```

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


Contributing
---
Please open an issue if you have any trouble at all. (I mean it!)
