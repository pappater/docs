### Web Components: Comprehensive Guide

Web Components are a set of standardized APIs that allow developers to create reusable custom HTML elements, encapsulating functionality and styling to ensure they behave consistently across web applications. They enable the development of modular, maintainable, and reusable UI elements.

#### 1. **Origin of Web Components**

Web Components were first introduced by Google in 2011. The concept originated from the need to make web development more modular, maintainable, and reusable. Over the years, developers struggled with reusing components across different projects due to global style leakage, JavaScript collisions, and inconsistent rendering. Web Components aimed to solve these problems by encapsulating structure, style, and behavior within custom HTML elements.

#### 2. **Why Were Web Components Introduced?**

Web Components were introduced to address the limitations of traditional web development, where HTML, CSS, and JavaScript were scattered across the global scope, leading to:

- **Style conflicts**: Global styles affecting unintended elements.
- **Behavior conflicts**: Multiple libraries or components causing clashes.
- **Reusability issues**: Difficulty in reusing components across different projects.

#### 3. **Developers’ Usage Today**

While Web Components have been slower to gain traction due to competing solutions (like React, Angular, and Vue.js), many developers are embracing Web Components due to:

- **Native browser support**: No need for external libraries or frameworks.
- **Interoperability**: Web Components work with any JavaScript framework.
- **Encapsulation**: Components encapsulate HTML, CSS, and JavaScript.

#### 4. **Scope of Web Components in the Future**

The future of Web Components looks promising as more frameworks integrate them. Some trends suggest:

- **Cross-framework compatibility**: Web Components will continue to play a vital role in environments with mixed frameworks.
- **Standardization**: As browser support grows, Web Components may become a default choice for component development.
- **Micro Frontends**: Web Components align well with the micro frontends architecture.

#### 5. **Top Companies Using Web Components**

- **Google**: Google's Polymer Project was one of the earliest Web Components libraries.
- **Salesforce**: Uses Web Components in its Lightning Web Components.
- **IKEA**: Web Components are used in its internal tools.
- **Adobe**: Adobe Spectrum Web Components are widely adopted.

#### 6. **How Web Components Work: Technical Overview**

Web Components are built on four key technologies:

- **Custom Elements**: Define custom HTML tags and specify their behavior.
- **Shadow DOM**: Encapsulate the DOM and CSS styles so that they don’t leak into the rest of the document.
- **HTML Templates**: Define HTML fragments that are not rendered until they are cloned and inserted into the document.
- **ES Modules**: Allow importing and exporting JavaScript modules, which can be used to define Web Components.

##### 6.1 **Custom Elements**

Custom Elements allow you to define new types of DOM elements. There are two types of custom elements:

- **Autonomous custom elements**: Elements built from scratch (e.g., `<my-button>`).
- **Customized built-in elements**: Built-in elements extended with additional functionality (e.g., `<button is="my-button">`).

**Example:**

```js
class MyButton extends HTMLElement {
  constructor() {
    super();
    this.innerHTML = `<button>Click me</button>`;
  }
}
customElements.define("my-button", MyButton);
```

##### 6.2 **Shadow DOM**

The Shadow DOM provides encapsulation for Web Components. Elements inside the shadow DOM do not affect the global DOM and are isolated in their own scope.

**Example:**

```js
class MyComponent extends HTMLElement {
  constructor() {
    super();
    const shadow = this.attachShadow({ mode: "open" });
    shadow.innerHTML = `<style>p { color: red; }</style><p>Hello World</p>`;
  }
}
customElements.define("my-component", MyComponent);
```

##### 6.3 **HTML Templates**

The `<template>` element allows you to define HTML content that can be reused by cloning it into a document.

**Example:**

```html
<template id="my-template">
  <p>This is a template content!</p>
</template>
```

In JavaScript, you can access and clone the template:

```js
const template = document.getElementById("my-template");
const clone = document.importNode(template.content, true);
document.body.appendChild(clone);
```

##### 6.4 **ES Modules**

JavaScript ES Modules enable you to export and import JavaScript functionality across files, promoting modularity.

**Example:**

```js
export class MyButton extends HTMLElement {
  /*...*/
}
import { MyButton } from "./MyButton.js";
```

#### 7. **Advantages of Web Components**

