# Reacting to Input with State

React provides a declarative way to manage user interface (UI) interactions, allowing developers to describe how the UI should look based on different states instead of directly manipulating individual elements. This approach enhances clarity, maintainability, and scalability in your applications. Below, we'll explore the key concepts from the official documentation on [Reacting to Input with State](https://react.dev/learn/reacting-to-input-with-state).

---

## Understanding Declarative vs. Imperative Programming

In **declarative programming**, you describe what the UI should look like for each state, while in **imperative programming**, you give explicit instructions on how to achieve that state.

### Declarative Programming in React:

- You express how the UI should appear based on the current state.
- React takes care of updating the UI when the state changes.

### Imperative Programming:

- You have to write the step-by-step instructions for every UI update, which can become complex and hard to manage.

### Analogy:

- Think of declarative programming as telling a taxi driver where you want to go. The driver (React) figures out the best route.
- In contrast, imperative programming is like giving turn-by-turn directions to a driver (JavaScript) who follows your commands without understanding your destination.

---

## Visualizing Different States

When designing a component, you first identify all the possible visual states it can be in:

1. **Empty**: The form has a disabled "Submit" button.
2. **Typing**: The form has an enabled "Submit" button.
3. **Submitting**: The form is completely disabled, and a spinner appears.
4. **Success**: A "Thank you" message replaces the form.
5. **Error**: The form is enabled again with an error message.

### Mockup Example:

Create a mockup of these states to visualize how the component should look without implementing any logic.

```jsx
export default function Form({ status = "empty" }) {
  if (status === "success") {
    return <h1>That's right!</h1>;
  }
  return (
    <>
      <h2>City quiz</h2>
      <p>
        In which city is there a billboard that turns air into drinkable water?
      </p>
      <form>
        <textarea />
        <br />
        <button>Submit</button>
      </form>
    </>
  );
}
```

---

## Triggering State Changes

State updates can be triggered by:

- **Human inputs**: User interactions like clicking buttons or typing in fields.
- **Computer inputs**: Responses from network requests or other asynchronous actions.

### Example of State Transitions:

- Typing in the textarea changes the state from "Empty" to "Typing."
- Clicking "Submit" changes the state to "Submitting."
- A successful network response changes the state to "Success."
- A failed response returns to "Typing" and displays an error message.

---

## Managing State with `useState`

You will represent these visual states in memory using React's `useState` hook. Start with the essential pieces of state required for your component:

```jsx
const [answer, setAnswer] = useState("");
const [error, setError] = useState(null);
const [status, setStatus] = useState("typing"); // Possible values: 'typing', 'submitting', 'success'
```

### Reducing Complexity:

It's crucial to minimize the number of state variables to avoid paradoxes. For example, instead of managing `isEmpty` and `isTyping` separately, derive their values from a single `answer` state:

- **Eliminate Redundant States**: If `answer.length === 0`, the form is empty; if not, it's typing.
- **Consolidate Status**: Keep only essential states like `answer`, `error`, and `status`.

---

## Connecting Event Handlers

The final step is to connect event handlers that will update the state based on user interactions:

### Complete Form Implementation:

```jsx
import { useState } from "react";

export default function Form() {
  const [answer, setAnswer] = useState("");
  const [error, setError] = useState(null);
  const [status, setStatus] = useState("typing");

  if (status === "success") {
    return <h1>That's right!</h1>;
  }

  async function handleSubmit(e) {
    e.preventDefault();
    setStatus("submitting");
    try {
      await submitForm(answer); // Assume this function makes an API call
      setStatus("success");
    } catch (err) {
      setStatus("typing");
      setError(err);
    }
  }

  function handleTextareaChange(e) {
    setAnswer(e.target.value);
  }

  return (
    <>
      <h2>City quiz</h2>
      <p>
        In which city is there a billboard that turns air into drinkable water?
      </p>
      <form onSubmit={handleSubmit}>
        <textarea
          value={answer}
          onChange={handleTextareaChange}
          disabled={status === "submitting"}
        />
        <br />
        <button disabled={status === "empty" || status === "submitting"}>
          Submit
        </button>
        {status === "error" && (
          <p className="Error">Good guess but a wrong answer. Try again!</p>
        )}
      </form>
    </>
  );
}
```

