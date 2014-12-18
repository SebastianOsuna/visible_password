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

```html
<span id="myPassword"></span>
```
```javascript
var options = {
                  element: document.getElementById('myPassword'),
                  input: {
                      class: "class1 class2",
                      attrs: {
                          name: 'something',
                          placeholder: 'Input goes here',
                          'data-anything': 'Some value'
                      }
                  },
                  widget: {
                      class: ["ab", "cd"]
                  }
              };
new VisiblePasswordInput(options);
```
 
# Customize

The `VisiblePasswordInput` constructor accepts an object with the following options:

Option | Description
--- | ---
element | *DOMObject* - Input wrapper.
input | *object* - Input element options.
input.class | *Array \| string* - Class or list of classes to be applied to the `<input>` element.
input.attrs | *object* - `<input>`'s attributes. Every property of this object will be set as an HTML attribute of the `<input>`.
widget | *object* - Widget element options.
widget.class | *Array \| string* - Class or list of classes to be applied to the `<i.widget>` element.

You can change the icon by modifying / overriding the background image of the `.widget` selector in 
`src/css/visible_password.scss` (`.visible-password .widget` selector).

# Build

1. Install dependencies with `npm install`.
2. Run building script with `npm run build`.
3. Watch the `lib/` directory for your new files.