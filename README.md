Visible Password Widget
===

Get rid of that 'Confirm password' field in your forms. Instead, use a password field that the user can reveal.

Inspired in Windows8 Reveal Password button.

[Watch it in action!](http://jsfiddle.net/2yrbcng0/)

# Usage

1. Create a wrapper element (I use a `<span>` in the examples).
2. Use `new VisibilePasswordInput( { element: myElement /* Created above */ } )`.
3. This will create a `<input:password>` and a `<i>` element inside your wrapper.

Alternatively, mark your wrapper with the `visible-password` class, and it will be initialized on load.
 
# Customize

You can change the icon by modifying / overriding the background image of the `.widget` selector in 
`src/css/visible_password.scss` (`.visible-password .widget` selector).

# Build

1. Install dependencies with `npm install`.
2. Run building script with `npm run build`.
3. Watch the `lib/` directory for your new files.