### 1. **Basic**

JavaScript is a dynamic programming language that is widely used for building interactive and dynamic web applications. It allows developers to create complex functionalities on web pages, handle user events, and manipulate the DOM (Document Object Model). JavaScript is interpreted by browsers, and it runs on both the client side and server side.

#### Key Concepts:

- **Dynamic Typing:** Variables in JavaScript can hold different data types without specifying the type.
- **Interpreted Language:** JavaScript code is executed line by line, rather than being compiled ahead of time.
- **First-Class Functions:** Functions in JavaScript can be assigned to variables, passed as arguments, and returned from other functions.

#### Example:

```javascript
let message = "Hello, World!";
console.log(message); // Outputs: Hello, World!

function greet(name) {
  return `Hello, ${name}!`;
}

console.log(greet("Alice")); // Outputs: Hello, Alice!
```

### 2. **Declaration**

In JavaScript, variables are declared using three keywords: `var`, `let`, and `const`. These keywords have different scopes and behaviors.

#### 2.1. **`var` Declaration**

- **Scope:** Function-scoped, meaning the variable is accessible within the entire function, even before its declaration (hoisting).
- **Hoisting:** Variables declared with `var` are hoisted to the top of their scope and initialized with `undefined`.
- **Re-declaration:** Can be re-declared within the same scope.

#### Example:

```javascript
function varExample() {
  console.log(x); // Outputs: undefined (due to hoisting)
  var x = 10;
  console.log(x); // Outputs: 10
}
varExample();
```

#### 2.2. **`let` Declaration**

- **Scope:** Block-scoped, meaning the variable is only accessible within the block in which it is declared.
- **Hoisting:** Variables declared with `let` are hoisted, but not initialized until the declaration is evaluated.
- **Re-declaration:** Cannot be re-declared in the same scope.

#### Example:

```javascript
function letExample() {
  if (true) {
    let y = 20;
    console.log(y); // Outputs: 20
  }
  // console.log(y); // Uncaught ReferenceError: y is not defined
}
letExample();
```

#### 2.3. **`const` Declaration**

- **Scope:** Block-scoped, similar to `let`.
- **Immutability:** Variables declared with `const` cannot be reassigned after their initial assignment. However, objects and arrays can still be modified.
- **Hoisting:** Similar to `let`, `const` is hoisted but not initialized.

#### Example:

```javascript
const z = 30;
// z = 40; // Uncaught TypeError: Assignment to constant variable
const arr = [1, 2, 3];
arr.push(4); // Modifies the array but doesn't reassign it
console.log(arr); // Outputs: [1, 2, 3, 4]
```

### 3. **Data Structures and Types**

JavaScript supports several data types, broadly categorized into primitive types and reference types (objects). It also supports complex data structures such as arrays and objects.

#### 3.1. **Primitive Data Types**

- **String:** Represents text.
- **Number:** Represents both integer and floating-point numbers.
- **Boolean:** Represents `true` or `false`.
- **Null:** Represents the intentional absence of any object value.
- **Undefined:** A variable that has been declared but not assigned a value.
- **Symbol:** A unique and immutable data type introduced in ECMAScript 6 (ES6).

#### Example:

```javascript
let name = "Alice"; // String
let age = 25; // Number
let isStudent = true; // Boolean
let noValue = null; // Null
let notAssigned; // Undefined

console.log(typeof name); // Outputs: string
console.log(typeof age); // Outputs: number
```

#### 3.2. **Reference Data Types**

- **Object:** Collections of key-value pairs.
- **Array:** Ordered collections of elements.
- **Function:** Objects that are callable and can perform tasks.

#### Example (Object and Array):

```javascript
let person = {
  name: "John",
  age: 30,
};

let numbers = [1, 2, 3, 4, 5];
console.log(person.name); // Outputs: John
console.log(numbers[0]); // Outputs: 1
```

### 4. **Literals**

In JavaScript, literals represent fixed values that are directly written into the code. These include:

- **Number literals:** Represent numbers (integers or floating points).
- **String literals:** Represent sequences of characters enclosed in single or double quotes.
- **Boolean literals:** `true` or `false`.
- **Object literals:** Define objects inline using curly braces `{}`.
- **Array literals:** Define arrays inline using square brackets `[]`.

#### Example:

```javascript
let numberLiteral = 42; // Number literal
let stringLiteral = "Hello!"; // String literal
let booleanLiteral = true; // Boolean literal

let objectLiteral = {
  // Object literal
  firstName: "Alice",
  lastName: "Doe",
};

let arrayLiteral = [1, 2, 3]; // Array literal

console.log(objectLiteral.firstName); // Outputs: Alice
console.log(arrayLiteral[1]); // Outputs: 2
```

### Summary:

- **Basic:** JavaScript is dynamic, interpreted, and functions are first-class.
- **Declaration:** Variables are declared using `var`, `let`, or `const` with different scoping rules.
- **Data Types:** JavaScript has primitive types like string, number, boolean, and complex types like objects and arrays.
- **Literals:** Fixed values written directly into the code like number literals, string literals, object literals, and array literals.

You can find more detailed explanations and examples on the MDN page [JavaScript Guide - Grammar and Types](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Grammar_and_types).

### 1. **Block Statement**

A **block statement** (also called a **compound statement**) is used to group multiple statements together. It is enclosed within curly braces `{}`. Blocks can contain zero or more statements, and they are commonly used in control flow statements like `if`, `while`, or `for` to define multiple lines of code that should be executed together.

#### Key Points:

- Block statements do not introduce a new scope in functions declared with `var`, but they do with `let` and `const` (block-scoping).
- Blocks are often used in loops, conditionals, and functions.

#### Example:

```javascript
if (true) {
  let x = 5;
  console.log(x); // Outputs: 5
}
// console.log(x);  // Uncaught ReferenceError: x is not defined (block-scoped variable)
```

In this example, the block groups the statements for `let` declaration and `console.log` into a single unit that executes only if the `if` condition is `true`.

### 2. **Conditional Statement**

Conditional statements are used to perform different actions based on different conditions. In JavaScript, you have multiple types of conditional statements:

#### 2.1. **`if` Statement**