- **Reusability**: Create reusable components across different projects.
- **Interoperability**: Compatible with any framework.
- **Encapsulation**: Avoid global styles or JavaScript pollution.

#### 8. **Challenges of Web Components**

- **Performance**: Initial performance cost due to Shadow DOM and custom elements.
- **Learning Curve**: Requires understanding of multiple web technologies (Custom Elements, Shadow DOM).
- **Browser Support**: Some older browsers still require polyfills.

#### 9. **Web Components vs. JavaScript Frameworks**

While Web Components can be seen as a lightweight alternative to frameworks like React or Angular, they are often used in conjunction with these frameworks. Frameworks provide more powerful state management, routing, and ecosystem tools.

#### 10. **Web Components and React Integration**

Although Web Components are framework-agnostic, integrating them into a React project involves a few steps:

- Use `ref` to attach the Web Component to a React component.
- Bind attributes and events manually because React's synthetic event system doesn't automatically pick up custom events.

**Example:**

```jsx
import React, { useRef, useEffect } from "react";

function MyComponent() {
  const myRef = useRef();

  useEffect(() => {
    myRef.current.addEventListener("customEvent", handleEvent);
    return () => {
      myRef.current.removeEventListener("customEvent", handleEvent);
    };
  }, []);

  function handleEvent(e) {
    console.log(e.detail);
  }

  return <my-button ref={myRef}></my-button>;
}

export default MyComponent;
```

#### 11. **Full Working Example**

##### HTML (index.html)

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Web Components Example</title>
  </head>
  <body>
    <my-component></my-component>

    <script src="./myComponent.js" type="module"></script>
  </body>
</html>
```

##### JavaScript (myComponent.js)

```js
class MyComponent extends HTMLElement {
  constructor() {
    super();
    const shadow = this.attachShadow({ mode: "open" });
    shadow.innerHTML = `
      <style>
        p { color: red; }
      </style>
      <p>Hello from Web Component!</p>
    `;
  }
}
customElements.define("my-component", MyComponent);
```

### Below are from MDN document ( https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_custom_elements)

````
# Using Custom Elements

One of the key features of Web Components is the ability to create custom elements. These are HTML elements whose behavior is defined by the web developer, extending the set of elements available in the browser.

This article introduces custom elements and walks through some examples.

## Types of Custom Elements

There are two types of custom elements:

- **Customized built-in elements**: Inherit from standard HTML elements such as `HTMLImageElement` or `HTMLParagraphElement`. Their implementation extends the behavior of select instances of the standard element.
  _Note_: See the `is` attribute reference for caveats on the implementation of custom built-in elements.
- **Autonomous custom elements**: Inherit from the base `HTMLElement` class. You have to implement their behavior from scratch.

## Implementing a Custom Element

A custom element is implemented as a class that extends `HTMLElement` (for autonomous elements) or the interface you want to customize (for customized built-in elements).

### Example: Minimal Custom Element (Customized `<p>`)

```js
class WordCount extends HTMLParagraphElement {
  constructor() {
    super();
  }
  // Element functionality written in here
}
```
````

### Example: Minimal Autonomous Custom Element

```js
class PopupInfo extends HTMLElement {
  constructor() {
    super();
  }
  // Element functionality written in here
}
```

In the class constructor, set up initial state, default values, and register event listeners. Avoid inspecting the element's attributes or children, or adding new attributes or children at this stage.

## Custom Element Lifecycle Callbacks

Once your custom element is registered, the browser will call certain methods of your class when interacting with your custom element. These methods are called **lifecycle callbacks**.

### Lifecycle Callbacks:

- **`connectedCallback()`**: Called each time the element is added to the document.
- **`disconnectedCallback()`**: Called each time the element is removed from the document.
- **`adoptedCallback()`**: Called each time the element is moved to a new document.
- **`attributeChangedCallback()`**: Called when attributes are changed, added, removed, or replaced.

### Example: Custom Element with Lifecycle Events

```js
class MyCustomElement extends HTMLElement {
  static observedAttributes = ["color", "size"];

  constructor() {
    super();
  }

  connectedCallback() {
    console.log("Custom element added to page.");
  }

  disconnectedCallback() {
    console.log("Custom element removed from page.");
  }