### Explanation:

- The `handleSubmit` function manages the submission logic, updating the state based on the success or failure of the submission.
- The `handleTextareaChange` function updates the answer state as the user types.

---

## Conclusion

React's declarative approach to UI programming allows developers to describe the various states of a component and how to transition between them seamlessly. By managing inputs and states effectively, you can build interactive and user-friendly applications with minimal complexity. For further details, refer to the official documentation on [Reacting to Input with State](https://react.dev/learn/reacting-to-input-with-state).

# Reacting to Input with State

React provides a declarative way to manipulate the UI. Instead of manipulating individual pieces of the UI directly, you describe the different states that your component can be in, and switch between them in response to user input. This is similar to how designers think about the UI.

## You will learn

- How declarative UI programming differs from imperative UI programming
- How to enumerate the different visual states your component can be in
- How to trigger the changes between the different visual states from code

## How declarative UI compares to imperative

When you design UI interactions, you probably think about how the UI changes in response to user actions. Consider a form that lets the user submit an answer:

- When you type something into the form, the “Submit” button becomes enabled.
- When you press “Submit,” both the form and the button become disabled, and a spinner appears.
- If the network request succeeds, the form gets hidden, and the “Thank you” message appears.
- If the network request fails, an error message appears, and the form becomes enabled again.

In imperative programming, the above corresponds directly to how you implement interaction. You have to write the exact instructions to manipulate the UI depending on what just happened. Here’s another way to think about this: imagine riding next to someone in a car and telling them turn by turn where to go.

In a car driven by an anxious-looking person representing JavaScript, a passenger orders the driver to execute a sequence of complicated turn-by-turn navigations. They don’t know where you want to go; they just follow your commands. (And if you get the directions wrong, you end up in the wrong place!) It’s called imperative because you have to “command” each element, from the spinner to the button, telling the computer how to update the UI.

### Manipulating the UI imperatively

Manipulating the UI imperatively works well enough for isolated examples, but it gets exponentially more difficult to manage in more complex systems. Imagine updating a page full of different forms like this one. Adding a new UI element or a new interaction would require carefully checking all existing code to make sure you haven’t introduced a bug (for example, forgetting to show or hide something).

React was built to solve this problem. In React, you don’t directly manipulate the UI—meaning you don’t enable, disable, show, or hide components directly. Instead, you declare what you want to show, and React figures out how to update the UI. Think of getting into a taxi and telling the driver where you want to go instead of telling them exactly where to turn. It’s the driver’s job to get you there, and they might even know some shortcuts you haven’t considered!

## Thinking about UI declaratively

You’ve seen how to implement a form imperatively above. To better understand how to think in React, you’ll walk through reimplementing this UI in React below:

1. Identify your component’s different visual states
2. Determine what triggers those state changes
3. Represent the state in memory using `useState`
4. Remove any non-essential state variables
5. Connect the event handlers to set the state

### Step 1: Identify your component’s different visual states

First, visualize all the different “states” of the UI the user might see:

- **Empty**: Form has a disabled “Submit” button.
- **Typing**: Form has an enabled “Submit” button.
- **Submitting**: Form is completely disabled. Spinner is shown.
- **Success**: “Thank you” message is shown instead of a form.
- **Error**: Same as Typing state, but with an extra error message.

Just like a designer, you’ll want to create “mocks” for the different states before you add logic.

### Step 2: Determine what triggers those state changes

You can trigger state updates in response to two kinds of inputs:

- **Human inputs**, like clicking a button or typing in a field.
- **Computer inputs**, like a network response arriving.

