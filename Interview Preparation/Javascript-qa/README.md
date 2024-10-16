### 1. **What is the difference between `==` and `===`?**

- **Explanation**: The `==` operator is the equality operator that performs type coercion, meaning it converts the operands to the same type before making the comparison. The `===` operator is the strict equality operator, which checks both value and type without performing type coercion.

- **Example**:

```javascript
console.log(5 == "5"); // true (type coercion)
console.log(5 === "5"); // false (different types)
```

### 2. **What is a closure in JavaScript?**

- **Explanation**: A closure is a function that retains access to its lexical scope, even when the function is executed outside that scope. Closures are often used to create private variables or functions.

- **Example**:

```javascript
function makeCounter() {
  let count = 0; // private variable
  return function () {
    count += 1;
    return count;
  };
}

const counter = makeCounter();
console.log(counter()); // 1
console.log(counter()); // 2
```

### 3. **What are Promises in JavaScript?**

- **Explanation**: A Promise is an object that represents the eventual completion (or failure) of an asynchronous operation and its resulting value. It can be in one of three states: pending, fulfilled, or rejected.

- **Example**:

```javascript
const myPromise = new Promise((resolve, reject) => {
  // Simulate an asynchronous operation
  setTimeout(() => {
    const success = true; // change to false to simulate error
    if (success) {
      resolve("Operation successful!");
    } else {
      reject("Operation failed.");
    }
  }, 1000);
});

myPromise
  .then((result) => console.log(result)) // Operation successful!
  .catch((error) => console.error(error));
```

### 4. **What is the difference between `null` and `undefined`?**

- **Explanation**: `null` is an intentional absence of any object value, while `undefined` indicates that a variable has been declared but has not yet been assigned a value. `null` is an object, whereas `undefined` is of type `undefined`.

- **Example**:

```javascript
let a;
let b = null;

console.log(a); // undefined
console.log(b); // null
console.log(typeof a); // undefined
console.log(typeof b); // object
```

### 5. **What is the Event Loop in JavaScript?**

- **Explanation**: The Event Loop is a mechanism that allows JavaScript to perform non-blocking operations by using a single-threaded model. It manages the execution of code, collecting and processing events, and executing queued sub-tasks.

- **Example**:

```javascript
console.log("Start");

setTimeout(() => {
  console.log("Timeout");
}, 0);

Promise.resolve().then(() => {
  console.log("Promise");
});

console.log("End");

// Output:
// Start
// End
// Promise
// Timeout
```

### 6. **Explain the concept of `this` in JavaScript.**

- **Explanation**: The value of `this` in JavaScript depends on how a function is called. In a method, `this` refers to the owner object. In a function, `this` refers to the global object (or `undefined` in strict mode). In an arrow function, `this` retains the value from the enclosing lexical scope.

- **Example**:

```javascript
const obj = {
  value: 42,
  method: function () {
    console.log(this.value);
  },
};

obj.method(); // 42

const method = obj.method;
method(); // undefined (or throws an error in strict mode)

const arrowMethod = () => {
  console.log(this.value);
};

arrowMethod(); // undefined (in global scope)
```

### 7. **What are the different ways to create objects in JavaScript?**

- **Explanation**: Objects can be created in several ways, including object literals, constructor functions, the `Object.create()` method, and ES6 classes.

- **Example**:

```javascript
// Object Literal
const obj1 = {
  name: "Alice",
  age: 25,
};

// Constructor Function
function Person(name, age) {
  this.name = name;
  this.age = age;
}
const obj2 = new Person("Bob", 30);

// Object.create()
const proto = {
  greet() {
    console.log("Hello!");
  },
};
const obj3 = Object.create(proto);
obj3.name = "Charlie";

// ES6 Class
class Animal {
  constructor(name) {
    this.name = name;
  }
  speak() {
    console.log(`${this.name} makes a noise.`);
  }
}
const obj4 = new Animal("Dog");
```

### 8. **Explain how prototypal inheritance works in JavaScript.**

- **Explanation**: Prototypal inheritance allows objects to inherit properties and methods from other objects. Each object has an internal link to another object called its prototype. This allows for the sharing of methods and properties without duplication.

- **Example**:

```javascript
const animal = {
  speak() {
    console.log("Animal speaks");
  },
};

const dog = Object.create(animal);
dog.speak = function () {
  console.log("Dog barks");
};

dog.speak(); // Dog barks
animal.speak(); // Animal speaks
```

### 9. **What is the purpose of the `bind`, `call`, and `apply` methods?**

- **Explanation**: These methods are used to explicitly set the value of `this` in functions. `bind` returns a new function with `this` bound to the provided value. `call` and `apply` invoke the function immediately with `this` set to the provided value, but `call` takes arguments separately, while `apply` takes an array of arguments.

- **Example**:

```javascript
function greet(greeting) {
  console.log(`${greeting}, my name is ${this.name}.`);
}

const person = { name: "Alice" };

const boundGreet = greet.bind(person);
boundGreet("Hello"); // Hello, my name is Alice.

greet.call(person, "Hi"); // Hi, my name is Alice.
greet.apply(person, ["Hey"]); // Hey, my name is Alice.
```

### 10. **What is the difference between `let`, `const`, and `var`?**

- **Explanation**: `var` is function-scoped and can be redeclared, `let` is block-scoped and cannot be redeclared within the same scope, and `const` is also block-scoped but must be initialized at the time of declaration and cannot be reassigned.

- **Example**:

```javascript
var x = 1;
if (true) {
  var x = 2; // same variable
  console.log(x); // 2
}
console.log(x); // 2

let y = 1;
if (true) {
  let y = 2; // different variable
  console.log(y); // 2
}
console.log(y); // 1

const z = 1;
// z = 2; // Error: Assignment to constant variable.
```

### 11. **What are template literals in JavaScript?**

- **Explanation**: Template literals are a way to create strings in JavaScript using backticks (`` ` ``). They allow for multi-line strings and string interpolation, which means you can embed expressions within strings using `${expression}`.

- **Example**:

```javascript
const name = "Alice";
const greeting = `Hello, ${name}!`;
console.log(greeting); // Hello, Alice!

const multiLine = `This is a string
that spans multiple lines.`;
console.log(multiLine);
```

### 12. **Explain the concept of the "this" keyword in JavaScript.**

- **Explanation**: The value of `this` depends on how a function is called. In the global context, `this` refers to the global object (e.g., `window` in browsers). In a method, `this` refers to the object that the method is called on. In a constructor function, `this` refers to the newly created instance. In arrow functions, `this` is lexically bound, meaning it retains the value of `this` from the enclosing context.

- **Example**:

```javascript
const obj = {
  name: "Alice",
  greet: function () {
    console.log(`Hello, my name is ${this.name}`);
  },
};
obj.greet(); // Hello, my name is Alice

const greetFunc = obj.greet;
greetFunc(); // Hello, my name is undefined (in non-strict mode)

const arrowGreet = () => {
  console.log(`Hello, my name is ${this.name}`);
};
arrowGreet(); // Hello, my name is undefined (in global scope)
```

### 13. **What is event delegation in JavaScript?**

- **Explanation**: Event delegation is a technique that involves using a single event listener on a parent element to manage events for multiple child elements. This improves performance and simplifies code by reducing the number of event listeners required.

- **Example**:

```html
<ul id="myList">
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
</ul>

<script>
  document.getElementById("myList").addEventListener("click", function (e) {
    if (e.target.tagName === "LI") {
      alert(`You clicked on ${e.target.textContent}`);
    }
  });
</script>
```

### 14. **What are higher-order functions in JavaScript?**

- **Explanation**: Higher-order functions are functions that take other functions as arguments or return functions as their result. They enable powerful functional programming patterns, such as callbacks and function composition.

- **Example**:

```javascript
function greet(name) {
  return `Hello, ${name}!`;
}

function processUserInput(callback) {
  const name = "Alice";
  console.log(callback(name));
}

processUserInput(greet); // Hello, Alice!
```

### 15. **What is the `setTimeout` function, and how does it work?**

- **Explanation**: `setTimeout` is a built-in JavaScript function that executes a function after a specified number of milliseconds. It returns a timeout ID that can be used to cancel the timeout with `clearTimeout`.

- **Example**:

```javascript
console.log("Start");

const timeoutId = setTimeout(() => {
  console.log("This runs after 1 second");
}, 1000);

console.log("End");

// To cancel the timeout
clearTimeout(timeoutId);
```

### 16. **What is the purpose of the `async` and `await` keywords?**

- **Explanation**: `async` and `await` are used to work with Promises in a more readable way. An `async` function always returns a Promise, and `await` can be used inside an `async` function to pause execution until the Promise is resolved.

- **Example**:

```javascript
function getData() {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve("Data received");
    }, 1000);
  });
}

async function fetchData() {
  const result = await getData();
  console.log(result); // Data received
}

fetchData();
```

### 17. **What is the difference between synchronous and asynchronous programming?**

- **Explanation**: Synchronous programming executes tasks sequentially, blocking the execution of subsequent code until the current task completes. Asynchronous programming allows tasks to run concurrently, enabling the execution of code while waiting for other operations (like network requests) to complete.

- **Example**:

```javascript
// Synchronous
console.log("Start");
console.log("End"); // 'End' is logged after 'Start'

// Asynchronous
console.log("Start");
setTimeout(() => {
  console.log("Timeout"); // 'Timeout' is logged after 1 second
}, 1000);
console.log("End"); // 'End' is logged immediately after 'Start'
```

### 18. **What are modules in JavaScript, and why are they used?**

- **Explanation**: Modules are a way to structure and encapsulate code in JavaScript, allowing for better organization and reusability. They help to avoid global namespace pollution and make it easier to manage dependencies. ES6 introduced a native module system using `import` and `export`.

- **Example**:

```javascript
// math.js (module)
export function add(a, b) {
  return a + b;
}