  adoptedCallback() {
    console.log("Custom element moved to new page.");
  }

  attributeChangedCallback(name, oldValue, newValue) {
    console.log(`Attribute ${name} has changed.`);
  }
}

customElements.define("my-custom-element", MyCustomElement);
```

## Registering a Custom Element

To make a custom element available, call the `define()` method of `window.customElements`.

```js
customElements.define("word-count", WordCount, { extends: "p" });
customElements.define("popup-info", PopupInfo);
```

## Using a Custom Element

### Customized Built-In Element

```html
<p is="word-count"></p>
```

### Autonomous Custom Element

```html
<popup-info>
  <!-- Content of the element -->
</popup-info>
```

## Responding to Attribute Changes

Custom elements can use HTML attributes to configure behavior. You can observe attribute changes by implementing `observedAttributes` and `attributeChangedCallback()`.

### Example: Responding to Attribute Changes

```js
class MyCustomElement extends HTMLElement {
  static observedAttributes = ["size"];

  constructor() {
    super();
  }

  attributeChangedCallback(name, oldValue, newValue) {
    console.log(
      `Attribute ${name} has changed from ${oldValue} to ${newValue}.`
    );
  }
}

customElements.define("my-custom-element", MyCustomElement);
```

### Example: Using Observed Attributes in HTML

```html
<my-custom-element size="100"></my-custom-element>
```

## Custom States and Pseudo-Class Selectors

Autonomous custom elements allow you to define states and select them using the `:state()` pseudo-class function.

### Example: Custom State Management

```js
class MyCustomElement extends HTMLElement {
  constructor() {
    super();
    this._internals = this.attachInternals();
  }

  get collapsed() {
    return this._internals.states.has("hidden");
  }

  set collapsed(flag) {
    if (flag) {
      this._internals.states.add("hidden");
    } else {
      this._internals.states.delete("hidden");
    }
  }
}

customElements.define("my-custom-element", MyCustomElement);
```

### Example: CSS for Custom States

```css
my-custom-element {
  border: dashed red;
}
my-custom-element:state(hidden) {
  border: none;
}
```

## Examples of Custom Elements

### Example: Autonomous Custom Element (`<popup-info>`)

```html
<popup-info
  img="img/alt.png"
  data-text="Your card validation code (CVC) is the last 3 or 4 numbers on the back of your card."
>
</popup-info>
```

### Example: External Stylesheet in Custom Element

```js
class PopupInfo extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    const shadow = this.attachShadow({ mode: "open" });

    const wrapper = document.createElement("span");
    wrapper.setAttribute("class", "wrapper");

    const icon = document.createElement("span");
    icon.setAttribute("class", "icon");
    icon.setAttribute("tabindex", 0);

    const info = document.createElement("span");
    info.setAttribute("class", "info");

    const text = this.getAttribute("data-text");
    info.textContent = text;

    const imgUrl = this.hasAttribute("img")
      ? this.getAttribute("img")
      : "img/default.png";
    const img = document.createElement("img");
    img.src = imgUrl;
    icon.appendChild(img);

    const linkElem = document.createElement("link");
    linkElem.setAttribute("rel", "stylesheet");
    linkElem.setAttribute("href", "style.css");

    shadow.appendChild(linkElem);
    shadow.appendChild(wrapper);
    wrapper.appendChild(icon);
    wrapper.appendChild(info);
  }
}
```

# Using Shadow DOM

An important aspect of custom elements is **encapsulation**, because a custom element, by definition, is a piece of reusable functionality that might be dropped into any web page and is expected to work. So it's important that code running in the page should not be able to accidentally break a custom element by modifying its internal implementation. **Shadow DOM** enables you to attach a DOM tree to an element and have the internals of this tree hidden from JavaScript and CSS running in the page.

This article covers the basics of using the Shadow DOM.

## High-Level View

This article assumes you are already familiar with the concept of the **DOM (Document Object Model)**—a tree-like structure of connected nodes that represents the different elements and strings of text appearing in a markup document (usually an HTML document in the case of web documents). As an example, consider the following HTML fragment:

html

<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>DOM example</title>
  </head>
  <body>
    <section>
      <img src="dinosaur.png" alt="A red Tyrannosaurus Rex." />
      <p>
        Here we will add a link to the
        <a href="https://www.mozilla.org/">Mozilla homepage</a>
      </p>
    </section>
  </body>
</html>

This fragment produces the following DOM structure (excluding whitespace-only text nodes):

- **HTML**
  - **HEAD**
    - `META` `charset="utf-8"`
    - **TITLE**
      - `#text`: DOM example
  - **BODY**
    - **SECTION**
      - `IMG` `src="dinosaur.png"` `alt="A red Tyrannosaurus Rex."`
      - **P**
        - `#text`: Here we will add a link to the
        - **A** `href="https://www.mozilla.org/"`
          - `#text`: Mozilla homepage