The `if` statement is used to execute a block of code if a specified condition evaluates to `true`. If the condition is `false`, the block is skipped.

#### Example:

```javascript
let age = 18;
if (age >= 18) {
  console.log("You are an adult.");
}
```

#### 2.2. **`if...else` Statement**

The `if...else` statement provides an alternate block of code to execute if the condition is `false`.

#### Example:

```javascript
let age = 16;
if (age >= 18) {
  console.log("You are an adult.");
} else {
  console.log("You are a minor.");
}
```

#### 2.3. **`else if` Ladder**

The `else if` statement is used to test multiple conditions sequentially. Once a condition is `true`, the corresponding block is executed, and the rest of the ladder is ignored.

#### Example:

```javascript
let score = 85;
if (score >= 90) {
  console.log("A grade");
} else if (score >= 75) {
  console.log("B grade");
} else {
  console.log("C grade");
}
```

#### 2.4. **`switch` Statement**

The `switch` statement is used to execute one of many blocks of code based on the value of an expression.

#### Example:

```javascript
let day = 3;
switch (day) {
  case 1:
    console.log("Monday");
    break;
  case 2:
    console.log("Tuesday");
    break;
  case 3:
    console.log("Wednesday");
    break;
  default:
    console.log("Invalid day");
}
```

#### Key Points:

- The `switch` statement is often used when you have many different possible values for a single variable.
- Each `case` in the `switch` is followed by a `break` statement to prevent fall-through (where all subsequent cases get executed after the matching case).

### 3. **Exception Handling Statement**

Exception handling is a way to handle errors or exceptional situations in your code. JavaScript uses `try...catch` statements for exception handling, allowing you to catch and handle errors without crashing your application.

#### 3.1. **`try...catch` Statement**

The `try` block contains code that may throw an error. If an error occurs, it is caught and handled in the `catch` block.

#### Syntax:

```javascript
try {
  // Code that may throw an error
} catch (error) {
  // Code to handle the error
}
```

#### Example:

```javascript
try {
  let result = someUndefinedVariable + 10; // This will throw a ReferenceError
} catch (error) {
  console.log("An error occurred: " + error.message); // Outputs: An error occurred: someUndefinedVariable is not defined
}
```

#### 3.2. **`finally` Block**

The `finally` block can be added after the `try...catch` block. The code inside the `finally` block will always execute, regardless of whether an error was thrown or not.

#### Example:

```javascript
try {
  let result = 10 / 0; // No error, but division by zero returns Infinity
} catch (error) {
  console.log("Error: " + error.message);
} finally {
  console.log("This will always run."); // Always executes
}
```

#### Key Points:

- The `try` block is used to wrap code that might throw errors.
- The `catch` block handles any error that occurs in the `try` block.
- The `finally` block ensures that certain code runs regardless of the outcome (error or no error).

#### 3.3. **`throw` Statement**

The `throw` statement allows you to create custom errors. When you throw an error, the current execution is halted, and control is passed to the nearest `catch` block.

#### Example:

```javascript
function checkAge(age) {
  if (age < 18) {
    throw new Error("You must be 18 or older.");
  } else {
    console.log("Access granted.");
  }
}

try {
  checkAge(15); // Will throw an error
} catch (error) {
  console.log("Error: " + error.message); // Outputs: Error: You must be 18 or older.
}
```

### Summary:

- **Block Statement:** Groups multiple statements together and is often used in control flow structures.
- **Conditional Statement:** Allows you to make decisions in your code with `if`, `else`, `else if`, and `switch` statements.
- **Exception Handling Statement:** Provides a mechanism to handle errors gracefully with `try`, `catch`, `finally`, and `throw`.

For more details, you can refer to the MDN documentation on [JavaScript Control Flow and Error Handling](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Control_flow_and_error_handling).

### 1. **`for` Statement**

The `for` loop is one of the most common ways to repeat a block of code a specific number of times. It includes three expressions: initialization, condition, and final expression (increment/decrement), which control the loop's execution.

#### Syntax:

```javascript
for (initialization; condition; increment / decrement) {
  // Code to execute repeatedly
}
```

#### Example:

```javascript
for (let i = 0; i < 5; i++) {
  console.log(i); // Outputs: 0, 1, 2, 3, 4
}
```

#### Explanation:

- **Initialization:** `let i = 0` is executed once before the loop starts.
- **Condition:** `i < 5` is checked before each iteration. If `true`, the loop runs; otherwise, it stops.
- **Increment:** `i++` increments `i` by 1 after each iteration.

---

### 2. **`do...while` Statement**

The `do...while` loop is similar to the `while` loop, except that it executes the block of code once before checking the condition. This ensures that the loop runs at least once, regardless of the condition.

#### Syntax:

```javascript
do {
  // Code to execute
} while (condition);
```

#### Example:

```javascript
let i = 0;
do {
  console.log(i); // Outputs: 0
  i++;
} while (i < 1);
```

#### Explanation:

- The code inside the `do` block runs once before checking the condition.
- The condition is checked after each iteration. If `true`, the loop continues; otherwise, it stops.

---

### 3. **`while` Statement**

The `while` loop repeats a block of code as long as the specified condition evaluates to `true`. It checks the condition before each iteration, meaning it may not execute the block at all if the condition is false initially.

#### Syntax:

```javascript
while (condition) {
  // Code to execute repeatedly
}
```

#### Example:

```javascript
let i = 0;
while (i < 3) {
  console.log(i); // Outputs: 0, 1, 2
  i++;
}
```

#### Explanation:

- The loop continues to run as long as the condition `i < 3` is true.
- If the condition is false at the start, the loop does not run at all.

---

### 4. **Labeled Statement**

A labeled statement allows you to label a block of code (or loop) so that it can be referenced by the `break` or `continue` statements. It is useful for breaking out of nested loops or specific blocks of code.

#### Syntax:

```javascript
labelName: {
  // Code or loop
}
```

#### Example:

```javascript
outerLoop: for (let i = 0; i < 3; i++) {
  for (let j = 0; j < 3; j++) {
    if (i === 1 && j === 1) {
      break outerLoop; // Exits both loops
    }
    console.log(`i: ${i}, j: ${j}`);
  }
}
```