export function subtract(a, b) {
  return a - b;
}

// main.js
import { add, subtract } from "./math.js";

console.log(add(2, 3)); // 5
console.log(subtract(5, 2)); // 3
```

### 19. **Explain the concept of hoisting in JavaScript.**

- **Explanation**: Hoisting is a behavior in JavaScript where variable and function declarations are moved to the top of their containing scope during the compilation phase. However, only the declarations are hoisted, not the initializations.

- **Example**:

```javascript
console.log(x); // undefined
var x = 5;

function sayHello() {
  console.log("Hello");
}

sayHello(); // Hello
```

### 20. **What is the `typeof` operator?**

- **Explanation**: The `typeof` operator is used to determine the type of a variable or expression. It returns a string indicating the type, such as "undefined", "object", "boolean", "number", "string", "function", or "symbol".

- **Example**:

```javascript
console.log(typeof 42); // "number"
console.log(typeof "Hello"); // "string"
console.log(typeof true); // "boolean"
console.log(typeof null); // "object" (this is a known quirk)
console.log(typeof undefined); // "undefined"
console.log(typeof function () {}); // "function"
```

### 21. **What is the difference between `Object.freeze()` and `Object.seal()`?**

- **Explanation**: `Object.freeze()` makes an object immutable, preventing any modifications to existing properties or adding new properties. `Object.seal()` allows existing properties to be modified but prevents adding or removing properties.

- **Example**:

```javascript
const obj = { name: "Alice", age: 25 };

Object.freeze(obj);
obj.age = 30; // No effect
obj.gender = "female"; // No effect
console.log(obj); // { name: 'Alice', age: 25 }

const sealedObj = { name: "Bob", age: 30 };
Object.seal(sealedObj);
sealedObj.age = 35; // Allowed
sealedObj.gender = "male"; // No effect
console.log(sealedObj); // { name: 'Bob', age: 35 }
```

### 22. **What are the differences between `apply()`, `call()`, and `bind()`?**

- **Explanation**: `apply()` and `call()` invoke a function immediately with a specified `this` value. The difference is that `apply()` takes an array of arguments, while `call()` takes arguments individually. `bind()` returns a new function with a specified `this` value and any initial arguments but does not invoke it immediately.

- **Example**:

```javascript
function greet(greeting) {
  console.log(`${greeting}, my name is ${this.name}`);
}

const person = { name: "Alice" };

greet.call(person, "Hello"); // Hello, my name is Alice
greet.apply(person, ["Hi"]); // Hi, my name is Alice

const boundGreet = greet.bind(person, "Hey");
boundGreet(); // Hey, my name is Alice
```

### 23. **Explain the concept of "debouncing" and "throttling".**

- **Explanation**: Debouncing ensures that a function is only executed after a specified amount of time has passed since the last invocation, making it useful for handling events like resizing or scrolling. Throttling ensures that a function is only executed at most once in a specified time interval, preventing it from being called too frequently.

- **Example of Debouncing**:

```javascript
function debounce(func, delay) {
  let timeout;
  return function (...args) {
    clearTimeout(timeout);
    timeout = setTimeout(() => func.apply(this, args), delay);
  };
}

const handleResize = debounce(() => {
  console.log("Resized!");
}, 500);

window.addEventListener("resize", handleResize);
```

- **Example of Throttling**:

```javascript
function throttle(func, limit) {
  let lastFunc;
  let lastRan;
  return function (...args) {
    if (!lastRan) {
      func.apply(this, args);
      lastRan = Date.now();
    } else {
      clearTimeout(lastFunc);
      lastFunc = setTimeout(() => {
        if (Date.now() - lastRan >= limit) {
          func.apply(this, args);
          lastRan = Date.now();
        }
      }, limit - (Date.now() - lastRan));
    }
  };
}

const logScroll = throttle(() => {
  console.log("Scrolled!");
}, 1000);

window.addEventListener("scroll", logScroll);
```

### 24. **What is the purpose of the `JSON.stringify()` and `JSON.parse()` methods?**

- **Explanation**: `JSON.stringify()` converts a JavaScript object into a JSON string, while `JSON.parse()` converts a JSON string back into a JavaScript object. These methods are commonly used for data transmission between a client and a server.

- **Example**:

```javascript
const obj = { name: "Alice", age: 25 };
const jsonString = JSON.stringify(obj);
console.log(jsonString); // '{"name":"Alice","age":25}'