For the form you’re developing, you will need to change state in response to a few different inputs:

- Changing the text input (human) should switch it from the Empty state to the Typing state or back.
- Clicking the Submit button (human) should switch it to the Submitting state.
- Successful network response (computer) should switch it to the Success state.
- Failed network response (computer) should switch it to the Error state with the matching error message.

### Step 3: Represent the state in memory with `useState`

Next, represent the visual states of your component in memory with `useState`. Simplicity is key; you want as few “moving pieces” as possible.

Start with the essential state variables:

```javascript
const [answer, setAnswer] = useState("");
const [error, setError] = useState(null);
const [status, setStatus] = useState("typing"); // 'typing', 'submitting', or 'success'
```

### Step 4: Remove any non-essential state variables

Avoid duplication in the state content so you’re only tracking what is essential. Spending a little time on refactoring your state structure will make your components easier to understand.

### Step 5: Connect the event handlers to set state

Create event handlers that update the state. Below is the final form, with all event handlers wired up:

```javascript
import { useState } from "react";

export default function Form() {
  const [answer, setAnswer] = useState("");
  const [error, setError] = useState(null);
  const [status, setStatus] = useState("typing"); // 'typing', 'submitting', or 'success'

  const handleSubmit = async (e) => {
    e.preventDefault();
    setStatus("submitting");
    setError(null);
    try {
      await submitForm(answer);
      setStatus("success");
    } catch (err) {
      setError(err);
      setStatus("typing");
    }
  };

  return (
    <>
      <h2>City quiz</h2>
      <p>
        In which city is there a billboard that turns air into drinkable water?
      </p>
      <form onSubmit={handleSubmit}>
        <textarea
          value={answer}
          onChange={(e) => setAnswer(e.target.value)}
          disabled={status === "submitting"}
        />
        <br />
        <button disabled={answer.length === 0 || status === "submitting"}>
          Submit
        </button>
        {error && <p className="Error">{error.message}</p>}
      </form>
    </>
  );
}

function submitForm(answer) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      const shouldError = answer.toLowerCase() !== "lima";
      if (shouldError) {
        reject(new Error("Good guess but a wrong answer. Try again!"));
      } else {
        resolve();
      }
    }, 1500);
  });
}
```

Although this code is longer than the original imperative example, it is much less fragile. Expressing all interactions as state changes lets you later introduce new visual states without breaking existing ones, and change what should be displayed in each state without changing the logic of the interaction itself.

## Recap

- Declarative programming means describing the UI for each visual state rather than micromanaging the UI (imperative).
- When developing a component:
  - Identify all its visual states.
  - Determine the human and computer triggers for state changes.
  - Model the state with `useState`.
  - Remove non-essential state to avoid bugs and paradoxes.
  - Connect the event handlers to set state.

# Choosing the State Structure

Structuring state effectively can greatly impact a component's maintainability and debuggability. Here’s a guide to help you make informed choices when organizing state.

## You Will Learn

- When to use a single vs. multiple state variables
- What to avoid when organizing state
- How to fix common issues with the state structure
- Principles for structuring state

### Principles for Structuring State

When writing a component with state, consider the following principles:

1. **Group Related State**: If multiple state variables change together, merge them into a single variable to ensure consistency.

   **Example**: Instead of separate x and y coordinates:

   ```javascript
   const [position, setPosition] = useState({ x: 0, y: 0 });
   ```

2. **Avoid Contradictions in State**: Prevent scenarios where multiple state variables can conflict. A unified status variable can help.

   **Improvement**:
   Instead of `isSending` and `isSent`, use a single `status` variable with possible states: 'typing', 'sending', 'sent'.

3. **Avoid Redundant State**: Calculate values from existing props or state rather than storing derived data.

   **Example**: Instead of tracking `fullName`:

   ```javascript
   const fullName = firstName + " " + lastName;
   ```