Shadow DOM allows hidden DOM trees to be attached to elements in the regular DOM tree—this shadow DOM tree starts with a **shadow root**, underneath which you can attach any element, in the same way as the normal DOM.

![Diagram showing the interaction of document, shadow root, and shadow host](image-url)

There are some bits of Shadow DOM terminology to be aware of:

- **Shadow host**: The regular DOM node that the shadow DOM is attached to.
- **Shadow tree**: The DOM tree inside the shadow DOM.
- **Shadow boundary**: The place where the shadow DOM ends, and the regular DOM begins.
- **Shadow root**: The root node of the shadow tree.

You can affect the nodes in the shadow DOM in exactly the same way as non-shadow nodes—for example, appending children or setting attributes, styling individual nodes using `element.style.foo`, or adding style to the entire shadow DOM tree inside a `<style>` element. The difference is that none of the code inside a shadow DOM can affect anything outside it, allowing for handy encapsulation.

Before shadow DOM was made available to web developers, browsers were already using it to encapsulate the inner structure of an element. Think, for example, of a `<video>` element with the default browser controls exposed. All you see in the DOM is the `<video>` element, but it contains a series of buttons and other controls inside its shadow DOM. The shadow DOM spec enables you to manipulate the shadow DOM of your own custom elements.

### Attribute Inheritance

The shadow tree and `<slot>` elements inherit the `dir` and `lang` attributes from their shadow host.

---

## Creating a Shadow DOM

### Imperatively with JavaScript

The following page contains two elements: a `<div>` element with an `id` of `"host"`, and a `<span>` element containing some text:

```html
<div id="host"></div>
<span>I'm not in the shadow DOM</span>
```

We're going to use the "host" element as the shadow host. We call `attachShadow()` on the host to create the shadow DOM, and can then add nodes to the shadow DOM just like we would to the main DOM. In this example, we add a single `<span>` element:

```javascript
const host = document.querySelector("#host");
const shadow = host.attachShadow({ mode: "open" });
const span = document.createElement("span");
span.textContent = "I'm in the shadow DOM";
shadow.appendChild(span);
```

The result looks like this:

![Resulting DOM tree](image-url)

### Declaratively with HTML

Creating a shadow DOM via JavaScript API might be a good option for client-side rendered applications. For other applications, a server-side rendered UI might have better performance and, therefore, a better user experience. In such cases, you can use the `<template>` element to declaratively define the shadow DOM. The key to this behavior is the enumerated `shadowrootmode` attribute, which can be set to either `open` or `closed`, the same values as the `mode` option of the `attachShadow()` method.

```html
<div id="host">
  <template shadowrootmode="open">
    <span>I'm in the shadow DOM</span>
  </template>
</div>
```

> **Note**: By default, contents of `<template>` are not displayed. In this case, because the `shadowrootmode="open"` was included, the shadow root is rendered. In supporting browsers, the visible contents within that shadow root are displayed.

After the browser parses the HTML, it replaces the `<template>` element with its content wrapped in a shadow root that's attached to the parent element, the `<div id="host">` in our example. The resulting DOM tree looks like this (there's no `<template>` element in the DOM tree):

- **DIV** `id="host"`
  - `#shadow-root`
    - **SPAN**
      - `#text`: I'm in the shadow DOM

---

## Encapsulation from JavaScript

So far, this might not look like much. But let's see what happens if code running in the page tries to access elements in the shadow DOM.

This page is just like the last one, except we've added two `<button>` elements.

```html
<div id="host"></div>
<span>I'm not in the shadow DOM</span>
<br />

<button id="upper" type="button">Uppercase span elements</button>
<button id="reload" type="button">Reload</button>
```