const parsedObj = JSON.parse(jsonString);
console.log(parsedObj); // { name: 'Alice', age: 25 }
```

### 25. **What is the purpose of the `Promise.all()` method?**

- **Explanation**: `Promise.all()` takes an array of Promises and returns a single Promise that resolves when all of the Promises in the array have resolved or rejects if any Promise rejects. It is useful for running multiple asynchronous operations concurrently.

- **Example**:

```javascript
const promise1 = Promise.resolve(3);
const promise2 = new Promise((resolve, reject) => {
  setTimeout(resolve, 100, "foo");
});
const promise3 = 42;

Promise.all([promise1, promise2, promise3])
  .then((values) => {
    console.log(values); // [3, 'foo', 42]
  })
  .catch((error) => {
    console.error(error);
  });
```

### 26. **Explain the concept of the "fetch" API.**

- **Explanation**: The Fetch API provides a modern way to make network requests in JavaScript. It returns a Promise that resolves to the Response object representing the response to the request.

- **Example**:

```javascript
fetch("https://jsonplaceholder.typicode.com/posts")
  .then((response) => {
    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    return response.json();
  })
  .then((data) => console.log(data))
  .catch((error) =>
    console.error("There has been a problem with your fetch operation:", error)
  );
```

### 27. **What are symbols in JavaScript?**

- **Explanation**: Symbols are a new primitive data type introduced in ES6. They are unique and immutable identifiers that can be used as property keys in objects, providing a way to create private properties and avoid name collisions.

- **Example**:

```javascript
const mySymbol = Symbol("description");
const obj = {
  [mySymbol]: "value",
};
console.log(obj[mySymbol]); // value
console.log(obj["mySymbol"]); // undefined (not accessible)
```

### 28. **What is the difference between `splice()` and `slice()` methods in arrays?**

- **Explanation**: `splice()` modifies an array by adding or removing elements and returns the removed elements. `slice()` returns a shallow copy of a portion of an array without modifying the original array.

- **Example**:

```javascript
const arr = [1, 2, 3, 4, 5];

// Using splice
const removed = arr.splice(2, 2); // Removes 2 elements from index 2
console.log(arr); // [1, 2, 5]
console.log(removed); // [3, 4]

// Using slice
const newArr = arr.slice(1, 3); // Returns elements from index 1 to 3 (exclusive)
console.log(newArr); // [2, 5]
```

### 29. **What are the differences between an arrow function and a regular function?**

- **Explanation**: Arrow functions are syntactically shorter and do not have their own `this` context, which means they lexically bind `this` from the surrounding code. Regular functions have their own `this` context and can be invoked as methods.

- **Example**:

```javascript
const obj = {
  value: 42,
  regularFunction: function () {
    console.log(this.value); // 42
  },
  arrowFunction: () => {
    console.log(this.value); // undefined (in global scope)
  },
};

obj.regularFunction(); // 42
obj.arrowFunction(); // undefined
```

### 30. **What are iterators and generators in JavaScript?**

- **Explanation**: Iterators are objects that define a sequence and can be iterated upon, typically using a `next()` method that returns the next item in the sequence. Generators are a special type of function that can be paused and resumed, defined using the `function*` syntax, and they return an iterator.

- **Example**:

```javascript
function* generatorFunction() {
  yield 1;
  yield 2;
  yield 3;
}

const iterator = generatorFunction();

console.log(iterator.next()); // { value: 1, done: false }
console.log(iterator.next()); // { value: 2, done: false }
console.log(iterator.next()); // { value: 3, done: false }
console.log(iterator.next()); // { value: undefined, done: true }
```

### 31. **What is the difference between `map()` and `forEach()`?**

- **Answer**:

  - `map()` creates a new array by applying a function to each element of the original array and returns the new array. It does not modify the original array.
  - `forEach()` executes a provided function once for each array element but does not return anything.

- **Example**:

```javascript
const numbers = [1, 2, 3];

const squared = numbers.map((num) => num * num);
console.log(squared); // [1, 4, 9]

numbers.forEach((num) => {
  console.log(num); // Prints each number: 1, 2, 3
});
```

### 32. **What is the purpose of `reduce()` method?**

- **Answer**: The `reduce()` method executes a reducer function on each element of the array, resulting in a single output value. It can be used to sum values, flatten arrays, or perform various calculations.

- **Example**:

```javascript
const numbers = [1, 2, 3, 4];

const sum = numbers.reduce(
  (accumulator, currentValue) => accumulator + currentValue,
  0
);
console.log(sum); // 10
```

### 33. **How do you remove duplicates from an array?**

- **Answer**: There are several ways to remove duplicates from an array:

  1.  Using `Set`
  2.  Using `filter()` and `indexOf()`

- **Example**:

```javascript
const numbers = [1, 2, 2, 3, 4, 4, 5];

// Using Set
const uniqueNumbers = [...new Set(numbers)];
console.log(uniqueNumbers); // [1, 2, 3, 4, 5]