4. **Avoid Duplication in State**: Eliminate duplicate data across state variables to simplify updates and prevent inconsistencies.

   **Improvement**: Instead of storing `selectedItem` directly, keep just the `selectedId` and derive the item as needed.

5. **Avoid Deeply Nested State**: Simplify updates by flattening state structures, reducing complexity.

   **Example**: Instead of a nested object for a travel plan, use a flat structure with IDs and a mapping to places.

### In Practice

#### Group Related State

Use a single state object when multiple values are interdependent:

```javascript
const [position, setPosition] = useState({ x: 0, y: 0 });
```

#### Avoid Contradictions in State

Unify conflicting states:

```javascript
const [status, setStatus] = useState("typing");
```

#### Avoid Redundant State

Calculate values on render:

```javascript
const fullName = firstName + " " + lastName;
```

#### Avoid Duplication in State

Use identifiers instead of duplicating entire objects:

```javascript
const [selectedId, setSelectedId] = useState(0);
const selectedItem = items.find((item) => item.id === selectedId);
```

#### Avoid Deeply Nested State

Flatten your state to simplify updates:

```javascript
const initialTravelPlan = {
  0: { id: 0, title: "(Root)", childIds: [1, 2] },
  1: { id: 1, title: "Earth", childIds: [] },
};
```

### Recap

- Merge related state variables.
- Choose state structure to avoid impossible states.
- Structure state to minimize update errors.
- Eliminate redundant and duplicated state.
- Use IDs for selections instead of full objects.
- Flatten deeply nested state structures for easier updates.

# Sharing State Between Components

Sometimes, you want the state of two components to always change together. To achieve this, remove state from both components, move it to their closest common parent, and then pass it down via props. This process is known as **lifting state up**, and it’s one of the most common tasks in React development.

## What You Will Learn

- How to share state between components by lifting it up
- The difference between controlled and uncontrolled components
- Lifting state up through a practical example

---

## Example: Accordion Component

In this example, a parent `Accordion` component renders two separate `Panel` components. Each `Panel` has a boolean `isActive` state that determines whether its content is visible.

### Initial Setup

The initial implementation allows each panel to operate independently. Here's how it looks:

```javascript
import { useState } from "react";

function Panel({ title, children }) {
  const [isActive, setIsActive] = useState(false);
  return (
    <section className="panel">
      <h3>{title}</h3>
      {isActive ? (
        <p>{children}</p>
      ) : (
        <button onClick={() => setIsActive(true)}>Show</button>
      )}
    </section>
  );
}

export default function Accordion() {
  return (
    <>
      <h2>Almaty, Kazakhstan</h2>
      <Panel title="About">
        With a population of about 2 million, Almaty is Kazakhstan's largest
        city.
      </Panel>
      <Panel title="Etymology">
        The name comes from <span lang="kk-KZ">алма</span>, the Kazakh word for
        "apple".
      </Panel>
    </>
  );
}
```

### Behavior

Pressing the button on one panel does not affect the other, as they maintain their independent state.

---

## Lifting State Up

Now, let’s modify the design so that only one panel is expanded at a time. When one panel expands, the other should collapse.

### Step 1: Remove State from Child Components

The first step is to remove the `isActive` state from the `Panel` component and pass it down from the parent instead.

Change the `Panel` component to accept `isActive` as a prop:

```javascript
function Panel({ title, children, isActive }) {
  return (
    <section className="panel">
      <h3>{title}</h3>
      {isActive ? (
        <p>{children}</p>
      ) : (
        <button onClick={() => setIsActive(true)}>Show</button>
      )}
    </section>
  );
}
```

### Step 2: Pass Hardcoded Data from the Parent

Now, let’s move to the `Accordion` component and pass hardcoded values to the `Panel` components.