Clicking the "Uppercase span elements" button finds all `<span>` elements in the page and changes their text to uppercase. Clicking the "Reload" button just reloads the page, so you can try again.

```javascript
const host = document.querySelector("#host");
const shadow = host.attachShadow({ mode: "open" });
const span = document.createElement("span");
span.textContent = "I'm in the shadow DOM";
shadow.appendChild(span);

const upper = document.querySelector("button#upper");
upper.addEventListener("click", () => {
  const spans = Array.from(document.querySelectorAll("span"));
  for (const span of spans) {
    span.textContent = span.textContent.toUpperCase();
  }
});

const reload = document.querySelector("#reload");
reload.addEventListener("click", () => document.location.reload());
```

If you click "Uppercase span elements," you'll see that `document.querySelectorAll()` doesn't find the elements in our shadow DOM: they are effectively hidden from JavaScript in the page.

![Result after clicking uppercase button](image-url)

### `Element.shadowRoot` and the `mode` Option

In the example above, we pass an argument `{ mode: "open" }` to `attachShadow()`. With mode set to `"open"`, the JavaScript in the page is able to access the internals of your shadow DOM through the `shadowRoot` property of the shadow host.

In this example, as before, the HTML contains the shadow host, a `<span>` element in the main DOM tree, and two buttons:

```html
<div id="host"></div>
<span>I'm not in the shadow DOM</span>
<br />

<button id="upper" type="button">Uppercase shadow DOM span elements</button>
<button id="reload" type="button">Reload</button>
```

This time the "Uppercase" button uses `shadowRoot` to find the `<span>` elements in the DOM:

```javascript
const host = document.querySelector("#host");
const shadow = host.attachShadow({ mode: "open" });
const span = document.createElement("span");
span.textContent = "I'm in the shadow DOM";
shadow.appendChild(span);

const upper = document.querySelector("button#upper");
upper.addEventListener("click", () => {
  const spans = Array.from(host.shadowRoot.querySelectorAll("span"));
  for (const span of spans) {
    span.textContent = span.textContent.toUpperCase();
  }
});

const reload = document.querySelector("#reload");
reload.addEventListener("click", () => document.location.reload());
```

This time, the JavaScript running in the page can access the shadow DOM internals:

![Result after accessing shadow DOM](image-url)

The `{ mode: "open" }` argument gives the page a way to break the encapsulation of your shadow DOM. If you don't want to give the page this ability, pass `{ mode: "closed" }` instead, and then `shadowRoot` returns `null`.

However, you should not consider this a strong security mechanism, because there are ways it can be evaded, for example by browser extensions running in the page. It's more of an indication that the page should not access the internals of your shadow DOM tree.

---

## Encapsulation from CSS

In this version of the page, the HTML is the same as the original:

```html
<div id="host"></div>
<span>I'm not in the shadow DOM</span>
```

In the JavaScript, we create the shadow DOM:

```javascript
const host = document.querySelector("#host");
const shadow = host.attachShadow({ mode: "open" });
const span = document.createElement("span");
span.textContent = "I'm in the shadow DOM";
shadow.appendChild(span);
```

This time, we'll have some CSS targeting `<span>` elements in the page:

```css
span {
  color: blue;
  border: 1px solid black;
}
```

The page CSS does not affect nodes inside the shadow DOM:

![Result showing CSS not affecting shadow DOM elements](image-url)

---

## Applying Styles Inside the Shadow DOM

In this section, we'll look at two different ways to apply styles inside a shadow DOM tree:

1. **Programmatically**, by constructing a `CSSStyleSheet` object and attaching it to the shadow root.
2. **Declaratively**, by adding a `<style>` element in a `<template>` element's declaration.

In both cases, the styles defined in the shadow DOM tree are scoped to that tree, so just as page styles don't affect elements in the shadow DOM, shadow DOM styles don't affect elements in the rest of the page.

### Constructable Stylesheets

To style page elements in the shadow DOM with constructable stylesheets, we can:

- Create an empty `CSSStyleSheet` object.
- Set its content using `CSSStyleSheet.replace()` or `CSSStyleSheet.replaceSync()`.
- Add it to the shadow root by assigning it to `ShadowRoot.adoptedStyleSheets`.