// Using filter() and indexOf()
const uniqueNumbers2 = numbers.filter(
  (value, index) => numbers.indexOf(value) === index
);
console.log(uniqueNumbers2); // [1, 2, 3, 4, 5]
```

### 34. **What is the `find()` method in arrays?**

- **Answer**: The `find()` method returns the first element in the array that satisfies the provided testing function. If no values satisfy the testing function, `undefined` is returned.

- **Example**:

```javascript
const numbers = [1, 2, 3, 4, 5];

const found = numbers.find((num) => num > 3);
console.log(found); // 4
```

### 35. **What is the difference between `splice()` and `slice()`?**

- **Answer**:

  - `splice()` changes the contents of an array by removing or replacing existing elements and/or adding new elements. It returns an array of the removed elements.
  - `slice()` returns a shallow copy of a portion of an array into a new array object without modifying the original array.

- **Example**:

```javascript
const arr = [1, 2, 3, 4, 5];

// Using splice
const removed = arr.splice(2, 2); // Removes 2 elements from index 2
console.log(arr); // [1, 2, 5]
console.log(removed); // [3, 4]

// Using slice
const newArr = arr.slice(1, 3); // Returns elements from index 1 to 3 (exclusive)
console.log(newArr); // [2, 5]
```

### 36. **How do you reverse an array?**

- **Answer**: The `reverse()` method reverses the elements of an array in place and returns the reference to the same array.

- **Example**:

```javascript
const arr = [1, 2, 3, 4, 5];
arr.reverse();
console.log(arr); // [5, 4, 3, 2, 1]
```

### 37. **What is the difference between shallow copy and deep copy?**

- **Answer**:

  - A shallow copy creates a new object but does not recursively copy nested objects; instead, it copies references to them. Changes to nested objects affect both the original and copied object.
  - A deep copy creates a new object and recursively copies all nested objects, ensuring the copied object is entirely independent of the original.

- **Example**:

```javascript
const original = { a: 1, b: { c: 2 } };

// Shallow copy
const shallowCopy = { ...original };
shallowCopy.b.c = 3;
console.log(original.b.c); // 3 (affected)

// Deep copy
const deepCopy = JSON.parse(JSON.stringify(original));
deepCopy.b.c = 4;
console.log(original.b.c); // 3 (not affected)
```

### 38. **How do you concatenate two arrays?**

- **Answer**: The `concat()` method is used to merge two or more arrays. It returns a new array without modifying the original arrays.

- **Example**:

```javascript
const arr1 = [1, 2, 3];
const arr2 = [4, 5, 6];

const combined = arr1.concat(arr2);
console.log(combined); // [1, 2, 3, 4, 5, 6]
```

### 39. **What is the `every()` method in arrays?**

- **Answer**: The `every()` method tests whether all elements in the array pass the test implemented by the provided function. It returns a Boolean value.

- **Example**:

```javascript
const numbers = [2, 4, 6, 8];

const allEven = numbers.every((num) => num % 2 === 0);
console.log(allEven); // true
```

### 40. **How do you flatten an array?**

- **Answer**: The `flat()` method creates a new array with all sub-array elements concatenated into it recursively up to the specified depth.

- **Example**:

```javascript
const nestedArr = [1, [2, [3, 4]], 5];

const flatArr = nestedArr.flat(2); // Flattens up to 2 levels deep
console.log(flatArr); // [1, 2, 3, 4, 5]
```

### 41. **What is the `some()` method in arrays?**

- **Answer**: The `some()` method tests whether at least one element in the array passes the test implemented by the provided function. It returns a Boolean value.

- **Example**:

```javascript
const numbers = [1, 2, 3, 4, 5];

const hasEven = numbers.some((num) => num % 2 === 0);
console.log(hasEven); // true (because 2 and 4 are even)
```

### 42. **What is the `fill()` method in arrays?**

- **Answer**: The `fill()` method fills all the elements of an array from a start index to an end index with a static value. It modifies the original array and returns it.

- **Example**:

```javascript
const arr = [1, 2, 3, 4, 5];

arr.fill(0, 1, 4); // Fill from index 1 to index 4 (exclusive)
console.log(arr); // [1, 0, 0, 0, 5]
```

### 43. **What is the `includes()` method in arrays?**

- **Answer**: The `includes()` method determines whether an array includes a certain value among its entries, returning `true` or `false` as appropriate.

- **Example**:

```javascript
const fruits = ["apple", "banana", "orange"];

const hasBanana = fruits.includes("banana");
console.log(hasBanana); // true

const hasGrapes = fruits.includes("grapes");
console.log(hasGrapes); // false
```

### 44. **What is the `indexOf()` method in arrays?**

- **Answer**: The `indexOf()` method returns the first index at which a given element can be found in the array, or `-1` if it is not present.

- **Example**:

```javascript
const colors = ["red", "green", "blue"];

const index = colors.indexOf("green");
console.log(index); // 1

const notFound = colors.indexOf("yellow");
console.log(notFound); // -1
```

### 45. **What is the `join()` method in arrays?**

- **Answer**: The `join()` method joins all elements of an array into a string and returns this string. It takes an optional parameter that specifies the separator.

- **Example**:

```javascript
const words = ["Hello", "World"];