```javascript
export default function Accordion() {
  return (
    <>
      <h2>Almaty, Kazakhstan</h2>
      <Panel title="About" isActive={true}>
        With a population of about 2 million, Almaty is Kazakhstan's largest
        city.
      </Panel>
      <Panel title="Etymology" isActive={true}>
        The name comes from <span lang="kk-KZ">алма</span>, the Kazakh word for
        "apple".
      </Panel>
    </>
  );
}
```

### Step 3: Add State to the Common Parent

Next, we need the `Accordion` component to keep track of which panel is active. We'll use a number to represent the active panel index.

```javascript
import { useState } from "react";

export default function Accordion() {
  const [activeIndex, setActiveIndex] = useState(0);
  return (
    <>
      <h2>Almaty, Kazakhstan</h2>
      <Panel
        title="About"
        isActive={activeIndex === 0}
        onShow={() => setActiveIndex(0)}
      >
        With a population of about 2 million, Almaty is Kazakhstan's largest
        city.
      </Panel>
      <Panel
        title="Etymology"
        isActive={activeIndex === 1}
        onShow={() => setActiveIndex(1)}
      >
        The name comes from <span lang="kk-KZ">алма</span>, the Kazakh word for
        "apple".
      </Panel>
    </>
  );
}
```

### Update the `Panel` Component

The `Panel` component's button should now use the `onShow` prop to trigger state changes in the parent:

```javascript
function Panel({ title, children, isActive, onShow }) {
  return (
    <section className="panel">
      <h3>{title}</h3>
      {isActive ? <p>{children}</p> : <button onClick={onShow}>Show</button>}
    </section>
  );
}
```

---

## Recap

- **Lifting State Up:** Move shared state to a common parent component.
- **Passing Props:** Send necessary data and handlers down to child components via props.
- **Controlled Components:** The parent manages the state, while children react to prop changes.

By lifting state up, you coordinate multiple components effectively, ensuring that only one panel is active at any time.

# Preserving and Resetting State in React

## Understanding Component State

State in React is isolated between components. React manages state based on the component's position in the UI tree, determining when to preserve or reset state across re-renders.

### Key Learning Objectives

1. **When React Preserves or Resets State**: Understand the conditions that influence state retention.
2. **Forcing State Reset**: Learn how to programmatically reset a component's state.
3. **Impact of Keys and Types on State**: Recognize how the use of keys and types can affect state preservation.

---

## The React Render Tree

### Component Structure

In React, state isn't just contained within the component; it's managed by React itself. Each piece of state is linked to a specific component by its location in the render tree.

#### Example: Counter Component

```jsx
import { useState } from "react";

export default function App() {
  const counter = <Counter />;
  return (
    <div>
      {counter}
      {counter}
    </div>
  );
}

function Counter() {
  const [score, setScore] = useState(0);
  const [hover, setHover] = useState(false);

  let className = "counter";
  if (hover) {
    className += " hover";
  }

  return (
    <div
      className={className}
      onPointerEnter={() => setHover(true)}
      onPointerLeave={() => setHover(false)}
    >
      <h1>{score}</h1>
      <button onClick={() => setScore(score + 1)}>Add one</button>
    </div>
  );
}
```

### Render Tree Representation

When rendered, the tree looks like this:

- **Root Node (`<div>`)**
  - **Child Node 1 (`<Counter>`)**
    - **State (`score`: 0)**
  - **Child Node 2 (`<Counter>`)**
    - **State (`score`: 0)**

In this scenario, even though there is only one `<Counter />` component being reused, each instance maintains its own independent state.

### Independent State Management

- Each counter manages its state separately. Actions taken on one counter (e.g., clicking the button) do not affect the other. This is fundamental to React's design, where each component's state is isolated.

---

## React State Persistence

### Maintaining State

React will keep a component's state as long as it remains rendered at the same position in the UI tree. For example, if a component is conditionally rendered and removed from the tree, its state will be lost.

#### Example: Conditional Rendering with a Checkbox