#### Explanation:

- The label `outerLoop` is used with the `break` statement to exit the outer loop when the condition is met.

---

### 5. **`break` Statement**

The `break` statement is used to exit a loop or switch statement early. When encountered, it immediately stops the execution of the current loop and moves to the next block of code after the loop.

#### Syntax:

```javascript
break;
```

#### Example:

```javascript
for (let i = 0; i < 5; i++) {
  if (i === 3) {
    break; // Exits the loop when i is 3
  }
  console.log(i); // Outputs: 0, 1, 2
}
```

#### Explanation:

- The loop terminates early when `i === 3` due to the `break` statement.

---

### 6. **`continue` Statement**

The `continue` statement skips the current iteration of a loop and continues with the next iteration. It does not stop the loop, just skips the rest of the code for the current iteration.

#### Syntax:

```javascript
continue;
```

#### Example:

```javascript
for (let i = 0; i < 5; i++) {
  if (i === 2) {
    continue; // Skips when i is 2
  }
  console.log(i); // Outputs: 0, 1, 3, 4
}
```

#### Explanation:

- The iteration when `i === 2` is skipped, but the loop continues with the next iteration.

---

### 7. **`for...in` Statement**

The `for...in` statement iterates over the enumerable properties of an object. It loops through the keys (property names) of an object.

#### Syntax:

```javascript
for (variable in object) {
  // Code to execute
}
```

#### Example:

```javascript
const person = { name: "Alice", age: 25, city: "New York" };

for (let key in person) {
  console.log(`${key}: ${person[key]}`);
}
// Outputs: name: Alice, age: 25, city: New York
```

#### Explanation:

- The loop iterates over the keys (`name`, `age`, `city`) of the `person` object.
- The values are accessed using `person[key]`.

---

### 8. **`for...of` Statement**

The `for...of` statement iterates over the values of an iterable object, such as arrays, strings, or `Set` and `Map` objects. It loops through the values of an iterable rather than its keys.

#### Syntax:

```javascript
for (variable of iterable) {
  // Code to execute
}
```

#### Example:

```javascript
const arr = ["apple", "banana", "cherry"];

for (let fruit of arr) {
  console.log(fruit); // Outputs: apple, banana, cherry
}
```

#### Explanation:

- The loop iterates over the values of the array `arr` (`apple`, `banana`, `cherry`).
- The `for...of` loop works with arrays, strings, and other iterable objects.

---

### Summary:

- **`for` Statement:** Loops a specific number of times, with initialization, condition, and increment.
- **`do...while` Statement:** Loops at least once, checking the condition after each iteration.
- **`while` Statement:** Loops while a condition is `true`.
- **Labeled Statement:** Labels a block or loop to control with `break` or `continue`.
- **`break` Statement:** Exits a loop early.
- **`continue` Statement:** Skips the current iteration of a loop.
- **`for...in` Statement:** Iterates over the keys (property names) of an object.
- **`for...of` Statement:** Iterates over the values of an iterable object.

For more detailed information, you can refer to the MDN documentation on [JavaScript Loops and Iteration](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration).

### 1. **Defining Functions**

In JavaScript, functions are reusable blocks of code that can be defined once and executed multiple times. There are multiple ways to define functions, but the most common approaches are **function declarations** and **function expressions**.

#### Function Declaration:

A function is declared using the `function` keyword, followed by a name, a parameter list (optional), and a block of code.

#### Syntax:

```javascript
function functionName(parameter1, parameter2) {
  // Code to execute
}
```

#### Example:

```javascript
function greet(name) {
  return `Hello, ${name}!`;
}
```

In this example, the function `greet` takes one argument (`name`) and returns a greeting message.

#### Function Expression:

A function can also be defined as part of an expression, commonly used when assigning a function to a variable.

#### Example:

```javascript
const greet = function (name) {
  return `Hello, ${name}!`;
};
```

Here, the function is assigned to the variable `greet`.

---

### 2. **Calling Functions**

A function is executed or "called" by writing its name followed by parentheses, which may include arguments. You can call a function as many times as needed.

#### Syntax:

```javascript
functionName(arguments);
```

#### Example:

```javascript
console.log(greet("Alice")); // Outputs: Hello, Alice!
console.log(greet("Bob")); // Outputs: Hello, Bob!
```

In this example, the `greet` function is called twice with different arguments.

---

### 3. **Function Scope**

Scope refers to the visibility or accessibility of variables. There are two main scopes in JavaScript: **global scope** and **local (function) scope**.

- **Global Scope:** Variables declared outside any function are globally scoped and accessible from anywhere in the program.
- **Local Scope (Function Scope):** Variables declared inside a function are locally scoped, meaning they can only be accessed within that function.

#### Example:

```javascript
let globalVar = "Global";

function testScope() {
  let localVar = "Local";
  console.log(globalVar); // Accessible
  console.log(localVar); // Accessible
}

testScope();
console.log(globalVar); // Accessible
console.log(localVar); // Error: localVar is not defined
```

In this example, `localVar` is not accessible outside the function.

---

### 4. **Scope and the Function Stack**

JavaScript uses a **function stack** to manage function calls and scopes. When a function is called, a new execution context is created and pushed onto the stack. As each function finishes execution, its context is popped off the stack.

- **Call Stack:** A stack data structure that keeps track of the currently executing function and the functions called from within that function.

#### Example:

```javascript
function first() {
  second(); // Calls the second function
}

function second() {
  console.log("Second function");
}

first();
```

In this example, the call to `first()` puts it on the stack, and inside `first()`, `second()` is called, which adds `second()` to the stack.

---

### 5. **Closures**

A **closure** is a function that retains access to its outer (enclosing) function's variables even after the outer function has finished execution. This is because functions in JavaScript form "closures" around the environment they were created in.

#### Example:

```javascript
function outer() {
  let outerVar = "I'm outside!";

  return function inner() {
    console.log(outerVar); // Accesses outerVar from the outer scope
  };
}

const innerFunc = outer(); // outer() returns the inner function
innerFunc(); // Outputs: I'm outside!
```

In this example, the inner function retains access to `outerVar` even after `outer()` has finished executing.