const sentence = words.join(" ");
console.log(sentence); // "Hello World"

const csv = words.join(",");
console.log(csv); // "Hello,World"
```

### 46. **What is the `sort()` method in arrays?**

- **Answer**: The `sort()` method sorts the elements of an array in place and returns the sorted array. The default sort order is ascending, but it can be customized with a compare function.

- **Example**:

```javascript
const numbers = [3, 1, 4, 2];

const sorted = numbers.sort(); // Sorts as strings by default
console.log(sorted); // [1, 2, 3, 4]

const sortedNumbers = numbers.sort((a, b) => a - b); // Sorts numerically
console.log(sortedNumbers); // [1, 2, 3, 4]
```

### 47. **What is the `reverse()` method in arrays?**

- **Answer**: The `reverse()` method reverses the elements of an array in place and returns the reference to the same array.

- **Example**:

```javascript
const arr = [1, 2, 3];

arr.reverse();
console.log(arr); // [3, 2, 1]
```

### 48. **What is the `slice()` method in arrays?**

- **Answer**: The `slice()` method returns a shallow copy of a portion of an array into a new array object selected from the start index to the end index (exclusive). The original array is not modified.

- **Example**:

```javascript
const fruits = ["apple", "banana", "orange", "grape"];

const citrus = fruits.slice(1, 3); // Returns elements from index 1 to 3 (exclusive)
console.log(citrus); // ['banana', 'orange']
```

### 49. **What is the `flatMap()` method in arrays?**

- **Answer**: The `flatMap()` method first maps each element using a mapping function, then flattens the result into a new array. It is equivalent to a `map()` followed by a `flat()` with a depth of 1.

- **Example**:

```javascript
const arr = [1, 2, 3];

const result = arr.flatMap((num) => [num, num * 2]);
console.log(result); // [1, 2, 2, 4, 3, 6]
```

### 50. **What is the `splice()` method in arrays?**

- **Answer**: The `splice()` method changes the contents of an array by removing or replacing existing elements and/or adding new elements. It returns an array of the removed elements.

- **Example**:

```javascript
const arr = ["apple", "banana", "orange"];

const removed = arr.splice(1, 1, "grape"); // Removes 1 element at index 1 and adds 'grape'
console.log(arr); // ['apple', 'grape', 'orange']
console.log(removed); // ['banana']
```

### 51. **What is the `filter()` method in arrays?**

- **Answer**: The `filter()` method creates a new array with all elements that pass the test implemented by the provided function. It does not modify the original array.

- **Example**:

```javascript
const numbers = [1, 2, 3, 4, 5, 6];

const evenNumbers = numbers.filter((num) => num % 2 === 0);
console.log(evenNumbers); // [2, 4, 6]
```

### 52. **What is the `concat()` method in arrays?**

- **Answer**: The `concat()` method is used to merge two or more arrays. This method does not change the existing arrays but instead returns a new array.

- **Example**:

```javascript
const arr1 = [1, 2, 3];
const arr2 = [4, 5, 6];

const combined = arr1.concat(arr2);
console.log(combined); // [1, 2, 3, 4, 5, 6]
```

### 53. **What is the `reduceRight()` method in arrays?**

- **Answer**: The `reduceRight()` method executes a reducer function on each element of the array, from right to left, and reduces it to a single value.

- **Example**:

```javascript
const numbers = [1, 2, 3, 4];

const sum = numbers.reduceRight(
  (accumulator, currentValue) => accumulator + currentValue,
  0
);
console.log(sum); // 10
```

### 54. **What is the `copyWithin()` method in arrays?**

- **Answer**: The `copyWithin()` method shallow copies part of an array to another location in the same array and returns it, without modifying its length.

- **Example**:

```javascript
const arr = [1, 2, 3, 4, 5];

arr.copyWithin(0, 3); // Copies elements from index 3 to index 0
console.log(arr); // [4, 5, 3, 4, 5]
```

### 55. **What is the `toString()` method in arrays?**

- **Answer**: The `toString()` method returns a string representing the specified array and its elements. It converts each element to a string and joins them with commas.

- **Example**:

```javascript
const arr = [1, "apple", true];

const str = arr.toString();
console.log(str); // "1,apple,true"
```

### 56. **What is the `keys()` method in arrays?**

- **Answer**: The `keys()` method returns a new Array Iterator object that contains the keys (indexes) for each index in the array.

- **Example**:

```javascript
const arr = ["a", "b", "c"];

const keys = arr.keys();
console.log([...keys]); // [0, 1, 2]
```

### 57. **What is the `values()` method in arrays?**

- **Answer**: The `values()` method returns a new Array Iterator object that contains the values for each index in the array.

- **Example**:

```javascript
const arr = ["x", "y", "z"];