```jsx
import { useState } from "react";

export default function App() {
  const [showB, setShowB] = useState(true);
  return (
    <div>
      <Counter />
      {showB && <Counter />}
      <label>
        <input
          type="checkbox"
          checked={showB}
          onChange={(e) => {
            setShowB(e.target.checked);
          }}
        />
        Render the second counter
      </label>
    </div>
  );
}
```

- **State Disappearance**: When the second counter is unchecked, its state disappears entirely. This is due to the fact that React destroys the component and its state upon removal.

### Adding and Removing Components

When a component is added back into the render tree, it initializes its state from scratch.

- **Initial State**: Each time the component is rendered anew, its state starts at the defined initial value (e.g., `score = 0`).

---

## Same Component, Different States

### React's State Persistence Mechanism

React preserves a component's state when it is consistently rendered at the same position in the UI tree. Even if the component receives different props, its state remains intact.

#### Example: Dynamic Styling

```jsx
import { useState } from "react";

export default function App() {
  const [isFancy, setIsFancy] = useState(false);
  return (
    <div>
      {isFancy ? <Counter isFancy={true} /> : <Counter isFancy={false} />}
      <label>
        <input
          type="checkbox"
          checked={isFancy}
          onChange={(e) => {
            setIsFancy(e.target.checked);
          }}
        />
        Use fancy styling
      </label>
    </div>
  );
}
```

- **Consistent Position**: In this case, regardless of whether `isFancy` is true or false, the state of `<Counter />` does not reset because it remains at the same position in the render tree.

---

## Important Considerations

### Component Position vs. JSX Structure

The critical point to remember is that it’s the position of the component in the UI tree that determines whether state is preserved, not how you structure your JSX.

#### Example of Misleading Expectations

```jsx
import { useState } from "react";

export default function App() {
  const [isFancy, setIsFancy] = useState(false);
  if (isFancy) {
    return (
      <div>
        <Counter isFancy={true} />
        <label>
          <input
            type="checkbox"
            checked={isFancy}
            onChange={(e) => {
              setIsFancy(e.target.checked);
            }}
          />
          Use fancy styling
        </label>
      </div>
    );
  }
  return (
    <div>
      <Counter isFancy={false} />
      <label>
        <input
          type="checkbox"
          checked={isFancy}
          onChange={(e) => {
            setIsFancy(e.target.checked);
          }}
        />
        Use fancy styling
      </label>
    </div>
  );
}
```

- **Unexpected State Reset**: You might think that toggling the checkbox would reset the counter's state, but it doesn’t. Both `<Counter />` tags are rendered at the same position, which means React treats them as the same component.

## Different Components at the Same Position Reset State

In this example, ticking the checkbox will replace `<Counter>` with a `<p>`:

### App.js

```javascript
import { useState } from "react";

export default function App() {
  const [isPaused, setIsPaused] = useState(false);
  return (
    <div>
      {isPaused ? <p>See you later!</p> : <Counter />}
      <label>
        <input
          type="checkbox"
          checked={isPaused}
          onChange={(e) => {
            setIsPaused(e.target.checked);
          }}
        />
        Take a break
      </label>
    </div>
  );
}

function Counter() {
  const [score, setScore] = useState(0);
  const [hover, setHover] = useState(false);

  let className = "counter";
  if (hover) {
    className += " hover";
  }

  return (
    <div
      className={className}
      onPointerEnter={() => setHover(true)}
      onPointerLeave={() => setHover(false)}
    >
      <h1>{score}</h1>
      <button onClick={() => setScore(score + 1)}>Add one</button>
    </div>
  );
}
```

### Explanation

When you switch between different component types at the same position, the state is reset. Initially, `<Counter>` is rendered, but when you replace it with `<p>`, React removes `<Counter>` from the UI tree and destroys its state.

#### Diagram

- **Before Ticking Checkbox**: `<Counter>` with state `score = 3`
- **After Ticking Checkbox**: `<Counter>` is removed, replaced by `<p>`

