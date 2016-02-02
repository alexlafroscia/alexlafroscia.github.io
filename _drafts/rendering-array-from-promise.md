---
title: Rendering an Array from a Promise
layout: post
---

Something that I often see in Ember applications is what I call the "property and observer" pattern, where a property and observer are used together to achieve the effect of a computed property.  While this created more verbose and less readable code than a computed property would, it does solve a problem caused when trying to resolve an array from a Promise and render that in a template.  For example, take a look at the following controller:

```javascript
// Controller
import Ember from 'ember';

const { Controller, computed } = Ember;

export default Controller.extend({
  myArray: computed('myObservedArray', function() {
    const array = this.get(myObservedArray);
    return new RSVP.Promise(function(res) {
      // Do something with the observed array
      ...
      res(mutatedArray);
    });
  })
});
```
```html
<!-- Corresponding template -->
<ul>
  {{#each myArray as |item|}}
    <li>{{item}}</li>
  {{/each}}
</ul>
```

While it would make sense for the above code to work, it doesn't; Ember complains that the Promise cannot be used with the `{{#each}}` helper and the code fails.  This is what gives rise to the "property and observer" pair, because the following controller _does_ work with the template above.

```javascript
import Ember from 'ember';

const { Controller, observer } = Ember;

export default Controller.extend({
  myArray: null,
  myArrayObserver: observer('myObservedArray', function() {
    const array = this.get('myObservedArray';
    new RSVP.Promise(function(resolved) {
      // Do something with the observed property
      resolve(mutatedArray);
    }).then((mutatedArray) => {
      this.set('myArray', mutatedArray);
    });
  })
});
```

In the above code, you get the desired effect; the array stays empty until the promise resolves, and once the `array` has resolved the controller's property is updated and the contents can be iterated over in the template.

While this works, the code ends up being more complicated than necessary.  To solve the problem, you can use the `PromiseArray` class that is built into Ember Data.  It is able to function as both a Promise and an array, allowing the template to display the contents once the Promise is resolved.  The code from above can be simplified to the following by using the `PromiseArray` class:

```javascript
import Ember from 'ember';
import DS from 'ember-data';

const { Controller, computed } = Ember;
const { PromiseArray } = DS;

export default Controller.extend({
  myArray: computed('myOtherProperty', function() {
    const prop = this.get('myOtherProperty');
    const promise = new RSVP.Promise(function(res) {
      // Do something with the observed property
      res(array);
    });
    return PromiseArray.create({ promise });
  })
});
```