const values = arr.values();
console.log([...values]); // ['x', 'y', 'z']
```

### 58. **What is the `entries()` method in arrays?**

- **Answer**: The `entries()` method returns a new Array Iterator object that contains the key/value pairs for each index in the array.

- **Example**:

```javascript
const arr = ["apple", "banana", "cherry"];

const entries = arr.entries();
console.log([...entries]); // [[0, 'apple'], [1, 'banana'], [2, 'cherry']]
```

### 59. **How do you find the maximum value in an array?**

- **Answer**: You can use the `Math.max()` function in combination with the spread operator to find the maximum value in an array.

- **Example**:

```javascript
const numbers = [10, 5, 8, 12, 20];

const maxValue = Math.max(...numbers);
console.log(maxValue); // 20
```

### 60. **What is the `some()` method and how does it differ from `every()`?**

- **Answer**: The `some()` method tests whether at least one element in the array passes the test implemented by the provided function, returning `true` or `false`. In contrast, the `every()` method checks if all elements pass the test.

- **Example**:

```javascript
const numbers = [1, 2, 3, 4, 5];

const hasOdd = numbers.some((num) => num % 2 !== 0); // true (1, 3, 5 are odd)
const allEven = numbers.every((num) => num % 2 === 0); // false

console.log(hasOdd); // true
console.log(allEven); // false
```

### 61. **What is an object in JavaScript?**

- **Answer**: An object in JavaScript is a standalone entity, with properties and type. It is similar to real-life objects that have characteristics (properties) and behaviors (methods). Objects are created using curly braces `{}` or the `new Object()` syntax.

- **Example**:

```javascript
const person = {
  name: "John",
  age: 30,
  greet: function () {
    console.log("Hello, " + this.name);
  },
};

person.greet(); // "Hello, John"
```

### 62. **How do you create an object in JavaScript?**

- **Answer**: You can create an object using several methods:

  1.  Object literal syntax: `const obj = { key: value };`
  2.  Using the `new Object()` constructor: `const obj = new Object();`
  3.  Using a constructor function.
  4.  Using the `class` syntax.

- **Example**:

```javascript
const car = {
  make: "Toyota",
  model: "Camry",
  year: 2020,
};
```

### 63. **What is the difference between a shallow copy and a deep copy?**

- **Answer**: A shallow copy creates a new object but does not copy nested objects; it copies references to them. A deep copy creates a new object and recursively copies all nested objects, ensuring the copied object is entirely independent of the original.

- **Example**:

```javascript
const original = { a: 1, b: { c: 2 } };

// Shallow copy
const shallowCopy = { ...original };
shallowCopy.b.c = 3;
console.log(original.b.c); // 3 (affected)

// Deep copy
const deepCopy = JSON.parse(JSON.stringify(original));
deepCopy.b.c = 4;
console.log(original.b.c); // 3 (not affected)
```

### 64. **How do you add a property to an object?**

- **Answer**: You can add a property to an object using dot notation or bracket notation.

- **Example**:

```javascript
const student = {
  name: "Alice",
  age: 20,
};

// Dot notation
student.grade = "A";

// Bracket notation
student["major"] = "Computer Science";

console.log(student); // { name: 'Alice', age: 20, grade: 'A', major: 'Computer Science' }
```

### 65. **What is the `this` keyword in JavaScript?**

- **Answer**: The `this` keyword refers to the object from which it was called. Its value can vary depending on the context in which it is used (e.g., global context, method context, etc.).

- **Example**:

```javascript
const person = {
  name: "John",
  greet: function () {
    console.log("Hello, " + this.name);
  },
};

person.greet(); // "Hello, John"
```

### 66. **How do you delete a property from an object?**

- **Answer**: You can delete a property from an object using the `delete` operator.

- **Example**:

```javascript
const car = {
  make: "Toyota",
  model: "Camry",
  year: 2020,
};

delete car.year;
console.log(car); // { make: 'Toyota', model: 'Camry' }
```

### 67. **What are computed property names in JavaScript?**

- **Answer**: Computed property names allow you to use an expression as the property name of an object. You can define the property name in square brackets `[]`.

- **Example**:

```javascript
const propName = "age";
const person = {
  name: "John",
  [propName]: 30, // 'age' is dynamically set
};
console.log(person); // { name: 'John', age: 30 }
```

### 68. **What is the difference between `Object.keys()` and `Object.values()`?**

- **Answer**: `Object.keys()` returns an array of a given object's own property names, while `Object.values()` returns an array of the object's own property values.

- **Example**:

```javascript
const person = { name: "Alice", age: 25 };

const keys = Object.keys(person); // ['name', 'age']
const values = Object.values(person); // ['Alice', 25]
```

### 69. **How do you merge two objects in JavaScript?**

- **Answer**: You can merge two objects using the `Object.assign()` method or the spread operator.

- **Example**:

```javascript
const obj1 = { a: 1, b: 2 };
const obj2 = { b: 3, c: 4 };