Rules defined in the `CSSStyleSheet` will be scoped to the shadow DOM tree, as well as any other DOM trees to which we have assigned it.

Here, again, is the HTML containing our host and a `<span>`:

```html
<div id="host"></div>
<span>I'm not in the shadow DOM</span>
```

This time we will create the shadow DOM and assign a `CSSStyleSheet` object to it:

```javascript
const sheet = new CSSStyleSheet();
sheet.replaceSync("span { color: red; border: 2px dotted black; }");

const host = document.querySelector("#host");

const shadow = host.attachShadow({ mode: "open" });
shadow.adoptedStyleSheets = [sheet];

const span = document.createElement("span");
span.textContent = "I'm in the shadow DOM";
shadow.appendChild(span);
```

The styles defined in the shadow DOM tree are not applied in the rest of the page:

![Result showing styles applied inside shadow DOM](image-url)

### Adding `<style>` Elements in `<template>` Declarations

An alternative to constructing `CSSStyleSheet` objects is to include a `<style>` element inside the `<template>` element used to define a web component.

In this case, the HTML includes the `<template>` declaration:

```html
<template id="my-element">
  <style>
    span {
      color: red;
      border: 2px dotted black;
    }
  </style>
  <span>I'm in the shadow DOM</span>
</template>

<div id="host"></div>
<span>I'm not in the shadow DOM</span>
```

In the JavaScript, we will create the shadow DOM and add the content of the `<template>` to it:

```javascript
const host = document.querySelector("#host");
const shadow = host.attachShadow({ mode: "open" });
const template = document.getElementById("my-element");

shadow.appendChild(template.content);
```

Again, the styles defined in the `<template>` are applied only within the shadow DOM tree, and not in the rest of the page:

![Result showing styles applied from template](image-url)

### Choosing Between Programmatic and Declarative Options

Which of these options to use is dependent on your application and personal preference.

- **Programmatic Approach**: Creating a `CSSStyleSheet` and assigning it to the shadow root using `adoptedStyleSheets` allows you to create a single stylesheet and share it among many DOM trees. For example, a component library could create a single stylesheet and then share it among all the custom elements belonging to that library. The browser will parse that stylesheet once. Also, you can make dynamic changes to the stylesheet and have them propagate to all components that use the sheet.

- **Declarative Approach**: Attaching a `<style>` element is great if you want to be declarative, have few styles, and don't need to share styles across different components.

---

## Shadow DOM and Custom Elements

Without the encapsulation provided by shadow DOM, custom elements would be impossibly fragile. It would be too easy for a page to accidentally break a custom element's behavior or layout by running some page JavaScript or CSS. As a custom element developer, you'd never know whether the selectors applicable inside your custom element conflicted with those that applied in a page that chose to use your custom element.

Custom elements are implemented as a class which extends either the base `HTMLElement` or a built-in HTML element such as `HTMLParagraphElement`. Typically, the custom element itself is a shadow host, and the element creates multiple elements under that root to provide the internal implementation of the element.

The example below creates a `<filled-circle>` custom element that just renders a circle filled with a solid color.

```javascript
class FilledCircle extends HTMLElement {
  constructor() {
    super();
  }
  connectedCallback() {
    // Create a shadow root
    // The custom element itself is the shadow host
    const shadow = this.attachShadow({ mode: "open" });

    // Create the internal implementation
    const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
    const circle = document.createElementNS(
      "http://www.w3.org/2000/svg",
      "circle"
    );
    circle.setAttribute("cx", "50");
    circle.setAttribute("cy", "50");
    circle.setAttribute("r", "50");
    circle.setAttribute("fill", this.getAttribute("color"));
    svg.appendChild(circle);

    shadow.appendChild(svg);
  }
}

customElements.define("filled-circle", FilledCircle);
```

```html
<filled-circle color="blue"></filled-circle>
```

**Using templates and slots**

This section will guide you through utilizing the `<template>` and `<slot>` elements to create dynamic, reusable templates that can populate the shadow DOM of a web component.

### The truth about templates

When you need to reuse the same HTML structure multiple times on a web page, templates are a great solution. The `<template>` element allows you to define markup that is not rendered in the DOM but can be used later with JavaScript.