---

### 6. **Using the `arguments` Object**

The `arguments` object is an array-like object that contains all the arguments passed to a function, even if the function does not have defined parameters. It is useful when you don't know how many arguments will be passed to the function.

#### Example:

```javascript
function sum() {
  let total = 0;
  for (let i = 0; i < arguments.length; i++) {
    total += arguments[i];
  }
  return total;
}

console.log(sum(1, 2, 3)); // Outputs: 6
```

In this example, the `arguments` object holds all the arguments passed to the `sum` function.

---

### 7. **Function Parameters**

Function parameters are variables defined in the function definition that act as placeholders for the values (arguments) passed to the function when it is called.

#### Default Parameters:

You can assign default values to parameters in case they are not provided during the function call.

#### Syntax:

```javascript
function functionName(param1 = defaultValue1, param2 = defaultValue2) {
  // Code to execute
}
```

#### Example:

```javascript
function greet(name = "Guest") {
  return `Hello, ${name}!`;
}

console.log(greet()); // Outputs: Hello, Guest!
console.log(greet("Alice")); // Outputs: Hello, Alice!
```

In this example, if no argument is passed, the parameter `name` defaults to `"Guest"`.

---

### 8. **Arrow Functions**

Arrow functions are a shorter syntax for writing functions introduced in ES6. They have a more concise syntax and handle the `this` keyword differently from traditional functions.

#### Syntax:

```javascript
const functionName = (param1, param2) => {
  // Code to execute
};
```

If there is only one parameter, the parentheses can be omitted, and if the function body contains a single expression, the curly braces and `return` keyword can also be omitted.

#### Example:

```javascript
const greet = (name) => `Hello, ${name}!`;

console.log(greet("Alice")); // Outputs: Hello, Alice!
```

#### Explanation:

- Arrow functions do not have their own `this` value. They inherit `this` from their surrounding context, which makes them useful in certain cases like callbacks and event handlers.

#### Example with `this`:

```javascript
function Person() {
  this.age = 0;

  setInterval(() => {
    this.age++; // Arrow function retains 'this' from the surrounding context
    console.log(this.age);
  }, 1000);
}

const person = new Person();
```

In this example, the arrow function inside `setInterval` retains the `this` value from the `Person` function.

---

### Summary:

- **Defining Functions:** Can be done using function declarations or expressions.
- **Calling Functions:** Functions are executed by calling their name followed by parentheses.
- **Function Scope:** Variables inside a function have local scope, accessible only within that function.
- **Scope and the Function Stack:** Functions are managed using a stack structure for execution and scope handling.
- **Closures:** Functions retain access to variables from their outer scope even after the outer function has returned.
- **`arguments` Object:** Provides access to all arguments passed to a function, regardless of the defined parameters.
- **Function Parameters:** Placeholder variables that receive values passed to a function during a call. They can also have default values.
- **Arrow Functions:** A concise way to write functions with different behavior regarding `this`.

### 1. **Assignment Operators**

Assignment operators are used to assign values to variables. The basic assignment operator is `=`, but there are several compound assignment operators that combine assignment with another operation.

#### Basic Assignment Operator:

- `=`: Assigns the value on the right to the variable on the left.

#### Compound Assignment Operators:

- `+=`: Adds the right operand to the left operand and assigns the result to the left operand.
- `-=`: Subtracts the right operand from the left operand and assigns the result to the left operand.
- `*=`: Multiplies the left operand by the right operand and assigns the result to the left operand.
- `/=`: Divides the left operand by the right operand and assigns the result to the left operand.
- `%=`: Takes the modulus using the left and right operands and assigns the result to the left operand.
- `**=`: Raises the left operand to the power of the right operand and assigns the result to the left operand.

#### Example:

```javascript
let x = 10;
x += 5; // x = 15
x *= 2; // x = 30
x -= 10; // x = 20
```

---

### 2. **Comparison Operators**

Comparison operators compare two values and return a boolean value (`true` or `false`). They are useful for making decisions in control structures.

#### Operators:

- `==`: Equality (checks if two values are equal, ignoring type)
- `===`: Strict Equality (checks if two values are equal and of the same type)
- `!=`: Inequality (checks if two values are not equal, ignoring type)
- `!==`: Strict Inequality (checks if two values are not equal or not of the same type)
- `>`: Greater than
- `<`: Less than
- `>=`: Greater than or equal to
- `<=`: Less than or equal to

#### Example:

```javascript
console.log(5 == "5"); // true (type coercion)
console.log(5 === "5"); // false (different types)
console.log(10 > 5); // true
console.log(5 <= 5); // true
```

---

### 3. **Arithmetic Operators**

Arithmetic operators perform mathematical operations on numbers. They are fundamental for calculations in JavaScript.

#### Operators:

- `+`: Addition
- `-`: Subtraction
- `*`: Multiplication
- `/`: Division
- `%`: Modulus (remainder of division)
- `**`: Exponentiation (raising to a power)

#### Example:

```javascript
let a = 10;
let b = 5;
console.log(a + b); // Outputs: 15
console.log(a - b); // Outputs: 5
console.log(a * b); // Outputs: 50
console.log(a / b); // Outputs: 2
console.log(a % b); // Outputs: 0
console.log(a ** b); // Outputs: 100000
```

---

### 4. **Bitwise Operators**

Bitwise operators perform operations on binary representations of numbers. They are often used for low-level programming and optimization.

#### Operators:

- `&`: Bitwise AND
- `|`: Bitwise OR
- `^`: Bitwise XOR (exclusive OR)
- `~`: Bitwise NOT
- `<<`: Left shift
- `>>`: Sign-propagating right shift
- `>>>`: Zero-fill right shift

#### Example:

```javascript
let x = 5; // Binary: 0101
let y = 3; // Binary: 0011
console.log(x & y); // Outputs: 1 (Binary: 0001)
console.log(x | y); // Outputs: 7 (Binary: 0111)
console.log(x ^ y); // Outputs: 6 (Binary: 0110)
console.log(~x); // Outputs: -6 (Binary: 1010)
console.log(x << 1); // Outputs: 10 (Binary: 1010)
console.log(x >> 1); // Outputs: 2 (Binary: 0010)
```

