Back end
===

Short term
- --
- Save/add locations from a select box
- Pricing info for events (assume free, but have some UI for paid events)
- add static "About" page (perhaps using thoughtbot's high_voltage)


Long term
---
- add real auth
- Tags for genres/types of readings
- staging environment (likely on the same server as production)
- use capistrano for deploying
- add support for pulling from RSS feeds
- get rid of choosing the year, figure out a way to guess it (assume this year, or next year if applicable)
- convert to rails engine?
- add location management (perhaps with a URL, so it can be guessed)
- add log-out
- add support for arbitrary fields (rather than just title/subtitle/location)


Front end
===
Short term
---
- refactor so the CSS classes are not "left" and "center" but "date" and "listings"(?)
- Move Add event form to top of page (and the ability to hide/show it with JS)
- change/remove borders from add event form
- Figure out a better way to select the day of the month (and set default to nothing so it MUST be manually selected)
- Make date select much smaller
- specify tab order so time is not in between location and URL
- Better handle super long titles
- in "New Event Added", include info about event

Long term
---
- Re-design the HTML/CSS
- Fix view for event index to use Time/DateTime instead of Date (timezones!)