For example:

```html
<template id="custom-paragraph">
  <p>My paragraph</p>
</template>
```

To make this appear in the DOM, you would reference it in JavaScript like this:

```javascript
let template = document.getElementById("custom-paragraph");
let templateContent = template.content;
document.body.appendChild(templateContent);
```

This basic example illustrates how you can dynamically append a template to your page.

### Using templates with web components

Templates can be combined with web components for even more flexibility. Let’s define a custom web component that uses our template in its shadow DOM:

```javascript
customElements.define(
  "my-paragraph",
  class extends HTMLElement {
    constructor() {
      super();
      let template = document.getElementById("custom-paragraph");
      let templateContent = template.content;

      const shadowRoot = this.attachShadow({ mode: "open" });
      shadowRoot.appendChild(templateContent.cloneNode(true));
    }
  }
);
```

Here, we clone the template content and append it to the shadow DOM. We can also include styles in the template that will only apply within the shadow DOM:

```html
<template id="custom-paragraph">
  <style>
    p {
      color: white;
      background-color: #666;
      padding: 5px;
    }
  </style>
  <p>My paragraph</p>
</template>
```

Now, when you use `<my-paragraph>` in your HTML:

```html
<my-paragraph></my-paragraph>
```

The component will render with the custom styles encapsulated in its shadow DOM.

### Adding flexibility with slots

While this approach works, it’s limited in flexibility. You can use the `<slot>` element to make the component more dynamic. Slots act as placeholders that can be filled with any content when the component is used.

For example, you can update the template to include a slot:

```html
<p><slot name="my-text">My default text</slot></p>
```

If no content is provided for the slot, it will fall back to "My default text." To specify content for the slot, use the `slot` attribute:

```html
<my-paragraph>
  <span slot="my-text">Let's have some different text!</span>
</my-paragraph>
```

Or even more complex content:

```html
<my-paragraph>
  <ul slot="my-text">
    <li>Let's have some different text!</li>
    <li>In a list!</li>
  </ul>
</my-paragraph>
```

### A more involved example

Let’s now create a more complex web component using `<template>` and `<slot>`. The following example demonstrates a `<element-details>` component with multiple named slots:

#### Creating a template with slots

First, define a template with named slots:

```html
<template id="element-details-template">
  <style>
    /* Add some styles for the component */
  </style>
  <details>
    <summary>
      <span>
        <code class="name">
          &lt;<slot name="element-name">NEED NAME</slot>&gt;
        </code>
        <span class="desc">
          <slot name="description">NEED DESCRIPTION</slot>
        </span>
      </span>
    </summary>
    <div class="attributes">
      <h4><span>Attributes</span></h4>
      <slot name="attributes"><p>None</p></slot>
    </div>
  </details>
  <hr />
</template>
```

This template includes styles and slots for an element name, description, and attributes.

#### Creating the custom element

Next, define the `<element-details>` custom element that will use the template:

```javascript
customElements.define(
  "element-details",
  class extends HTMLElement {
    constructor() {
      super();
      const template = document.getElementById(
        "element-details-template"
      ).content;
      const shadowRoot = this.attachShadow({ mode: "open" });
      shadowRoot.appendChild(template.cloneNode(true));
    }
  }
);
```

#### Using the custom element

Finally, you can use the `<element-details>` element in your HTML:

```html
<element-details>
  <span slot="element-name">slot</span>
  <span slot="description">A placeholder inside a web component.</span>
  <dl slot="attributes">
    <dt>name</dt>
    <dd>The name of the slot.</dd>
  </dl>
</element-details>

<element-details>
  <span slot="element-name">template</span>
  <span slot="description">A mechanism for holding client-side content.</span>
</element-details>
```

In this example, the first `<element-details>` element fills all three slots (name, description, and attributes), while the second only fills the name and description, leaving the attributes slot with its default content.

### Adding custom styles

Lastly, you can style the `<dl>`, `<dt>`, and `<dd>` elements for better presentation:

```css
dl {
  margin-left: 6px;
}
dt {
  color: #217ac0;
  font-family: Consolas, "Liberation Mono", Courier;
  font-size: 110%;
  font-weight: bold;
}
dd {
  margin-left: 16px;
}
```