---

### 5. **Logical Operators**

Logical operators are used to combine or negate boolean values. They are often used in conditional statements.

#### Operators:

- `&&`: Logical AND (returns true if both operands are true)
- `||`: Logical OR (returns true if at least one operand is true)
- `!`: Logical NOT (negates the boolean value)

#### Example:

```javascript
let a = true;
let b = false;
console.log(a && b); // Outputs: false
console.log(a || b); // Outputs: true
console.log(!a); // Outputs: false
```

---

### 6. **BigInt Operators**

`BigInt` is a built-in object that provides a way to represent whole numbers larger than the maximum limit of the `Number` type in JavaScript. BigInts are created by appending `n` to the end of an integer or using the `BigInt` constructor.

#### Example:

```javascript
const bigInt1 = BigInt(123456789012345678901234567890);
const bigInt2 = 123456789012345678901234567890n;

console.log(bigInt1 + bigInt2); // Outputs: 246913578024691357802469135780n
```

#### Operators:

You can use arithmetic operators with `BigInt`, but you cannot mix `BigInt` with regular numbers without explicit conversion.

---

### 7. **String Operators**

In JavaScript, the primary operator for string manipulation is the concatenation operator `+`. This operator combines two or more strings.

#### Example:

```javascript
let str1 = "Hello";
let str2 = "World";
let greeting = str1 + " " + str2; // Outputs: "Hello World"
```

You can also use template literals (backticks) to create strings that can include variables and expressions.

#### Example:

```javascript
let name = "Alice";
let greeting = `Hello, ${name}!`; // Outputs: "Hello, Alice!"
```

---

### 8. **Conditional (Ternary) Operator**

The conditional (ternary) operator is a shorthand for an `if...else` statement. It takes three operands and is often used to perform simple conditional logic.

#### Syntax:

```javascript
condition ? expressionIfTrue : expressionIfFalse;
```

#### Example:

```javascript
let age = 18;
let status = age >= 18 ? "Adult" : "Minor"; // Outputs: "Adult"
```

In this example, if `age` is 18 or older, `status` is set to "Adult"; otherwise, it is set to "Minor".

---

### 9. **Comma Operator**

The comma operator evaluates each of its operands (from left to right) and returns the value of the last operand. It is rarely used but can be useful in certain scenarios.

#### Syntax:

```javascript
let result = (expression1, expression2, ..., expressionN);
```

#### Example:

```javascript
let a = (1, 2, 3); // Outputs: 3
console.log(a);
```

In this example, the value of `a` will be `3`, as it is the last operand evaluated.

---

### 10. **Unary Operators**

Unary operators operate on a single operand. They can be used to perform various operations, including negation and increment/decrement.

#### Common Unary Operators:

- `+`: Unary plus (converts the operand to a number)
- `-`: Unary negation (negates the operand)
- `++`: Increment (increases the value by 1)
- `--`: Decrement (decreases the value by 1)
- `!`: Logical NOT (negates a boolean value)

#### Example:

```javascript
let x = 5;
console.log(+x); // Outputs: 5 (converts to number)
console.log(-x); // Outputs: -5 (negates)
console.log(++x); // Outputs: 6 (increments)
console.log(--x); // Outputs: 5 (decrements)
```

---

### 11. **Relational Operators**

Relational operators are used to compare values. They return a boolean value indicating whether the comparison is true or false.

#### Operators:

- `>`: Greater than
- `<`: Less than
- `>=`: Greater than or equal to
- `<=`: Less than or equal to

#### Example:

```javascript
console.log(5 > 3); // Outputs: true
console.log(5 < 3); // Outputs: false
console.log(5 >= 5); // Outputs: true
console.log(5 <= 3); // Outputs: false
```

---

### 12. **Basic Expressions**

Expressions are combinations of values, variables, operators, and functions that evaluate to a single value. An expression can be as simple as a single value or variable or as complex as a combination of various operations.

#### Examples:

- **Simple Expression:** `5 + 3`
- **Variable Expression:** `x * 2`
- **Complex Expression:** `(x > 10) ? "Greater" : "Lesser"`
- **Function Call:** `Math.sqrt(16)`

#### Example:

```javascript
let x = 10;
let y = 5;

let result = (x + y) * 2; // Outputs: 30
console.log(result);
```

---

### Summary:

- **Assignment Operators:** Used to assign values to variables (`=`, `

+=`, etc.).

- **Comparison Operators:** Compare values and return boolean results (`==`, `===`, `>`, etc.).
- **Arithmetic Operators:** Perform mathematical operations (`+`, `-`, `*`, etc.).
- **Bitwise Operators:** Operate on binary representations of numbers (`&`, `|`, `^`, etc.).
- **Logical Operators:** Combine or negate boolean values (`&&`, `||`, `!`).
- **BigInt Operators:** Handle large integers using the `BigInt` type.
- **String Operators:** Mainly use `+` for string concatenation.
- **Conditional (Ternary) Operator:** A shorthand for `if...else` (`condition ? expr1 : expr2`).
- **Comma Operator:** Evaluates expressions from left to right, returning the last one.
- **Unary Operators:** Operate on a single operand (`+`, `-`, `++`, etc.).
- **Relational Operators:** Compare values and return boolean results (`>`, `<`, etc.).
- **Basic Expressions:** Combinations of values and operators that evaluate to a single value.

### 1. **Numbers**

In JavaScript, numbers are a primitive data type that represent both integer and floating-point values. JavaScript uses the IEEE 754 standard for representing numbers, meaning all numbers are stored as 64-bit floating-point values. This allows for a wide range of numeric values but comes with some limitations regarding precision.

#### Key Characteristics:

- **Type:** In JavaScript, the type of a number is `number`, and it can represent both whole numbers and decimal values.
- **Range:** JavaScript can handle numbers as large as ±1.7976931348623157 × 10^308 and as small as ±5.0 × 10^-324.
- **Special Values:** JavaScript has several special numeric values:
  - `Infinity`: Represents infinity, resulting from dividing a number by zero.
  - `-Infinity`: Represents negative infinity.
  - `NaN`: Stands for "Not-a-Number" and is the result of invalid mathematical operations (e.g., `0/0`).