const merged = Object.assign({}, obj1, obj2); // { a: 1, b: 3, c: 4 }
const spreadMerged = { ...obj1, ...obj2 }; // { a: 1, b: 3, c: 4 }
```

### 70. **What is the purpose of `Object.freeze()`?**

- **Answer**: `Object.freeze()` prevents new properties from being added to an object and marks all existing properties as read-only. This means the object cannot be modified.

- **Example**:

```javascript
const car = { make: "Toyota", model: "Camry" };
Object.freeze(car);

car.year = 2020; // This will not work
console.log(car); // { make: 'Toyota', model: 'Camry' }
```

### 71. **What is the purpose of `Object.seal()`?**

- **Answer**: `Object.seal()` prevents new properties from being added to an object and marks all existing properties as non-configurable. However, it still allows existing properties to be modified.

- **Example**:

```javascript
const car = { make: "Toyota", model: "Camry" };
Object.seal(car);

car.year = 2020; // This will not work
car.make = "Honda"; // This will work
console.log(car); // { make: 'Honda', model: 'Camry' }
```

### 72. **How do you check if a property exists in an object?**

- **Answer**: You can check if a property exists in an object using the `in` operator or `hasOwnProperty()` method.

- **Example**:

```javascript
const person = { name: "Alice", age: 25 };

console.log("age" in person); // true
console.log(person.hasOwnProperty("name")); // true
console.log(person.hasOwnProperty("address")); // false
```

### 73. **What is the difference between `undefined` and `null` in JavaScript?**

- **Answer**: `undefined` means a variable has been declared but has not yet been assigned a value. `null` is an assignment value that represents no value or no object. They are both falsy values, but they are not the same.

- **Example**:

```javascript
let x; // x is undefined
let y = null; // y is explicitly set to null

console.log(x); // undefined
console.log(y); // null
```

### 74. **How can you create a copy of an object?**

- **Answer**: You can create a copy of an object using `Object.assign()`, the spread operator, or using methods like `JSON.parse(JSON.stringify())` for deep copying.

- **Example**:

```javascript
const original = { a: 1, b: 2 };

// Shallow copy
const shallowCopy = { ...original };
const assignCopy = Object.assign({}, original);

// Deep copy
const deepCopy = JSON.parse(JSON.stringify(original));
```

### 75. **What is the `Object.prototype`?**

- **Answer**: `Object.prototype` is the top-level prototype of all JavaScript objects. It provides methods and properties that can be inherited by all objects created from the Object constructor or object literals.

- **Example**:

```javascript
console.log(Object.prototype.toString); // function toString() { [native code] }
```

### 76. **What is method chaining in JavaScript objects?**

- **Answer**: Method chaining is a technique in which multiple method calls are made on the same object in a single statement. This is typically done by returning `this` from each method.

- **Example**:

```javascript
const calculator = {
  value: 0,
  add(num) {
    this.value += num;
    return this; // Return the object for chaining
  },
  subtract(num) {
    this.value -= num;
    return this; // Return the object for chaining
  },
  getValue() {
    return this.value;
  },
};

const result = calculator.add(5).subtract(2).getValue();
console.log(result); // 3
```

### 77. **How do you iterate over an object’s properties?**

- **Answer**: You can iterate over an object’s properties using `for...in` loop, `Object.keys()`, `Object.values()`, or `Object.entries()`.

- **Example**:

```javascript
const person = { name: "Alice", age: 25 };

// Using for...in
for (const key in person) {
  console.log(`${key}: ${person[key]}`);
}

// Using Object.entries()
Object.entries(person).forEach(([key, value]) => {
  console.log(`${key}: ${value}`);
});
```

### 78. **What is a constructor function in JavaScript?**

- **Answer**: A constructor function is a special function used to create and initialize objects. It is invoked using the `new` keyword, which creates a new object and sets the context of `this` to the new object.

- **Example**:

```javascript
function Person(name, age) {
  this.name = name;
  this.age = age;
}

const alice = new Person("Alice", 25);
console.log(alice); // Person { name: 'Alice', age: 25 }
```

### 79. **What is the `Object.create()` method?**

- **Answer**: The `Object.create()` method creates a new object, using an existing object as the prototype of the newly created object.

- **Example**:

```javascript
const proto = {
  greet() {
    console.log("Hello");
  },
};
const obj = Object.create(proto);
obj.greet(); // "Hello"
```

### 80. **What are the differences between `==` and `===` in JavaScript?**

- **Answer**: The `==` operator (equality) compares two values for equality after converting both values to a common type (type coercion). The `===` operator (strict equality) compares both the value and the type without coercion.

- **Example**:

```javascript
console.log(0 == "0"); // true (coerced)
console.log(0 === "0"); // false (no coercion)
console.log(null == undefined); // true (coerced)
console.log(null === undefined); // false (different types)
```
