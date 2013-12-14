# Building a Webapp with Elm
## *case study: local-liquidator.com*

## Motivation
This project is the primary focus of a Software Engineering class project.  The assignment:

* form a software company
* find a customer and deliver a product
* if the product is web based (ours is), it must utilize a database and not only display static content

## Project Description
The team spends 60% of its effort on learning/exploration and 40% delivering a polished final product.
The product features include:

* textbook resale (buy and sell used textbooks)
* user pool limited to students and staff at our school
* distance-limited to 1000 ft. (304.8 m)

## Team
Four team members:

* 3 electrical engineering majors, 1 software engineering major
* no previous database experience
* common experience in Java, C/C++
* two of us had some previous JavaScript and HTML experience

## Implementation - the Whole Application

* front-end: Elm, Google Maps API, Google Books API
* back-end: MySQL, PHP on Godaddy hosting
* authentication: our school’s Joomla/PHP scripts
* location: browser’s geolocation API

## Implementation - the Elm Parts
This section details my experience as the primary front-end designer and member of the group who used Elm the most.  My degree is in Electrical Engineering, so I had some formal training in Java and C++, but for fun I also was teaching myself a bit of web development.

### Getting Started
Haskell platform, the cabal system, and installing Elm were all new to me.  I had some installation issues related to my chosen development platform (Samsung ARM Chromebook) which were resolved as follows:

* put the Chromebook in developer mode
* install crouton (Ubuntu 12.10, command line tools only)
* follow Elm install instructions
* develop in Vim, start elm-server from Ubuntu, then switch to a Chrome window and navigate to localhost:8000 to view compiled pages

I did not find a good FTP client for Chrome OS so I used net2ftp.com to upload pages to our host (although it still seems scary to use an untrusted, unencrypted website for this purpose).
I spent a lot of time trying out ideas using the online tools elm-lang.org/try and share-elm.com and asked a lot of questions on the Elm mailing list.

## What Worked Well

### Workflow
My former method of web development was something like this:

1. think about what I want to do
2. google it
3. build it -> some other feature breaks because of it
4. GOTO 2

With Elm, the workflow is more like this:

1. think about what I want to do
2. search Elm docs to see if there’s already a library for it
3. build it
4. compile errors -> learn more Elm -> GOTO 1
5. runtime errors -> report bug -> GOTO 1
6. it Just Works -> commence dancing

My outcome per unit time was about 0.85a, 0.01b, 0.14c when I was starting out.  Toward the end of the semester it was more like 0.25a, 0.01b, and 0.74c which felt much better than the learning curve with C, C++, or Java did.

### Input Validation
This part was fun.  The whole application hinged on user-entered ISBN numbers for the textbooks, so I wrote an input validation function that ensured anything they entered here would be in ISBN format (9 digits plus an ‘x’ at the end, or 10 digits, or 13 digits).  I also wrote functions for ensuring that price inputs were floating-point format, and that expire times were within certain bounds.

### Graphics
Elm makes it really easy to position graphical elements on the screen, detect screen size/aspect ratios, and respond to different devices in a coherent way.  I found I could create Bootstrap-like responsive layouts with almost zero effort.  It was a real moment of enlightenment when I realized I could reason about layout with one language instead of having to use both JavaScript and CSS to accomplish the same task.
Colors, gradients, and text sizing was also really pleasant, and I used the built-in color aliases extensively because they looked nice.

### Project Organization
Elm’s module system made this interesting.  I would start with a quickly-written, messy glob of code, then refactor and abstract similar groups of ideas into modules.  In the end I had 7 modules with about 40 lines of code per module.  Most of my functions took 1 or 2 arguments, but I did have one giant AJAX-string-making function that took 12.
Elm’s extensible records took some getting used to for me, and I’m still not sure I really grok them, but they did come in handy for gathering data from disparate modules.

### Integration With HTML
The fact that Elm can be embedded in a `<div>` made it easier to integrate my work with my group members’ work.  I made a header module with the “welcome username” and navigation buttons, and that got reused on all our site’s pages.  Then I made separate modules for the different sections.  It was very easy to unit-test modules since each one had its own main function and could be viewed completely on its own.

## Hacks

### Front-Back Communication
We started with no idea how to communicate between Elm and the database, and ended up using AJAX for everything.  Elm makes an AJAX request to a PHP script, which returns a string or a JSON-encoded string of data.

### Records, JSON, and AJAX
We started with no idea how to communicate between Elm and the database, and ended up using AJAX for everything.  Elm makes an AJAX request to a PHP script, which returns a string or a JSON-encoded string of data.

### Records, JSON, and AJAX
Moving large quantities of information through AJAX calls was very challenging for me.  I went through several implementations, but in the end this was my approach:

* gather validated user inputs (signals) into an Elm record
* make an Http.request using the values from this record
* turn the returned (JSON) data into an Elm record

The thing that made this difficult was that everything in this function is a signal.  I am not sure if it would be possible to refactor it as a pure function.

## Bugs/Unresolved

### Buttons Which Are Also Links
It was easy to create custom buttons for buy and sell, and to send AJAX based on which one was clicked.  But it turned out difficult to make this button also be a link.  Clicking the button would result in the link being followed by the browser before the AJAX request was sent.  In an imperative style this would easily be resolved by placing the AJAX request before the redirect, but I could not figure out how to do this in a functional style.  I tried to reproduce the result with a simpler problem but found I could not!  Still not sure what the problem is here.

### Links and AJAX-containing Elements Not Getting Along
My header module has a large text link to the homepage (“local-liquidator”) and an element displaying a “welcome [username]” or “welcome guest” message (which makes an AJAX request to get the username).  Sometimes, the header is not turned into a link.  It never has this problem if the AJAX request fails (e.g. when I test on my local machine which does not have the php scripts loaded), and has the problem some of the time when the AJAX request succeeds.  For example, the My Ads page seems to always display the header link, but the other pages do not.

## Summary
I had a lot of fun learning Elm and will keep using it for web development.