#### Example:

```javascript
let a = 42; // Integer
let b = 3.14; // Floating-point number
let c = Infinity; // Infinity
let d = NaN; // Not-a-Number
console.log(typeof a); // Outputs: number
console.log(typeof b); // Outputs: number
console.log(c); // Outputs: Infinity
console.log(d); // Outputs: NaN
```

---

### 2. **Number Object**

The `Number` object is a built-in JavaScript object that provides methods and properties for working with numbers. It allows for more complex number manipulations and conversions.

#### Key Properties:

- `Number.MAX_VALUE`: The largest positive finite value.
- `Number.MIN_VALUE`: The smallest positive finite value.
- `Number.NaN`: Represents NaN.
- `Number.POSITIVE_INFINITY`: Represents positive infinity.
- `Number.NEGATIVE_INFINITY`: Represents negative infinity.

#### Key Methods:

- `Number.isFinite(value)`: Determines whether the passed value is a finite number.
- `Number.isInteger(value)`: Determines whether the passed value is an integer.
- `Number.parseFloat(string)`: Parses a string argument and returns a floating-point number.
- `Number.parseInt(string, radix)`: Parses a string argument and returns an integer of the specified radix.

#### Example:

```javascript
console.log(Number.MAX_VALUE); // Outputs: 1.7976931348623157e+308
console.log(Number.MIN_VALUE); // Outputs: 5e-324
console.log(Number.isFinite(42)); // Outputs: true
console.log(Number.isFinite(Infinity)); // Outputs: false
console.log(Number.parseFloat("3.14")); // Outputs: 3.14
console.log(Number.parseInt("10", 2)); // Outputs: 2 (binary to decimal)
```

---

### 3. **Math Object**

The `Math` object is a built-in object in JavaScript that provides a collection of mathematical functions and constants. It does not require instantiation and is always available.

#### Key Properties:

- `Math.PI`: Represents the value of π (approximately 3.14159).
- `Math.E`: Represents Euler's number (approximately 2.71828).
- `Math.SQRT2`: Represents the square root of 2.

#### Key Methods:

- `Math.abs(x)`: Returns the absolute value of `x`.
- `Math.ceil(x)`: Rounds `x` up to the nearest integer.
- `Math.floor(x)`: Rounds `x` down to the nearest integer.
- `Math.round(x)`: Rounds `x` to the nearest integer.
- `Math.random()`: Returns a pseudorandom number between 0 (inclusive) and 1 (exclusive).
- `Math.max(...values)`: Returns the largest of zero or more numbers.
- `Math.min(...values)`: Returns the smallest of zero or more numbers.

#### Example:

```javascript
console.log(Math.PI); // Outputs: 3.141592653589793
console.log(Math.abs(-5)); // Outputs: 5
console.log(Math.ceil(4.3)); // Outputs: 5
console.log(Math.floor(4.7)); // Outputs: 4
console.log(Math.round(4.5)); // Outputs: 5
console.log(Math.random()); // Outputs a random number between 0 and 1
console.log(Math.max(1, 2, 3)); // Outputs: 3
console.log(Math.min(1, 2, 3)); // Outputs: 1
```

---

### 4. **BigInts**

`BigInt` is a built-in object in JavaScript that allows you to represent and manipulate whole numbers larger than the maximum safe integer limit of the `Number` type (`Number.MAX_SAFE_INTEGER`, which is 2^53 - 1). BigInts are useful for working with large numbers that exceed the limitations of standard number representation.

#### Key Characteristics:

- Created by appending `n` to the end of an integer or by using the `BigInt` constructor.
- BigInts can be used with mathematical operations, but mixing them with regular `Number` types requires explicit conversion.

#### Example:

```javascript
const bigInt1 = BigInt(123456789012345678901234567890);
const bigInt2 = 123456789012345678901234567890n;

console.log(bigInt1); // Outputs: 123456789012345678901234567890n
console.log(bigInt2); // Outputs: 123456789012345678901234567890n
console.log(bigInt1 + bigInt2); // Outputs: 246913578024691357802469135780n

// Mixing BigInt with Number
let num = 10;
// console.log(bigInt1 + num); // Error: Cannot mix BigInt and other types
console.log(bigInt1 + BigInt(num)); // Outputs: 123456789012345678901234567900n
```

---

### 5. **Date Object**

The `Date` object in JavaScript is a built-in object used for handling dates and times. It provides various methods to create, manipulate, and format dates.

#### Creating a Date Object:

You can create a `Date` object in several ways:

- Using the `Date()` constructor with no arguments creates a date object for the current date and time.
- You can also pass a specific date as a string or as individual year, month, and day components.

#### Example:

```javascript
let currentDate = new Date(); // Current date and time
let specificDate = new Date("2024-10-15"); // Specific date
let anotherDate = new Date(2024, 9, 15); // Year, month (0-indexed), day

console.log(currentDate); // Outputs the current date and time
console.log(specificDate); // Outputs: Tue Oct 15 2024 ...
console.log(anotherDate); // Outputs: Tue Oct 15 2024 ...
```

#### Key Methods:

- `getFullYear()`: Returns the year of the specified date.
- `getMonth()`: Returns the month (0-11) of the specified date.
- `getDate()`: Returns the day of the month (1-31) of the specified date.
- `getHours()`: Returns the hour (0-23) of the specified date.
- `getMinutes()`: Returns the minutes (0-59) of the specified date.
- `getSeconds()`: Returns the seconds (0-59) of the specified date.
- `getTime()`: Returns the numeric value corresponding to the time for the specified date (in milliseconds since January 1, 1970).

#### Example:

```javascript
let date = new Date("2024-10-15");
console.log(date.getFullYear()); // Outputs: 2024
console.log(date.getMonth()); // Outputs: 9 (October)
console.log(date.getDate()); // Outputs: 15
console.log(date.getHours()); // Outputs: 0 (midnight)
console.log(date.getMinutes()); // Outputs: 0
console.log(date.getSeconds()); // Outputs: 0
console.log(date.getTime()); // Outputs: Milliseconds since epoch
```

