# Fundamentals

### 1. **What is JSX in React?**

**Official Definition (React Docs):**  
 "JSX is a syntax extension to JavaScript. It is recommended to use JSX with React to describe what the UI should look like. JSX may remind you of a template language, but it comes with the full power of JavaScript."  
 [Source: React Docs on JSX](https://react.dev/reference/react)

**Concept Explanation:**  
 JSX stands for JavaScript XML. It allows you to write HTML-like syntax within JavaScript, making it easier to describe the structure of the UI in a way that is familiar to web developers. JSX compiles to `React.createElement()` calls behind the scenes, which creates virtual DOM elements.

**Example:**

```jsx
function Greeting() {
  return <h1>Hello, world!</h1>;
}
```

The above JSX gets compiled into:

```javascript
function Greeting() {
  return React.createElement("h1", null, "Hello, world!");
}
```

JSX allows you to mix JavaScript logic and HTML-like structures seamlessly, making it easier to reason about your UI structure and behavior.

---

### 2. **What are Components in React?**

**Official Definition (React Docs):**  
 "Components let you split the UI into independent, reusable pieces, and think about each piece in isolation. Conceptually, components are like JavaScript functions. They accept arbitrary inputs (called 'props') and return React elements describing what should appear on the screen."  
 [Source: React Docs on Components](https://react.dev/learn/your-first-component)

**Concept Explanation:**  
 React applications are made up of components, which can be thought of as reusable building blocks. A component can be either a **function** or a **class**, and it returns a piece of the UI (React elements) that can be rendered. Components also help you break down the UI into smaller, manageable pieces, which can then be composed together to create complex UIs.

**Example (Functional Component):**

```jsx
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}

// Usage
<Welcome name="Alice" />;
```

Components allow you to build dynamic UIs by passing data (props) into them and rendering based on those props.

---

### 3. **What are Props in React?**

**Official Definition (React Docs):**  
 "Props are arguments passed into React components. Props are passed to components via HTML attributes."  
 [Source: React Docs on Props](https://react.dev/learn/passing-props-to-a-component)

**Concept Explanation:**  
 Props (short for "properties") are read-only inputs to components. They allow you to pass data from a parent component to a child component. Props are immutable within the child component, meaning the child cannot modify the prop values it receives. This ensures the flow of data is one-way, making the application easier to manage.

**Example:**

```jsx
function Greeting(props) {
  return <h1>Hello, {props.name}</h1>;
}

// Parent component passing props
<Greeting name="John" />;
```

In this example, the `Greeting` component receives the `name` prop and uses it to display a message. The parent component controls the value of `name`.

---

### 4. **What is State in React?**

**Official Definition (React Docs):**  
 "State is similar to props, but it is private and fully controlled by the component. State is used to store information about the component’s current situation."  
 [Source: React Docs on State](https://react.dev/learn/state-a-components-memory)

**Concept Explanation:**  
 State allows React components to store and manage local data that can change over time. Unlike props, which are passed in by the parent component, state is managed within the component itself. State can be updated using `setState` (for class components) or using the `useState` hook (for functional components). When state changes, the component re-renders with the updated data.

**Example (Functional Component with `useState`):**

```jsx
import React, { useState } from "react";

function Counter() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>Click me</button>
    </div>
  );
}
```

In this example, the `Counter` component has local state (`count`). Every time the button is clicked, the state is updated, and the component re-renders with the new count.

---

### 5. **What is the Virtual DOM in React?**

**Official Definition (React Docs):**  
 "React keeps a lightweight representation of the real DOM in memory, called the virtual DOM. When the state of an object changes, React updates only that object in the real DOM."  
 [Source: React Docs on Reconciliation](https://react.dev/learn/render-and-commit)

**Concept Explanation:**  
 The virtual DOM is a concept where React creates a lightweight copy of the actual DOM. When a component’s state or props change, React updates the virtual DOM first. It then compares the virtual DOM to the real DOM (a process called **reconciliation**) and updates only the parts of the real DOM that have changed, improving performance by avoiding full page re-renders.

**Example (Behind the Scenes):**

Imagine updating a single list item in a UI with 100 items. Instead of re-rendering all 100 items, React updates only the item that changed by comparing the virtual DOM with the real DOM.

---

### 6. **What are Lifecycle Methods in React (Class Components)?**

**Official Definition (React Docs):**  
 "Each component in React has a lifecycle which you can monitor and manipulate during its three main phases: mounting, updating, and unmounting."  
 [Source: React Docs on Lifecycle](https://react.dev/reference/react/Component)

**Concept Explanation:**  
 Lifecycle methods are available only in class components and allow you to hook into different phases of a component's life: when it mounts (is added to the DOM), updates (re-renders), or unmounts (is removed from the DOM). These methods let you perform tasks like fetching data, cleaning up resources, or managing timers.

**Example (Lifecycle Methods):**

```jsx
class MyComponent extends React.Component {
  componentDidMount() {
    // Runs after the component is added to the DOM
    console.log("Component mounted!");
  }

  componentDidUpdate(prevProps, prevState) {
    // Runs after the component is re-rendered
    console.log("Component updated!");
  }

  componentWillUnmount() {
    // Runs just before the component is removed from the DOM
    console.log("Component will unmount!");
  }

  render() {
    return <h1>Hello, world!</h1>;
  }
}
```

These methods help manage the behavior of a component at different stages of its lifecycle.

---

### 7. **What is the `useEffect` Hook in React?**

**Official Definition (React Docs):**  
 "`useEffect` lets you run side effects in your component. Some examples of side effects are: fetching data, directly updating the DOM, and timers."  
 [Source: React Docs on `useEffect`](https://react.dev/reference/react/useEffect)

**Concept Explanation:**  
 The `useEffect` hook allows you to run side effects in functional components. Side effects can include data fetching, subscriptions, or manually updating the DOM. By default, `useEffect` runs after every render, but you can control when it runs by passing a dependency array (which tells React to only re-run the effect when the dependencies change).

**Example (Data Fetching):**

```jsx
import React, { useState, useEffect } from "react";

function DataFetcher() {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch("https://api.example.com/data")
      .then((response) => response.json())
      .then((data) => setData(data));
  }, []); // Empty array means the effect runs once when the component mounts

  return <div>{data ? JSON.stringify(data) : "Loading..."}</div>;
}
```

In this example, `useEffect` fetches data when the component first mounts and updates the component’s state once the data is received.

---

### 8. **What is `useState` in React?**

**Official Definition (React Docs):**  
 "`useState` is a Hook that lets you add state to function components. It returns an array with two values: the current state and a function that updates it."  
 [Source: React Docs on `useState`](https://react.dev/reference/react/useState)

**Concept Explanation:**  
 The `useState` hook allows functional components to have local state. It returns two things: the current state value and a function to update that state. State can be initialized with a default value and is preserved between renders.

**Example (Counter):**

```jsx
import React, { useState } from "react";

function Counter() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>Click me</button>
    </div>
  );
}
```

Here, the `useState` hook is used to store the count, and each button click increments the count.

---

### 9. **What are Keys in React and why are they important?**

**Official Definition (React Docs):**  
 "Keys help React identify which items have changed, are added, or are removed. Keys should be given to the elements inside an array to give the elements a stable identity."  
 [Source: React Docs on Lists and Keys](https://react.dev/learn/rendering-lists)

**Concept Explanation:**  
 Keys are used in React to uniquely identify elements when rendering lists of items. They help React determine which items have changed, been added, or been removed, allowing for efficient updates. Without keys, React might re-render all list items unnecessarily, leading to performance issues.

**Example (Rendering a List with Keys):**

```jsx
function ItemList({ items }) {
  return (
    <ul>
      {items.map((item) => (
        <li key={item.id}>{item.name}</li>
      ))}
    </ul>
  );
}
```

In this example, each list item has a unique `key` based on its `id`, ensuring that React can efficiently update the list when necessary.

---

### 10. **What is Conditional Rendering in React?**

**Official Definition (React Docs):**  
 "In React, you can create distinct components that encapsulate behavior you need. Then, you can render only some of them, depending on the state of your application."  
 [Source: React Docs on Conditional Rendering](https://react.dev/learn/conditional-rendering)

**Concept Explanation:**  
 Conditional rendering in React allows you to render different UI elements or components based on certain conditions (like state or props). It works similarly to conditional logic in JavaScript, where you can render elements based on `if-else` or ternary operators.

**Example:**

```jsx
function UserGreeting({ isLoggedIn }) {
  return (
    <div>{isLoggedIn ? <h1>Welcome back!</h1> : <h1>Please sign in.</h1>}</div>
  );
}

// Usage
<UserGreeting isLoggedIn={true} />;
```

In this example, the greeting changes based on whether the user is logged in or not.

---

### 11. **What is Lifting State Up in React?**

**Official Definition (React Docs):**  
 "Often, several components need to reflect the same changing data. We recommend lifting the shared state up to their closest common ancestor."  
 [Source: React Docs on Lifting State Up](https://react.dev/learn/sharing-state-between-components)

**Concept Explanation:**  
 In React, if multiple components need access to the same state, it’s a best practice to move that state to the closest common ancestor of those components. This way, the state is managed centrally, and the components can receive it via props. This avoids duplication of state logic and makes your components more predictable.

**Example:**

```jsx
function TemperatureInput({ temperature, onTemperatureChange }) {
  return (
    <fieldset>
      <legend>Enter temperature:</legend>
      <input
        value={temperature}
        onChange={(e) => onTemperatureChange(e.target.value)}
      />
    </fieldset>
  );
}

function Calculator() {
  const [temperature, setTemperature] = useState("");

  return (
    <div>
      <TemperatureInput
        temperature={temperature}
        onTemperatureChange={setTemperature}
      />
      <BoilingVerdict temperature={parseFloat(temperature)} />
    </div>
  );
}
```

Here, the `temperature` state is lifted to the `Calculator` component, and `TemperatureInput` receives it via props. Both components rely on the same source of truth for the temperature.

---

### 12. **What is Controlled vs Uncontrolled Components?**

**Official Definition (React Docs):**  
 "In a controlled component, form data is handled by the React component. The alternative is uncontrolled components, where form data is handled by the DOM itself."  
 [Source: React Docs on Forms](https://react.dev/learn/forms)

**Concept Explanation:**  
 In **controlled components**, the form elements like input fields are controlled by the component’s state. Every time a user inputs data, the component state is updated, and the form field value is controlled by this state. In **uncontrolled components**, the form data is handled by the DOM itself, and React doesn't manage the state of the input directly.

**Example (Controlled Component):**

```jsx
function NameForm() {
  const [name, setName] = useState("");

  const handleChange = (event) => {
    setName(event.target.value);
  };

  return (
    <form>
      <label>
        Name:
        <input type="text" value={name} onChange={handleChange} />
      </label>
    </form>
  );
}
```

In this controlled form, the `name` value is stored in the state, and the input field’s value reflects that state. Any change in the input field updates the component state.

**Example (Uncontrolled Component):**

```jsx
function UncontrolledForm() {
  const inputRef = React.useRef();

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log(inputRef.current.value);
  };

  return (
    <form onSubmit={handleSubmit}>
      <input type="text" ref={inputRef} />
      <button type="submit">Submit</button>
    </form>
  );
}
```

In this uncontrolled form, the input field value is accessed directly from the DOM using a ref, not through state.

---

### 13. **What are Fragments in React?**

**Official Definition (React Docs):**  
 "A common pattern in React is for a component to return multiple elements. Fragments let you group a list of children without adding extra nodes to the DOM."  
 [Source: React Docs on Fragments](https://react.dev/learn/writing-markup-with-jsx#jsx-fragments)

**Concept Explanation:**  
 A **Fragment** allows you to group multiple elements without introducing extra nodes into the DOM. Instead of wrapping elements in a `div` or another container element, you can use a fragment, which renders nothing in the DOM. This helps avoid unnecessary nesting of elements.

**Example:**

```jsx
function ListItems() {
  return (
    <React.Fragment>
      <li>Item 1</li>
      <li>Item 2</li>
      <li>Item 3</li>
    </React.Fragment>
  );
}
```

Or using the shorthand syntax:

```jsx
function ListItems() {
  return (
    <>
      <li>Item 1</li>
      <li>Item 2</li>
      <li>Item 3</li>
    </>
  );
}
```

Using fragments keeps the DOM clean and avoids adding unnecessary elements.

---

### 14. **What is Context API in React?**

**Official Definition (React Docs):**  
 "Context provides a way to pass data through the component tree without having to pass props down manually at every level."  
 [Source: React Docs on Context](https://react.dev/learn/passing-data-deeply-with-context)

**Concept Explanation:**  
 The **Context API** allows you to share state or functions between components without passing props manually through every level of the component tree. This is particularly useful for global data, such as the current theme or user authentication state, that needs to be accessible by many components.

**Example (Theme Context):**

```jsx
const ThemeContext = React.createContext("light");

function ThemedButton() {
  const theme = useContext(ThemeContext);
  return (
    <button style={{ background: theme === "dark" ? "#333" : "#ccc" }}>
      Themed Button
    </button>
  );
}

function App() {
  return (
    <ThemeContext.Provider value="dark">
      <ThemedButton />
    </ThemeContext.Provider>
  );
}
```

In this example, the `ThemedButton` component doesn’t receive the theme value via props. Instead, it consumes the value from `ThemeContext` directly, making the data accessible without prop drilling.

---

### 15. **What is Prop Drilling in React?**

**Official Definition (React Docs):**  
 "Prop drilling refers to the process of passing down props from a parent component to deeply nested child components."  
 [Source: React Docs on Prop Drilling](https://react.dev/learn/sharing-state-between-components#solutions-for-passing-data-deeply)

**Concept Explanation:**  
 **Prop drilling** occurs when you pass data from a parent component to a deeply nested child component, even though intermediate components don't need the data. This can lead to unnecessary complexity and make the component hierarchy harder to manage.

**Example:**

```jsx
function Parent() {
  const [message, setMessage] = useState("Hello from Parent");

  return <Child1 message={message} />;
}

function Child1({ message }) {
  return <Child2 message={message} />;
}

function Child2({ message }) {
  return <p>{message}</p>;
}
```

In this example, the `message` prop is passed from the `Parent` to `Child2` via `Child1`, even though `Child1` doesn’t need the data. The Context API can help avoid this pattern by sharing the data globally.

---

### 16. **What is the `useReducer` Hook in React?**

**Official Definition (React Docs):**  
 "`useReducer` is usually preferable to `useState` when you have complex state logic that involves multiple sub-values or when the next state depends on the previous one."  
 [Source: React Docs on `useReducer`](https://react.dev/reference/react/useReducer)

**Concept Explanation:**  
 The `useReducer` hook is an alternative to `useState` for managing complex state logic. It is particularly useful when you have multiple related state variables or when the next state depends on the previous state. It works similarly to Redux, where you dispatch actions and define a reducer function to determine the new state.

**Example:**

```jsx
const initialState = { count: 0 };

function reducer(state, action) {
  switch (action.type) {
    case "increment":
      return { count: state.count + 1 };
    case "decrement":
      return { count: state.count - 1 };
    default:
      return state;
  }
}

function Counter() {
  const [state, dispatch] = useReducer(reducer, initialState);

  return (
    <div>
      <p>Count: {state.count}</p>
      <button onClick={() => dispatch({ type: "increment" })}>Increment</button>
      <button onClick={() => dispatch({ type: "decrement" })}>Decrement</button>
    </div>
  );
}
```

Here, `useReducer` manages the state with actions `increment` and `decrement`, making it easier to manage complex state transitions.

---

### 17. **What are Pure Components in React?**

**Official Definition (React Docs):**  
 "A `React.PureComponent` is similar to `React.Component`, but it implements `shouldComponentUpdate()` with a shallow prop and state comparison."  
 [Source: React Docs on Pure Components

](https://react.dev/reference/react/PureComponent)

**Concept Explanation:**  
 A **PureComponent** automatically prevents re-rendering when the props and state have not changed. It performs a shallow comparison of props and state to decide whether the component should update. This can improve performance by reducing unnecessary renders, especially for components that receive the same data frequently.

**Example:**

```jsx
class MyComponent extends React.PureComponent {
  render() {
    return <div>{this.props.text}</div>;
  }
}

// Usage
<MyComponent text="Hello" />;
```

In this example, `MyComponent` will only re-render if the `text` prop changes, making it more efficient.

---

### 18. **What is useEffect Cleanup in React?**

**Official Definition (React Docs):**  
 "If your effect returns a function, React will run it when it is time to clean up."  
 [Source: React Docs on Effects](https://react.dev/reference/react/useEffect#cleaning-up-an-effect)

**Concept Explanation:**  
 The `useEffect` hook can return a cleanup function to clean up after effects like subscriptions, timers, or other side effects. This function is called when the component is unmounted or before the effect is re-run.

**Example:**

```jsx
useEffect(() => {
  const timer = setInterval(() => {
    console.log("Running timer...");
  }, 1000);

  return () => {
    clearInterval(timer); // Cleanup function
  };
}, []);
```

In this example, the cleanup function stops the timer when the component unmounts.

---

### 19. **What is the useMemo Hook in React?**

**Official Definition (React Docs):**  
 "You can use `useMemo` to memoize expensive calculations so that they are only recomputed when one of the dependencies changes."  
 [Source: React Docs on `useMemo`](https://react.dev/reference/react/useMemo)

**Concept Explanation:**  
 The `useMemo` hook is used to memoize expensive computations. It re-calculates the result only when its dependencies change, preventing unnecessary recalculations and improving performance.

**Example:**

```jsx
const expensiveCalculation = (num) => {
  console.log("Calculating...");
  return num * 2;
};

function App() {
  const [number, setNumber] = useState(0);
  const memoizedValue = useMemo(() => expensiveCalculation(number), [number]);

  return (
    <div>
      <p>Result: {memoizedValue}</p>
      <button onClick={() => setNumber(number + 1)}>Increment</button>
    </div>
  );
}
```

Here, the `expensiveCalculation` is only run when `number` changes, improving performance.

---

### 20. **What is Lazy Loading in React?**

**Official Definition (React Docs):**  
 "React.lazy lets you render a dynamic import as a regular component."  
 [Source: React Docs on Lazy Loading](https://react.dev/reference/react/lazy)

**Concept Explanation:**  
 Lazy loading allows you to load components lazily when they are needed, instead of loading everything upfront. This improves the initial load time of the application by splitting the code into chunks that are loaded on demand.

**Example:**

```jsx
const OtherComponent = React.lazy(() => import("./OtherComponent"));

function App() {
  return (
    <div>
      <Suspense fallback={<div>Loading...</div>}>
        <OtherComponent />
      </Suspense>
    </div>
  );
}
```

In this example, `OtherComponent` is only loaded when needed, and while it's loading, a fallback loading message is shown.

---

### 21. **What is the `useRef` Hook in React?**

**Official Definition (React Docs):**  
 "The `useRef` Hook lets you reference a value that’s not needed for rendering."  
 [Source: React Docs on `useRef`](https://react.dev/reference/react/useRef)

**Concept Explanation:**  
 The `useRef` hook allows you to persist values across renders without triggering a re-render when those values change. It’s commonly used to access DOM elements directly or to store mutable variables that don’t require state updates.

**Real-World Example (Accessing DOM Elements):**

```jsx
function FocusInput() {
  const inputRef = useRef(null);

  const handleClick = () => {
    inputRef.current.focus();
  };

  return (
    <div>
      <input ref={inputRef} type="text" />
      <button onClick={handleClick}>Focus Input</button>
    </div>
  );
}
```

In this example, the `useRef` hook is used to access the DOM input element and focus it when the button is clicked, without triggering a re-render.

---

### 22. **What are React Portals?**

**Official Definition (React Docs):**  
 "Portals provide a way to render children into a DOM node that exists outside the DOM hierarchy of the parent component."  
 [Source: React Docs on Portals](https://react.dev/reference/react-dom/createPortal)

**Concept Explanation:**  
 React **Portals** allow you to render a component's children into a different part of the DOM tree. This is useful for rendering modals, tooltips, or other components that need to break out of their parent component's DOM hierarchy while still maintaining React's event system.

**Real-World Example (Rendering a Modal with a Portal):**

```jsx
import { createPortal } from "react-dom";

function Modal({ isOpen, children }) {
  if (!isOpen) return null;

  return createPortal(
    <div className="modal">{children}</div>,
    document.getElementById("modal-root")
  );
}

function App() {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <div>
      <button onClick={() => setIsOpen(true)}>Open Modal</button>
      <Modal isOpen={isOpen}>
        <h2>Modal Content</h2>
        <button onClick={() => setIsOpen(false)}>Close</button>
      </Modal>
    </div>
  );
}
```

In this example, the modal is rendered into a different DOM node (outside of the parent DOM hierarchy) using a portal.

---

### 23. **What are Error Boundaries in React?**

**Official Definition (React Docs):**  
 "Error boundaries catch JavaScript errors anywhere in their child component tree, log those errors, and display a fallback UI instead of the component tree that crashed."  
 [Source: React Docs on Error Boundaries](https://react.dev/reference/react/Component#catching-rendering-errors-with-error-boundaries)

**Concept Explanation:**  
 Error boundaries are components that catch JavaScript errors anywhere in their child component tree and display a fallback UI instead of the broken component tree. They are useful for gracefully handling errors in production and keeping the app functional.

**Real-World Example (Creating an Error Boundary):**

```jsx
class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError() {
    return { hasError: true };
  }

  componentDidCatch(error, info) {
    console.error("Error caught:", error, info);
  }

  render() {
    if (this.state.hasError) {
      return <h1>Something went wrong.</h1>;
    }

    return this.props.children;
  }
}

function BuggyComponent() {
  throw new Error("I crashed!");
}

function App() {
  return (
    <ErrorBoundary>
      <BuggyComponent />
    </ErrorBoundary>
  );
}
```

In this example, `BuggyComponent` throws an error, but the `ErrorBoundary` catches it and displays a fallback UI.

---

### 24. **What is `useCallback` in React?**

**Official Definition (React Docs):**  
 "The `useCallback` Hook lets you cache a function definition between re-renders."  
 [Source: React Docs on `useCallback`](https://react.dev/reference/react/useCallback)

**Concept Explanation:**  
 The `useCallback` hook returns a memoized version of the callback function that only changes if one of the dependencies has changed. It’s useful for optimizing performance, especially when passing callback functions to child components that rely on reference equality to avoid unnecessary re-renders.

**Real-World Example:**

```jsx
function ParentComponent() {
  const [count, setCount] = useState(0);

  const increment = useCallback(() => {
    setCount((prev) => prev + 1);
  }, []);

  return (
    <div>
      <button onClick={increment}>Increment</button>
      <ChildComponent onClick={increment} />
    </div>
  );
}

function ChildComponent({ onClick }) {
  console.log("ChildComponent rendered");
  return <button onClick={onClick}>Child Button</button>;
}
```

In this example, `useCallback` ensures that the `increment` function has the same reference between renders, preventing unnecessary re-renders of `ChildComponent`.

---

### 25. **What is Code Splitting in React?**

**Official Definition (React Docs):**  
 "Code-splitting is a feature supported by bundlers like Webpack, which can create multiple bundles that can be dynamically loaded at runtime."  
 [Source: React Docs on Code Splitting](https://react.dev/reference/react/Suspense#code-splitting)

**Concept Explanation:**  
 **Code splitting** allows you to break up your application into smaller bundles, so only the necessary code is loaded when the user interacts with a certain part of your app. This improves performance by reducing the initial load time.

**Real-World Example (Dynamic Import):**

```jsx
const OtherComponent = React.lazy(() => import("./OtherComponent"));

function App() {
  return (
    <div>
      <Suspense fallback={<div>Loading...</div>}>
        <OtherComponent />
      </Suspense>
    </div>
  );
}
```

In this example, `OtherComponent` is loaded only when needed, using React's lazy loading and `Suspense` for fallback content.

---

### 26. **What are Higher-Order Components (HOC) in React?**

**Official Definition (React Docs):**  
 "A higher-order component is a function that takes a component and returns a new component."  
 [Source: React Docs on Higher-Order Components](https://react.dev/reference/react/higher-order-components)

**Concept Explanation:**  
 A **Higher-Order Component (HOC)** is a function that wraps a component to add additional functionality. HOCs are a pattern in React for reusing component logic. They take a component as input and return a new, enhanced component.

**Real-World Example:**

```jsx
function withLogger(WrappedComponent) {
  return function (props) {
    console.log("Rendering:", WrappedComponent.name);
    return <WrappedComponent {...props} />;
  };
}

function MyComponent() {
  return <div>My Component</div>;
}

const MyComponentWithLogger = withLogger(MyComponent);

function App() {
  return <MyComponentWithLogger />;
}
```

Here, `withLogger` is an HOC that logs the name of the wrapped component before rendering it.

---

### 27. **What are Render Props in React?**

**Official Definition (React Docs):**  
 "The term 'render prop' refers to a technique for sharing code between React components using a prop whose value is a function."  
 [Source: React Docs on Render Props](https://react.dev/reference/react/render-props)

**Concept Explanation:**  
 A **render prop** is a prop that accepts a function, which allows you to dynamically decide what to render. This pattern enables code sharing between components by allowing different implementations of a component’s behavior.

**Real-World Example:**

```jsx
function MouseTracker({ render }) {
  const [mousePosition, setMousePosition] = useState({ x: 0, y: 0 });

  const handleMouseMove = (event) => {
    setMousePosition({ x: event.clientX, y: event.clientY });
  };

  return <div onMouseMove={handleMouseMove}>{render(mousePosition)}</div>;
}

function App() {
  return (
    <MouseTracker
      render={({ x, y }) => (
        <h1>
          Mouse position: {x}, {y}
        </h1>
      )}
    />
  );
}
```

In this example, the `MouseTracker` component takes a `render` prop that defines how to render the mouse position.

---

### 28. **What is the `useLayoutEffect` Hook in React?**

\*\*Official Definition (

React Docs):\*\*  
 "`useLayoutEffect` fires synchronously after all DOM mutations."  
 [Source: React Docs on `useLayoutEffect`](https://react.dev/reference/react/useLayoutEffect)

**Concept Explanation:**  
 The `useLayoutEffect` hook is similar to `useEffect`, but it runs synchronously after DOM mutations. It is useful when you need to measure DOM elements or apply DOM changes that must be completed before the browser repaints.

**Real-World Example:**

```jsx
function App() {
  const inputRef = useRef(null);

  useLayoutEffect(() => {
    console.log(inputRef.current.value); // Logs before the browser repaints
  });

  return <input ref={inputRef} value="Hello" />;
}
```

In this example, `useLayoutEffect` ensures the console log occurs synchronously after the DOM update, before the browser has repainted.

---

### 29. **What is the `useReducer` Hook in React?**

**Official Definition (React Docs):**  
 "`useReducer` is usually preferable to `useState` when you have complex state logic that involves multiple sub-values or when the next state depends on the previous one."  
 [Source: React Docs on `useReducer`](https://react.dev/reference/react/useReducer)

**Concept Explanation:**  
 The `useReducer` hook is an alternative to `useState` for managing more complex state logic. It is particularly useful when the state transitions depend on previous states or when there are multiple related values to manage.

**Real-World Example:**

```jsx
const initialState = { count: 0 };

function reducer(state, action) {
  switch (action.type) {
    case "increment":
      return { count: state.count + 1 };
    case "decrement":
      return { count: state.count - 1 };
    default:
      return state;
  }
}

function Counter() {
  const [state, dispatch] = useReducer(reducer, initialState);

  return (
    <div>
      <p>Count: {state.count}</p>
      <button onClick={() => dispatch({ type: "increment" })}>Increment</button>
      <button onClick={() => dispatch({ type: "decrement" })}>Decrement</button>
    </div>
  );
}
```

In this example, `useReducer` manages a counter's state and dispatches actions to update the count.

---

### 30. **What is the Context API in React?**

**Official Definition (React Docs):**  
 "Context provides a way to pass data through the component tree without having to pass props down manually at every level."  
 [Source: React Docs on Context](https://react.dev/reference/react/createContext)

**Concept Explanation:**  
 The **Context API** allows you to share data across components without passing props down manually at every level. It’s especially useful for global data like themes, authentication, or user preferences.

**Real-World Example:**

```jsx
const ThemeContext = React.createContext("light");

function App() {
  return (
    <ThemeContext.Provider value="dark">
      <Toolbar />
    </ThemeContext.Provider>
  );
}

function Toolbar() {
  return <ThemeButton />;
}

function ThemeButton() {
  const theme = useContext(ThemeContext);
  return <button>{`Current theme: ${theme}`}</button>;
}
```

In this example, the `ThemeContext` provides the theme value (`'dark'`), which is consumed by `ThemeButton` without manually passing it through `Toolbar`.

---

# Intermediate

---

### 1. **What is Prop Drilling in React?**

**Official Definition (React Docs):**  
 "Prop drilling refers to the process of passing data from a parent component to deeply nested child components through multiple layers of intermediary components."  
 [Source: React Docs (Indirect Reference)](https://react.dev/learn/passing-data-deeply-with-context)

**Concept Explanation:**  
 **Prop drilling** is when you pass props down multiple component layers to reach a deeply nested component. It can make your code harder to maintain, especially if the prop is only needed by the deeply nested component. This problem can be mitigated using the Context API or other state management tools.

**Example:**

```jsx
function App() {
  const user = { name: "John", age: 30 };
  return <ParentComponent user={user} />;
}

function ParentComponent({ user }) {
  return <ChildComponent user={user} />;
}

function ChildComponent({ user }) {
  return <GrandChildComponent user={user} />;
}

function GrandChildComponent({ user }) {
  return <div>{user.name}</div>;
}
```

In this example, the `user` prop is passed down through several components, even though only `GrandChildComponent` uses it.

---

### 2. **What is React.memo and How is it Used?**

**Official Definition (React Docs):**  
 "`React.memo` is a higher-order component. If your component renders the same result given the same props, you can wrap it in `React.memo` for a performance boost."  
 [Source: React Docs on `React.memo`](https://react.dev/reference/react/memo)

**Concept Explanation:**  
 `React.memo` is used to memoize functional components. It prevents re-rendering if the props haven’t changed. This can improve performance by avoiding unnecessary renders, especially for components that receive the same props repeatedly.

**Example:**

```jsx
const MyComponent = React.memo(function MyComponent({ name }) {
  console.log("Rendering MyComponent");
  return <div>{name}</div>;
});

function App() {
  const [count, setCount] = useState(0);
  return (
    <div>
      <button onClick={() => setCount(count + 1)}>Increment</button>
      <MyComponent name="John" />
    </div>
  );
}
```

In this example, `MyComponent` only re-renders when the `name` prop changes, not when the `count` changes.

---

### 3. **What is the `useContext` Hook in React?**

**Official Definition (React Docs):**  
 "`useContext` accepts a context object (the value returned from `React.createContext`) and returns the current context value."  
 [Source: React Docs on `useContext`](https://react.dev/reference/react/useContext)

**Concept Explanation:**  
 The `useContext` hook allows components to subscribe to context changes. It simplifies the use of the Context API by directly consuming context values without needing to wrap components in `Context.Consumer`.

**Example:**

```jsx
const ThemeContext = React.createContext("light");

function App() {
  return (
    <ThemeContext.Provider value="dark">
      <Toolbar />
    </ThemeContext.Provider>
  );
}

function Toolbar() {
  return <ThemeButton />;
}

function ThemeButton() {
  const theme = useContext(ThemeContext);
  return <button>{`Current theme: ${theme}`}</button>;
}
```

In this example, `ThemeButton` consumes the theme value directly using `useContext` without manually passing it through multiple layers of components.

---

### 4. **What is the useImperativeHandle Hook in React?**

**Official Definition (React Docs):**  
 "The `useImperativeHandle` Hook lets you customize the instance value that is exposed to parent components when using `ref`."  
 [Source: React Docs on `useImperativeHandle`](https://react.dev/reference/react/useImperativeHandle)

**Concept Explanation:**  
 The `useImperativeHandle` hook allows you to customize the `ref` value exposed to the parent component. It’s typically used in conjunction with `forwardRef` to control what is accessible to the parent component through the `ref`.

**Example:**

```jsx
const CustomInput = React.forwardRef((props, ref) => {
  const inputRef = useRef();

  useImperativeHandle(ref, () => ({
    focus: () => {
      inputRef.current.focus();
    },
  }));

  return <input ref={inputRef} />;
});

function App() {
  const inputRef = useRef();

  return (
    <div>
      <CustomInput ref={inputRef} />
      <button onClick={() => inputRef.current.focus()}>Focus Input</button>
    </div>
  );
}
```

In this example, `useImperativeHandle` is used to expose a `focus` method to the parent component, which can be called via the `ref`.

---

### 5. **What are Compound Components in React?**

**Concept Explanation:**  
 **Compound components** are a design pattern where components work together and share internal state, allowing more flexible composition. It is commonly used in building UI components like form elements or dropdowns where the parent component manages the shared state and children communicate with each other through the parent.

**Example:**

```jsx
function Toggle({ children }) {
  const [on, setOn] = useState(false);
  const toggle = () => setOn(!on);

  return React.Children.map(children, (child) => {
    if (React.isValidElement(child)) {
      return React.cloneElement(child, { on, toggle });
    }
    return child;
  });
}

function ToggleButton({ on, toggle }) {
  return <button onClick={toggle}>{on ? "ON" : "OFF"}</button>;
}

function App() {
  return (
    <Toggle>
      <ToggleButton />
    </Toggle>
  );
}
```

In this example, `Toggle` manages the state and shares it with its children, allowing flexible composition of toggle-related components.

---

### 6. **What is the Forwarding Refs Technique in React?**

**Official Definition (React Docs):**  
 "Ref forwarding is a feature that lets some components automatically receive a ref they can pass down to a child component."  
 [Source: React Docs on Forwarding Refs](https://react.dev/reference/react/forwardRef)

**Concept Explanation:**  
 Ref forwarding is a technique in React that allows components to pass refs through to their child components. This is useful when you need access to a child’s DOM element but want to maintain encapsulation.

**Example:**

```jsx
const CustomInput = React.forwardRef((props, ref) => {
  return <input ref={ref} {...props} />;
});

function App() {
  const inputRef = useRef(null);

  return (
    <div>
      <CustomInput ref={inputRef} />
      <button onClick={() => inputRef.current.focus()}>Focus Input</button>
    </div>
  );
}
```

In this example, `CustomInput` forwards the ref to the underlying DOM input element, allowing the parent component to directly control it.

---

### 7. **What is Server-Side Rendering (SSR) in React?**

**Official Definition (React Docs):**  
 "Server-side rendering (SSR) is the process of rendering React components to HTML on the server, and sending that HTML to the client."  
 [Source: React Docs on SSR](https://react.dev/learn/exploring-server-side-rendering)

**Concept Explanation:**  
 Server-Side Rendering (SSR) renders React components on the server and sends fully rendered HTML to the client. This improves the initial load time and SEO for web pages because the content is available before the JavaScript bundle is loaded.

**Example:**

```js
// Express.js server setup for SSR with React
import express from "express";
import React from "react";
import { renderToString } from "react-dom/server";
import App from "./App";

const server = express();

server.get("*", (req, res) => {
  const appHtml = renderToString(<App />);
  res.send(`
    <!DOCTYPE html>
    <html>
      <head><title>My SSR App</title></head>
      <body>
        <div id="root">${appHtml}</div>
        <script src="/bundle.js"></script>
      </body>
    </html>
  `);
});

server.listen(3000, () => console.log("Server is running on port 3000"));
```

In this example, an Express.js server renders the `App` component to HTML on the server and sends it to the client.

---

### 8. **What is Suspense in React?**

**Official Definition (React Docs):**  
 "Suspense lets your components 'wait' for something before they can render."  
 [Source: React Docs on Suspense](https://react.dev/reference/react/Suspense)

**Concept Explanation:**  
 `Suspense` is a feature that allows components to delay their rendering until some asynchronous operation, such as data fetching or lazy loading a component, has been

completed.

**Example:**

```jsx
const LazyComponent = React.lazy(() => import("./LazyComponent"));

function App() {
  return (
    <div>
      <Suspense fallback={<div>Loading...</div>}>
        <LazyComponent />
      </Suspense>
    </div>
  );
}
```

In this example, `Suspense` displays a fallback while the `LazyComponent` is being lazily loaded.

---

### 9. **What is Code-Splitting in React?**

**Official Definition (React Docs):**  
 "Code-splitting is a feature that allows you to split your code into smaller chunks, which can then be loaded on demand."  
 [Source: React Docs on Code Splitting](https://react.dev/learn/code-splitting)

**Concept Explanation:**  
 Code-splitting enables your application to load only the code necessary for the current user interaction. This improves performance by reducing the size of the initial JavaScript bundle. React supports code-splitting through `React.lazy` and dynamic imports.

**Example:**

```jsx
const LazyComponent = React.lazy(() => import("./LazyComponent"));

function App() {
  return (
    <div>
      <Suspense fallback={<div>Loading...</div>}>
        <LazyComponent />
      </Suspense>
    </div>
  );
}
```

In this example, the `LazyComponent` is only loaded when it's needed, reducing the initial bundle size.

---

### 10. **What are React Portals?**

**Official Definition (React Docs):**  
 "Portals provide a way to render children into a DOM node that exists outside the DOM hierarchy of the parent component."  
 [Source: React Docs on Portals](https://react.dev/reference/react-dom/createPortal)

**Concept Explanation:**  
 **React Portals** allow you to render components outside of the parent DOM hierarchy. This is useful for modals, tooltips, or any component that needs to be visually detached from its parent but still maintain its state and context.

**Example:**

```jsx
function Modal({ children }) {
  return ReactDOM.createPortal(
    <div className="modal">{children}</div>,
    document.getElementById("modal-root")
  );
}

function App() {
  return (
    <div>
      <h1>Hello, World!</h1>
      <Modal>I'm a modal!</Modal>
    </div>
  );
}
```

In this example, the modal content is rendered into a DOM node (`modal-root`) outside the main application DOM hierarchy.

---

Here are **11-20 intermediate React concepts** with official documentation definitions, explanations, examples, and use cases.

---

### 11. **What is Error Boundary in React?**

**Official Definition (React Docs):**  
 "Error boundaries are React components that catch JavaScript errors anywhere in their child component tree, log those errors, and display a fallback UI instead of the component tree that crashed."  
 [Source: React Docs on Error Boundaries](https://react.dev/reference/react/Component#catching-rendering-errors-with-an-error-boundary)

**Concept Explanation:**  
 An error boundary is a React component that uses the `componentDidCatch` lifecycle method (or `getDerivedStateFromError`) to catch JavaScript errors in any child component and render a fallback UI. It prevents the entire app from crashing due to unhandled errors.

**Example:**

```jsx
class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  componentDidCatch(error, info) {
    console.log(error, info);
  }

  render() {
    if (this.state.hasError) {
      return <h1>Something went wrong.</h1>;
    }
    return this.props.children;
  }
}

function BuggyComponent() {
  throw new Error("I crashed!");
}

function App() {
  return (
    <ErrorBoundary>
      <BuggyComponent />
    </ErrorBoundary>
  );
}
```

**Use Cases:**

- Handling errors in production environments to ensure a better user experience.
- Implementing graceful fallbacks when certain components fail to render.
- Logging errors for debugging purposes without crashing the entire app.

---

### 12. **What is the `useCallback` Hook in React?**

**Official Definition (React Docs):**  
 "`useCallback` returns a memoized callback."  
 [Source: React Docs on `useCallback`](https://react.dev/reference/react/useCallback)

**Concept Explanation:**  
 The `useCallback` hook is used to memoize a callback function. It prevents a function from being recreated on every render unless its dependencies change. This is useful for performance optimization in child components that rely on callbacks from the parent component.

**Example:**

```jsx
function App() {
  const [count, setCount] = useState(0);
  const handleClick = useCallback(
    () => setCount((prevCount) => prevCount + 1),
    []
  );
  return <Button onClick={handleClick} />;
}

function Button({ onClick }) {
  console.log("Button re-rendered");
  return <button onClick={onClick}>Click me</button>;
}
```

**Use Cases:**

- Preventing unnecessary re-renders of child components that depend on memoized callbacks.
- Optimizing performance in large applications where event handlers are passed down as props.

---

### 13. **What is the `useMemo` Hook in React?**

**Official Definition (React Docs):**  
 "`useMemo` returns a memoized value."  
 [Source: React Docs on `useMemo`](https://react.dev/reference/react/useMemo)

**Concept Explanation:**  
 The `useMemo` hook is used to memoize a value that is computationally expensive to calculate. It re-computes the value only when its dependencies change, optimizing performance by avoiding unnecessary recalculations during renders.

**Example:**

```jsx
function App() {
  const [count, setCount] = useState(0);
  const expensiveValue = useMemo(() => {
    return count * 2; // Simulate a heavy calculation
  }, [count]);

  return <div>{expensiveValue}</div>;
}
```

**Use Cases:**

- Optimizing performance by memoizing expensive calculations or transformations.
- Reducing unnecessary re-renders by avoiding recalculations of unchanged values.

---

### 14. **What is the `useRef` Hook in React?**

**Official Definition (React Docs):**  
 "`useRef` returns a mutable ref object whose `.current` property is initialized to the passed argument."  
 [Source: React Docs on `useRef`](https://react.dev/reference/react/useRef)

**Concept Explanation:**  
 The `useRef` hook returns a mutable object with a `.current` property that persists between renders. It can be used to access DOM elements or store values that don’t trigger re-renders when updated.

**Example:**

```jsx
function App() {
  const inputRef = useRef(null);

  const handleFocus = () => {
    inputRef.current.focus();
  };

  return (
    <div>
      <input ref={inputRef} />
      <button onClick={handleFocus}>Focus Input</button>
    </div>
  );
}
```

**Use Cases:**

- Accessing and interacting with DOM elements (e.g., focusing inputs).
- Storing values that need to persist across renders but don’t trigger re-renders (e.g., timers, previous state).

---

### 15. **What is Reconciliation in React?**

**Official Definition (React Docs):**  
 "Reconciliation is the process by which React updates the DOM with the result of rendering a component."  
 [Source: React Docs on Reconciliation](https://react.dev/learn/reconciliation)

**Concept Explanation:**  
 Reconciliation is the process React uses to determine how the virtual DOM differs from the real DOM and update only the parts that have changed. React uses a diffing algorithm to compare the old and new virtual DOM trees and apply the minimum number of DOM updates.

**Example:**

```js
// React automatically handles reconciliation under the hood
```

**Use Cases:**

- Optimizing performance by updating only the changed DOM nodes.
- Minimizing re-renders and improving the efficiency of UI updates.

### 16. **What are Context Providers and Consumers in React?**

**Official Definition (React Docs):**  
 "Context provides a way to pass data through the component tree without having to pass props down manually at every level."  
 [Source: React Docs on Context](https://react.dev/reference/react/createContext)

**Concept Explanation:**  
 React **Context** is a way to share data (such as themes, user information, or language preferences) across multiple components without explicitly passing props through every level of the component tree. Providers supply data, and Consumers access it.

**Example:**

```jsx
const ThemeContext = React.createContext("light");

function App() {
  return (
    <ThemeContext.Provider value="dark">
      <Toolbar />
    </ThemeContext.Provider>
  );
}

function Toolbar() {
  return <ThemedButton />;
}

function ThemedButton() {
  const theme = useContext(ThemeContext);
  return <button className={theme}>Button</button>;
}
```

**Use Cases:**

- Managing global application states such as themes, authentication status, or user preferences.
- Avoiding "prop drilling" by providing shared data directly to components that need it.

---

# Advance

---

### 1. **What is Server-Side Rendering (SSR) in React?**

**Official Definition (React Docs):**  
 "Server-side rendering (SSR) is a technique that renders web pages on the server instead of the client."  
 [Source: React Docs on SSR](https://react.dev/learn/react-ssr)

**Concept Explanation:**  
 **Server-Side Rendering (SSR)** is the process of rendering React components on the server and sending fully-rendered HTML to the client. This improves performance and SEO (Search Engine Optimization) because search engines and users receive a fully-rendered page right away. In SSR, the initial render occurs on the server, and React rehydrates the page on the client side with full interactivity.

**Example (with Next.js, a popular SSR framework):**

```jsx
import React from "react";

function Home({ data }) {
  return (
    <div>
      <h1>Data fetched on the server: {data}</h1>
    </div>
  );
}

export async function getServerSideProps() {
  const data = await fetchSomeData();
  return {
    props: {
      data,
    },
  };
}

export default Home;
```

**Use Cases:**

- Improving SEO: SSR is crucial for public-facing websites that need better visibility on search engines like Google.
- Faster initial page load: The browser receives a fully-rendered page, reducing the time to first meaningful paint.
- E-commerce platforms: Websites that need to display content quickly to users, especially for dynamic data like product details or search results.

---

### 2. **What is Static Site Generation (SSG) in React?**

**Official Definition (React Docs):**  
 "Static site generation (SSG) is a method of pre-rendering web pages into static HTML at build time."  
 [Source: React Docs on SSG](https://react.dev/learn/static-site-generation)

**Concept Explanation:**  
 **Static Site Generation (SSG)** is the process of generating static HTML pages at build time. Unlike SSR, where pages are rendered on each request, SSG generates HTML once and serves the same HTML to every request. This leads to faster load times, as static files can be served directly from a CDN (Content Delivery Network).

**Example (Next.js for SSG):**

```jsx
function BlogPost({ post }) {
  return (
    <article>
      <h1>{post.title}</h1>
      <p>{post.content}</p>
    </article>
  );
}

export async function getStaticProps() {
  const post = await fetchBlogPost();
  return {
    props: {
      post,
    },
  };
}

export default BlogPost;
```

**Use Cases:**

- Blogs, documentation websites, and marketing sites: Pages that do not change frequently and benefit from being pre-rendered.
- Serving pages quickly through a CDN for faster performance.
- E-commerce landing pages: Pages that showcase static content like categories and landing pages for products.

---

### 3. **What is Incremental Static Regeneration (ISR) in React?**

**Official Definition (Next.js Docs):**  
 "Incremental Static Regeneration (ISR) enables you to use static generation on a per-page basis, without needing to rebuild the entire site."  
 [Source: Next.js Docs on ISR](https://nextjs.org/docs/basic-features/data-fetching/incremental-static-regeneration)

**Concept Explanation:**  
 **Incremental Static Regeneration (ISR)** combines the benefits of static site generation with the ability to update static pages after they've been deployed. This is useful for pages that require frequent updates but do not justify full server-side rendering. With ISR, pages can be statically regenerated in the background as traffic flows to them, ensuring up-to-date content without sacrificing performance.

**Example:**

```jsx
function ProductPage({ product }) {
  return (
    <div>
      <h1>{product.name}</h1>
      <p>{product.description}</p>
    </div>
  );
}

export async function getStaticProps() {
  const product = await fetchProduct();
  return {
    props: {
      product,
    },
    revalidate: 10, // Regenerate the page every 10 seconds
  };
}

export default ProductPage;
```

**Use Cases:**

- E-commerce product pages: Frequently changing content like price updates or product descriptions.
- News websites: Ensuring articles are up to date with the latest content while keeping load times fast.
- Any page where content frequently changes but performance is critical.

---

### 4. **What is React Hydration?**

**Official Definition (React Docs):**  
 "Hydration is the process of taking over the server-rendered HTML and making it interactive on the client side."  
 [Source: React Docs on Hydration](https://react.dev/learn/server-side-rendering#hydration)

**Concept Explanation:**  
 **React Hydration** is the process where React takes a server-rendered HTML page and attaches event listeners and functionality to make it interactive. This process is essential for SSR or SSG-based apps to function correctly on the client side. Hydration enables React to match the already-rendered HTML structure with the client-side JavaScript.

**Example:**

```jsx
// HTML is already server-rendered
<div id="app">
  <h1>Hello, World!</h1>
</div>;

// Client-side hydration happens
ReactDOM.hydrate(<App />, document.getElementById("app"));
```

**Use Cases:**

- SSR and SSG apps where the initial page load happens on the server, and the client-side JavaScript makes the page interactive.
- Applications where performance optimization is crucial and content needs to be immediately viewable, with interactivity added later.

---

### 5. **What is React Concurrent Rendering?**

**Official Definition (React Docs):**  
 "Concurrent rendering allows React to work on multiple tasks at the same time, without blocking the main thread."  
 [Source: React Docs on Concurrent Rendering](https://react.dev/reference/react/ConcurrentMode)

**Concept Explanation:**  
 **Concurrent Rendering** is a feature in React that allows React to prioritize tasks and render components in a non-blocking way. Instead of rendering everything in a single pass, React can pause and resume rendering, ensuring the app remains responsive. This feature is critical for improving user experience by making sure high-priority tasks like animations or input responses are not delayed by background tasks.

**Example:**

```jsx
// Usage in React (behind the scenes in React 18+)
<React.StrictMode>
  <App />
</React.StrictMode>
```

**Use Cases:**

- Rendering complex UIs without blocking user interactions.
- Ensuring responsive user interfaces even when processing heavy background computations.
- Improving the overall performance of single-page applications.

---

### 6. **What are React Suspense and SuspenseList?**

**Official Definition (React Docs):**  
 "Suspense lets your components ‘wait’ for something before they can render."  
 [Source: React Docs on Suspense](https://react.dev/reference/react/Suspense)

**Concept Explanation:**  
 **React Suspense** is a feature that allows components to delay their rendering until a certain condition is met, such as data fetching or code splitting. `SuspenseList` helps to coordinate multiple Suspense components by controlling the order in which they appear.

**Example:**

```jsx
const LazyComponent = React.lazy(() => import("./LazyComponent"));

function App() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <LazyComponent />
    </Suspense>
  );
}
```

**Use Cases:**

- Lazy-loading components or features, ensuring that loading indicators are shown while content is being fetched.
- Improving user experience by showing fallback UIs during asynchronous operations.
- Coordinating multiple asynchronous component renders using `SuspenseList`.

---

### 7. **What is React Profiler?**

**Official Definition (React Docs):**  
 "The React Profiler measures how often a React application renders and what the cost of rendering is."  
 [Source: React Docs on Profiler](https://react.dev/reference/react/Profiler)

**Concept Explanation:**  
 **React Profiler** is a built-in tool that helps developers understand the performance of their applications by measuring how often components render and how long each render takes. This is especially useful for identifying performance bottlenecks and optimizing rendering performance.

**Example:**

```jsx
<Profiler
  id="App"
  onRender={(id, phase, actualDuration) => {
    console.log({ id, phase, actualDuration });
  }}
>
  <App />
</Profiler>
```

**Use Cases:**

- Profiling React components to understand rendering performance and optimize slow components.
- Identifying unnecessary renders and improving app efficiency.
- Debugging performance bottlenecks in large-scale React applications.

---

### 8. **What is React.memo()?**

**Official Definition (React Docs):**  
 "React.memo is a higher-order component that memoizes a component to prevent unnecessary re-renders."  
 [Source: React Docs on React.memo](https://react.dev/reference/react/memo)

\*\*

Concept Explanation:\*\*  
 **React.memo** is a higher-order component (HOC) that optimizes performance by memoizing the output of a component. If the component’s props don’t change, React.memo prevents it from re-rendering. This can be beneficial for performance in cases where re-rendering is expensive.

**Example:**

```jsx
const MyComponent = React.memo(function MyComponent({ name }) {
  return <div>{name}</div>;
});
```

**Use Cases:**

- Reducing unnecessary renders in large or complex components.
- Optimizing performance for components that receive the same props repeatedly without needing to update.
- Useful in lists, grids, or table components that render large amounts of data.

---

### 9. **What is React Portals?**

**Official Definition (React Docs):**  
 "Portals provide a way to render children into a DOM node that exists outside the hierarchy of the parent component."  
 [Source: React Docs on Portals](https://react.dev/reference/react-dom/createPortal)

**Concept Explanation:**  
 **React Portals** allow you to render a component outside its normal parent DOM hierarchy. This is especially useful for UI components like modals, tooltips, or dropdowns that should not be confined by parent elements for layout purposes.

**Example:**

```jsx
import ReactDOM from "react-dom";

function Modal({ children }) {
  return ReactDOM.createPortal(
    <div className="modal">{children}</div>,
    document.getElementById("modal-root")
  );
}
```

**Use Cases:**

- Creating modals, tooltips, or dropdowns that need to escape the parent’s overflow or stacking context.
- Rendering elements outside of a component’s main render tree for better control over the layout.

---

### 10. **What are Custom Hooks in React?**

**Official Definition (React Docs):**  
 "Custom hooks are a mechanism in React for reusing stateful logic between components."  
 [Source: React Docs on Custom Hooks](https://react.dev/reference/react/hooks)

**Concept Explanation:**  
 **Custom Hooks** allow developers to extract and reuse stateful logic across different components without duplicating code. Hooks are just regular JavaScript functions that can utilize other hooks like `useState`, `useEffect`, etc.

**Example:**

```jsx
function useFetch(url) {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch(url)
      .then((response) => response.json())
      .then((json) => setData(json));
  }, [url]);

  return data;
}

function App() {
  const data = useFetch("https://api.example.com/data");
  return <div>{data ? data.title : "Loading..."}</div>;
}
```

**Use Cases:**

- Reusing logic like data fetching, form handling, or event listeners across multiple components.
- Abstracting complex logic into reusable functions to make components cleaner.
- Simplifying code maintenance by centralizing repeated functionality.

---

# Some other concepts

Here are some advanced React concepts that have not been covered so far, explained in detail with official documentation definitions, in-depth explanations, examples, and use cases.

---

### 1. **What is Reconciliation in React?**

**Official Definition (React Docs):**  
 "Reconciliation is the process through which React updates the DOM to match the component tree after changes to the state or props."  
 [Source: React Docs on Reconciliation](https://react.dev/learn/reconciliation)

**Concept Explanation:**  
 **Reconciliation** is React’s diffing algorithm that determines how to efficiently update the UI based on changes to the component's state or props. React uses a virtual DOM (a lightweight copy of the real DOM) and compares it with the previous version to detect changes. It then updates only the parts of the real DOM that have changed, minimizing unnecessary re-renders and improving performance.

Key factors in Reconciliation:

- **Key Props**: React uses the `key` prop to determine if elements have changed position or should be updated.
- **Diffing Algorithm**: React compares old and new virtual DOM trees, performing updates only when there are differences.

**Example:**

```jsx
function ListItems({ items }) {
  return (
    <ul>
      {items.map((item) => (
        <li key={item.id}>{item.name}</li>
      ))}
    </ul>
  );
}
```

In this example, React uses the `key` prop (the unique `id` of each item) to efficiently update the list when the `items` array changes.

**Use Cases:**

- Updating large data lists with minimal DOM updates.
- Handling real-time data updates, such as chat messages, notifications, or news feeds.
- Avoiding performance bottlenecks by ensuring efficient updates in dynamic UIs.

---

### 3. **What is React’s Fiber Architecture?**

**Official Definition (React Docs):**  
 "Fiber is a reimplementation of React's core algorithm to enable incremental rendering of the virtual DOM."  
 [Source: React Docs on Fiber](https://react.dev/learn/react-fiber)

**Concept Explanation:**  
 **React Fiber** is the re-architecture of React’s rendering engine introduced in React 16. It improves how React handles the rendering process by breaking down updates into smaller units of work, called fibers. This allows React to split rendering work into multiple chunks and pause/resume rendering as needed. This is particularly helpful for improving the responsiveness of UIs by ensuring that high-priority tasks (e.g., user inputs or animations) aren't blocked by lower-priority tasks.

Fiber enables **concurrent rendering**, meaning React can work on multiple tasks in parallel without blocking the main thread. This leads to smoother user interfaces, especially in complex apps.

**Example (Internal):**

- You don’t directly use Fiber, but React internally uses it to optimize updates and rendering. It prioritizes critical tasks, like user inputs, over lower-priority tasks, such as data fetching or background renders.

**Use Cases:**

- Complex, interactive UIs that require smooth animations and quick responsiveness.
- Applications with heavy background computations or data fetching, where UI responsiveness is crucial.
- Incremental rendering of content on slower devices or networks.

---

### 4. **What is a Render Prop in React?**

**Official Definition (React Docs):**  
 "A render prop is a function that a component uses to know what to render."  
 [Source: React Docs on Render Props](https://react.dev/learn/render-props)

**Concept Explanation:**  
 A **Render Prop** is a pattern in React where a component’s children are passed as a function, allowing logic to be shared between components. Instead of composing components directly, you use a function (the render prop) to control how the child component renders, providing greater flexibility.

Render props help when you need to reuse component logic, such as when handling hover states, fetching data, or managing input fields.

**Example:**

```jsx
function DataFetcher({ render }) {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch("/api/data")
      .then((response) => response.json())
      .then(setData);
  }, []);

  return render(data);
}

function App() {
  return (
    <DataFetcher
      render={(data) =>
        data ? <div>{data.title}</div> : <div>Loading...</div>
      }
    />
  );
}
```

**Use Cases:**

- Sharing logic across different components without using higher-order components (HOCs).
- Customizing the rendering of child components based on dynamic data or logic.
- Managing complex interactions like drag-and-drop or form field validation in reusable ways.

---

### 5. **What are Hooks Rules in React?**

**Official Definition (React Docs):**  
 "There are two rules you must follow when using Hooks: Only call Hooks at the top level and only call Hooks from React functions."  
 [Source: React Docs on Hooks Rules](https://react.dev/learn/rules-of-hooks)

**Concept Explanation:**  
 The **Rules of Hooks** are essential guidelines you must follow when working with React hooks:

1.  **Only call hooks at the top level**: Hooks should be called at the top level of your component or custom hook. This ensures that hooks are called in the same order on every render. You cannot use hooks inside loops, conditions, or nested functions.
2.  **Only call hooks from React functions**: Hooks must be called inside a React function component or a custom hook. You cannot use hooks in regular JavaScript functions.

Violating these rules will break React’s ability to track the state and hooks correctly, leading to unpredictable behavior.

**Example:**

```jsx
// Correct usage
function MyComponent() {
  const [count, setCount] = useState(0);
  return <div>{count}</div>;
}

// Incorrect usage: Violates rule by calling

hook inside conditional
function MyComponent() {
  if (true) {
    const [count, setCount] = useState(0);
  }
  return <div>Incorrect</div>;
}
```

**Use Cases:**

- Ensuring consistent and predictable hook behavior across renders.
- Avoiding common errors like out-of-order hooks execution, which can lead to broken state or side effects.
- Maintaining code readability and ensuring proper state management within components and custom hooks.

---

# Check for [Part-2 From official docs](../Reactjs-2/README.md)