### Resetting State with Different Component Types

Switching components resets the entire subtree state. Increment the counter and then tick the checkbox:

### App.js

```javascript
import { useState } from "react";

export default function App() {
  const [isFancy, setIsFancy] = useState(false);
  return (
    <div>
      {isFancy ? (
        <div>
          <Counter isFancy={true} />
        </div>
      ) : (
        <section>
          <Counter isFancy={false} />
        </section>
      )}
      <label>
        <input
          type="checkbox"
          checked={isFancy}
          onChange={(e) => {
            setIsFancy(e.target.checked);
          }}
        />
        Use fancy styling
      </label>
    </div>
  );
}

function Counter({ isFancy }) {
  const [score, setScore] = useState(0);
  const [hover, setHover] = useState(false);

  let className = "counter";
  if (hover) {
    className += " hover";
  }
  if (isFancy) {
    className += " fancy";
  }

  return (
    <div
      className={className}
      onPointerEnter={() => setHover(true)}
      onPointerLeave={() => setHover(false)}
    >
      <h1>{score}</h1>
      <button onClick={() => setScore(score + 1)}>Add one</button>
    </div>
  );
}
```

### Explanation

When you toggle the checkbox, the `<Counter>` state resets because you are effectively rendering a different component at the same position (from `<div>` to `<section>`).

#### Diagram

- **Before Ticking Checkbox**: `<Counter>` with state `score = 3`
- **After Ticking Checkbox**: State resets to `score = 0`.

### Avoid Nesting Component Definitions

Nesting component definitions can lead to state resets. For example, if `MyTextField` is defined inside `MyComponent`, clicking the button will reset its state because a new `MyTextField` function is created each time `MyComponent` re-renders.

### Resetting State in a Scoreboard Example

In a scoreboard application where two players keep track of their scores, switching players should reset their scores:

### App.js

```javascript
import { useState } from "react";

export default function Scoreboard() {
  const [isPlayerA, setIsPlayerA] = useState(true);
  return (
    <div>
      {isPlayerA ? <Counter person="Taylor" /> : <Counter person="Sarah" />}
      <button
        onClick={() => {
          setIsPlayerA(!isPlayerA);
        }}
      >
        Next player!
      </button>
    </div>
  );
}

function Counter({ person }) {
  const [score, setScore] = useState(0);
  const [hover, setHover] = useState(false);

  let className = "counter";
  if (hover) {
    className += " hover";
  }

  return (
    <div
      className={className}
      onPointerEnter={() => setHover(true)}
      onPointerLeave={() => setHover(false)}
    >
      <h1>
        {person}'s score: {score}
      </h1>
      <button onClick={() => setScore(score + 1)}>Add one</button>
    </div>
  );
}
```

### Explanation

When you change the player, the score is preserved because both counters appear in the same position. To reset their state, you can render them in different positions or give each component an explicit identity with a `key`.

### Option 1: Render Components in Different Positions

Rendering components in different positions helps to keep their state independent:

```javascript
{
  isPlayerA && <Counter person="Taylor" />;
}
{
  !isPlayerA && <Counter person="Sarah" />;
}
```

### Option 2: Reset State with a Key

Using keys allows React to distinguish between components. By giving them different keys, you ensure their states are reset:

```javascript
{
  isPlayerA ? (
    <Counter key="Taylor" person="Taylor" />
  ) : (
    <Counter key="Sarah" person="Sarah" />
  );
}
```

### Resetting State in Forms

In a chat application, you may want to reset the text input state when switching contacts. Adding a key to the `<Chat>` component ensures the state resets:

```javascript
<Chat key={to.id} contact={to} />
```

### Recap

- React keeps state for as long as the same component is rendered at the same position.
- State is associated with the tree position, not JSX tags.
- You can force a subtree to reset its state by giving it a different key.
- Avoid nesting component definitions to prevent accidental state resets.