#### Formatting Dates:

You can format dates in various ways using the `Date` object’s methods or by converting the date to a string using the `toDateString()`, `toTimeString()`, or `toISOString()` methods.

#### Example:

```javascript
console.log(date.toDateString()); // Outputs: Tue Oct 15 2024
console.log(date.toTimeString()); // Outputs: 00:00:00 GMT...
console.log(date.toISOString()); // Outputs: 2024-10-15T00:00:00.000Z
```

---

### Summary:

- **Numbers:** A primitive data type representing both integers and floating-point values, adhering to the IEEE 754 standard.
- **Number Object:** A built-in object providing methods and properties for working with numbers.
- **Math Object:** A built-in object offering mathematical functions and constants, such as `Math.PI` and `Math.random()`.
- **BigInts:** An object allowing representation and manipulation of whole numbers larger than the maximum safe integer limit of `Number`.
- **Date Object:** A built-in object for handling dates and times, providing methods for date manipulation and formatting.

### Strings

In JavaScript, a string is a sequence of characters used to represent text. Strings are a fundamental data type in JavaScript, and they can be created using single quotes (`'`), double quotes (`"`), or backticks (`` ` ``).

#### Characteristics of Strings:

- **Immutability**: Strings are immutable, meaning that once a string is created, it cannot be changed. Any operation that modifies a string will return a new string instead.
- **Length**: You can determine the number of characters in a string using the `.length` property.
- **Escape Sequences**: Certain characters, such as quotes or newlines, can be included in strings using escape sequences (e.g., `\'`, `\"`, `\\`, `\n`, etc.).

#### Creating Strings:

Strings can be created in several ways:

```javascript
let singleQuoted = "Hello, World!";
let doubleQuoted = "Hello, World!";
let backtickQuoted = `Hello, World!`;

console.log(singleQuoted); // Outputs: Hello, World!
console.log(doubleQuoted); // Outputs: Hello, World!
console.log(backtickQuoted); // Outputs: Hello, World!
```

#### String Methods:

JavaScript provides a variety of built-in methods for manipulating strings. Some of the most commonly used methods include:

- **Accessing Characters**: Use indexing to access individual characters.

  ```javascript
  let str = "Hello";
  console.log(str[0]); // Outputs: H
  ```

- **Common Methods**:
  - `.length`: Returns the length of the string.
  - `.toUpperCase()`: Converts the string to uppercase.
  - `.toLowerCase()`: Converts the string to lowercase.
  - `.charAt(index)`: Returns the character at the specified index.
  - `.indexOf(searchValue)`: Returns the index of the first occurrence of a specified value.
  - `.substring(start, end)`: Returns a substring from the string.
  - `.trim()`: Removes whitespace from both ends of a string.
  - `.split(separator)`: Splits the string into an array of substrings based on a specified separator.
  - `.replace(searchValue, newValue)`: Replaces occurrences of a specified value with a new value.
  - `.includes(searchValue)`: Checks if the string contains a specified value.

#### Example:

```javascript
let message = "   Hello, World!   ";

console.log(message.length); // Outputs: 15
console.log(message.trim()); // Outputs: "Hello, World!"
console.log(message.toUpperCase()); // Outputs: "   HELLO, WORLD!   "
console.log(message.indexOf("World")); // Outputs: 8
console.log(message.replace("World", "JavaScript")); // Outputs: "   Hello, JavaScript!   "
console.log(message.split(",")); // Outputs: [ '   Hello', ' World!   ' ]
console.log(message.includes("Hello")); // Outputs: true
```

### Internationalization (i18n)

Internationalization (often abbreviated as i18n) is the process of designing software applications to support multiple languages and regional differences. In JavaScript, this involves handling strings, numbers, currencies, and dates in a way that accommodates various cultural conventions.

#### Importance of Internationalization:

- **User Experience**: Providing a localized experience enhances user satisfaction.
- **Accessibility**: Making applications usable in multiple languages increases their accessibility and reach.
- **Market Expansion**: Internationalization enables businesses to expand into new markets.

#### Internationalization Features in JavaScript:

JavaScript provides several built-in objects and methods to assist with internationalization:

1. **Intl Object**:
   The `Intl` object is a namespace that provides language-sensitive functionality, such as number formatting, date and time formatting, and string comparison.

   - **Number Formatting**:
     The `Intl.NumberFormat` object allows you to format numbers based on locale.

     ```javascript
     let number = 1234567.89;
     let formatter = new Intl.NumberFormat("en-US");
     console.log(formatter.format(number)); // Outputs: "1,234,567.89"

     formatter = new Intl.NumberFormat("de-DE");
     console.log(formatter.format(number)); // Outputs: "1.234.567,89"
     ```

   - **Date and Time Formatting**:
     The `Intl.DateTimeFormat` object is used for formatting dates and times.

     ```javascript
     let date = new Date();
     let dateFormatter = new Intl.DateTimeFormat("en-US");
     console.log(dateFormatter.format(date)); // Outputs: e.g., "10/15/2024"

     dateFormatter = new Intl.DateTimeFormat("fr-FR");
     console.log(dateFormatter.format(date)); // Outputs: e.g., "15/10/2024"
     ```

   - **Collation (String Comparison)**:
     The `Intl.Collator` object provides methods to compare strings based on locale-specific rules.
     ```javascript
     let collator = new Intl.Collator("en-US");
     console.log(collator.compare("a", "b")); // Outputs: -1 (meaning 'a' comes before 'b')
     ```

2. **Locale-Sensitive Functions**:
   JavaScript also includes several functions that automatically adapt to the user's locale, such as `toLocaleString()`, `toLocaleDateString()`, and `toLocaleTimeString()` for numbers and dates.

   #### Example:

   ```javascript
   let num = 1234567.89;
   console.log(num.toLocaleString("en-US")); // Outputs: "1,234,567.89"
   console.log(num.toLocaleString("de-DE")); // Outputs: "1.234.567,89"

   let today = new Date();
   console.log(today.toLocaleDateString("en-US")); // Outputs: e.g., "10/15/2024"
   console.log(today.toLocaleDateString("fr-FR")); // Outputs: e.g., "15/10/2024"
   ```

### Summary

- **Strings**: A fundamental data type in JavaScript for representing text, with methods for manipulation and formatting. Strings are immutable, and various built-in methods help perform operations on them.
- **Internationalization (i18n)**: The process of designing applications to support multiple languages and regional differences. JavaScript provides the `Intl` object, which includes number formatting, date and time formatting, and string comparison to facilitate internationalization, enhancing user experience and accessibility.

### Regular Expressions in JavaScript

Regular expressions (regex) are powerful tools used for matching patterns in strings. They are essential for searching, validating, and manipulating text based on specific patterns. JavaScript provides a robust way to work with regular expressions through its built-in `RegExp` object and regex literals.

---

### 1. Creating a Regular Expression

There are two ways to create a regular expression in JavaScript:

- **Using a Regular Expression Literal**: This involves enclosing the pattern within forward slashes (`/`).

  **Syntax**:

  ```javascript
  let regex = /pattern/flags;
  ```

- **Using the `RegExp` Constructor**: This is useful when you need to create a regex dynamically, especially if the pattern is stored in a string.

  **Syntax**:

  ```javascript
  let regex = new RegExp("pattern", "flags");
  ```

#### Example:

```javascript
// Using a regex literal
let regexLiteral = /abc/;

// Using the RegExp constructor
let regexConstructor = new RegExp("abc");
```

---

### 2. Writing a Regular Expression Pattern

A regular expression pattern consists of characters that specify the search criteria. Here are some common elements used in regex patterns:

- **Literal Characters**: Match the exact characters in the string.

  - Example: `/hello/` matches the string "hello".

- **Meta-characters**: Special characters that have specific meanings:
  - `.`: Matches any single character except newline.
  - `^`: Matches the beginning of a string.
  - `$`: Matches the end of a string.
  - `*`: Matches zero or more occurrences of the preceding element.
  - `+`: Matches one or more occurrences of the preceding element.
  - `?`: Matches zero or one occurrence of the preceding element.
  - `\`: Escapes a special character.
- **Character Classes**: Match any one of the characters in brackets.

  - Example: `/[abc]/` matches "a", "b", or "c".

- **Quantifiers**: Specify how many times an element can occur.

  - `{n}`: Exactly `n` occurrences.
  - `{n,}`: `n` or more occurrences.
  - `{n,m}`: Between `n` and `m` occurrences.

- **Groups and Ranges**:
  - `( )`: Groups sub-patterns together.
  - `|`: Acts as a logical OR.
  - `[a-z]`: Matches any lowercase letter from `a` to `z`.

#### Example:

```javascript
let pattern = /^[a-zA-Z0-9]{5,10}$/; // Matches a string that is 5 to 10 characters long and contains only letters and numbers.
```

---

### 3. Using Regular Expressions in JavaScript

Regular expressions can be used with various string methods and the `RegExp` object. Some common methods include:

- **`test()`**: Tests for a match in a string. Returns `true` or `false`.

  **Syntax**:

  ```javascript
  regex.test(string);
  ```

- **`exec()`**: Executes a search for a match in a string. Returns an array of matches or `null` if no match is found.

  **Syntax**:

  ```javascript
  regex.exec(string);
  ```

- **String Methods**:
  - **`String.match()`**: Matches a string against a regex pattern.
  - **`String.replace()`**: Replaces matched substrings with a specified value.
  - **`String.search()`**: Searches for a match and returns the index of the first match.
  - **`String.split()`**: Splits a string into an array based on a regex pattern.

#### Example:

```javascript
let str = "Hello, World!";

// Using test()
let regex = /hello/i; // 'i' flag for case insensitive
console.log(regex.test(str)); // Outputs: true

// Using exec()
let result = regex.exec(str);
console.log(result); // Outputs: [ 'hello', index: 0, input: 'Hello, World!', groups: undefined ]

// Using match()
console.log(str.match(/World/)); // Outputs: [ 'World', index: 7, input: 'Hello, World!', groups: undefined ]

// Using replace()
let newStr = str.replace(/World/, "JavaScript");
console.log(newStr); // Outputs: Hello, JavaScript!

// Using search()
console.log(str.search(/World/)); // Outputs: 7

// Using split()
let splitStr = str.split(/[\s,]+/); // Splits on whitespace and commas
console.log(splitStr); // Outputs: [ 'Hello', 'World!' ]
```

---

### 4. Examples

Here are some practical examples of using regular expressions in JavaScript:

- **Email Validation**:

  ```javascript
  let email = "example@example.com";
  let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  console.log(emailPattern.test(email)); // Outputs: true
  ```

- **Phone Number Formatting**:

  ```javascript
  let phoneNumber = "123-456-7890";
  let phonePattern = /^\d{3}-\d{3}-\d{4}$/;
  console.log(phonePattern.test(phoneNumber)); // Outputs: true
  ```

- **Extracting Digits**:
  ```javascript
  let str = "There are 123 apples and 456 oranges.";
  let digitPattern = /\d+/g;
  let digits = str.match(digitPattern);
  console.log(digits); // Outputs: [ '123', '456' ]
  ```

---

### 5. Tools

Several tools can assist in creating, testing, and debugging regular expressions:

- **Regex101**: A popular online regex tester that provides explanations for patterns and highlights matches in real-time.
- **RegExr**: Another online tool that allows you to create and test regex patterns, offering a community library of patterns and quick references.

- **Regexr Desktop**: A desktop application that allows for offline regex testing and exploration.

- **Chrome DevTools**: The Console in Chrome DevTools allows you to test regex patterns directly within your JavaScript code.

---

### Summary

- **Creating a Regular Expression**: Use regex literals or the `RegExp` constructor to define patterns.
- **Writing a Regular Expression Pattern**: Patterns consist of literal characters, meta-characters, character classes, and quantifiers.
- **Using Regular Expressions in JavaScript**: Use methods like `test()`, `exec()`, and various string methods to manipulate and evaluate strings against regex patterns.
- **Examples**: Regular expressions can be used for tasks like email validation, phone number formatting, and extracting digits.
- **Tools**: Online and offline tools are available for testing and creating regex patterns efficiently.
