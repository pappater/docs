### Introduction to TypeScript

**TypeScript** is an open-source programming language developed and maintained by Microsoft. It is a **superset of JavaScript**, meaning that it builds upon JavaScript by adding optional static typing, classes, and interfaces. TypeScript code is **compiled** (or transpiled) into standard JavaScript code, which can then run in any JavaScript environment, such as browsers or Node.js.

### Why Use TypeScript?

1. **Static Typing**: TypeScript introduces static typing to JavaScript, meaning you can define the data types of variables, function parameters, and return values. This reduces the risk of runtime errors and provides better tooling support, such as autocompletion and type-checking.
2. **Enhanced Code Quality and Maintainability**: TypeScript's type system helps catch errors during development, which leads to more robust code. This is especially useful in large applications where code maintenance becomes a challenge.
3. **Improved Developer Experience**: IDEs like Visual Studio Code offer better autocompletion, refactoring, and error-checking features for TypeScript, thanks to its typing system.
4. **Object-Oriented Programming**: TypeScript supports features like interfaces, generics, and classes that facilitate better organization of code in large-scale applications.

---

### Core and Fundamental Concepts of TypeScript

#### 1. **Basic Types**

TypeScript supports standard JavaScript types but allows you to specify them explicitly.

- **Boolean**: Represents true/false values.

  ```typescript
  let isDone: boolean = true;
  ```

- **Number**: Represents numeric values.

  ```typescript
  let decimal: number = 10;
  ```

- **String**: Represents text values.

  ```typescript
  let name: string = "Pratheesh";
  ```

- **Array**: Denotes a collection of values of a specific type.

  ```typescript
  let list: number[] = [1, 2, 3];
  let names: Array<string> = ["John", "Doe"];
  ```

- **Tuple**: Represents an array with a fixed number of elements, where each element can have a different type.

  ```typescript
  let tuple: [string, number];
  tuple = ["Hello", 42];
  ```

- **Enum**: Enum allows defining a set of named constants.

  ```typescript
  enum Color {
    Red,
    Green,
    Blue,
  }
  let c: Color = Color.Green;
  ```

- **Any**: A variable can be of any type, useful when you don't know the type in advance.

  ```typescript
  let notSure: any = 4;
  ```

#### 2. **Type Inference**

In TypeScript, if you do not explicitly provide a type, TypeScript will infer the type based on the assigned value.

```typescript
let myNumber = 10; // TypeScript infers `number`
```

#### 3. **Functions**

- **Function Types**: You can specify types for function parameters and return types.

  ```typescript
  function add(x: number, y: number): number {
    return x + y;
  }
  ```

- **Optional Parameters**: Use `?` to make parameters optional.

  ```typescript
  function greet(name: string, age?: number): string {
    return `Hello, ${name}`;
  }
  ```

- **Default Parameters**: You can provide default values for parameters.

  ```typescript
  function greet(name: string = "User"): string {
    return `Hello, ${name}`;
  }
  ```

#### 4. **Interfaces**

Interfaces in TypeScript define the structure of an object or a contract that an object must adhere to. This helps ensure that objects follow a specific shape.

```typescript
interface Person {
  name: string;
  age: number;
}

let user: Person = { name: "Pratheesh", age: 30 };
```

Interfaces can also describe function types, classes, and array types.

#### 5. **Classes**

Classes in TypeScript are similar to classes in object-oriented languages like Java or C#. They allow you to define properties and methods.

```typescript
class Animal {
  name: string;

  constructor(name: string) {
    this.name = name;
  }

  move(distance: number = 0) {
    console.log(`${this.name} moved ${distance} meters.`);
  }
}

let dog = new Animal("Dog");
dog.move(10);
```

TypeScript also supports **inheritance** and **modifiers** like `private`, `protected`, and `public`.

#### 6. **Generics**

Generics enable creating reusable components that work with various types.

```typescript
function identity<T>(arg: T): T {
  return arg;
}

let output = identity<string>("Hello");
```

#### 7. **Union Types**

Union types allow a variable to take multiple types.

```typescript
function printId(id: number | string) {
  console.log("ID: " + id);
}
```

#### 8. **Type Aliases**

You can create custom type aliases for complex types.

```typescript
type StringOrNumber = string | number;

let id: StringOrNumber = 101;
```

#### 9. **Type Assertions**

Sometimes, you need to tell TypeScript that a value has a specific type, even if TypeScript cannot infer it automatically. This is done using **type assertions**.

```typescript
let someValue: any = "Hello World";
let strLength: number = (someValue as string).length;
```

#### 10. **Modules**

Modules allow you to split your code into multiple files and import/export them.

- **Exporting**:

  ```typescript
  export class User {
    name: string;
    constructor(name: string) {
      this.name = name;
    }
  }
  ```

- **Importing**:

  ```typescript
  import { User } from "./User";
  ```

#### 11. **Decorators**

Decorators are special kinds of declarations that can be attached to classes, methods, accessors, properties, or parameters to modify their behavior. They are a feature of **meta-programming**.

```typescript
function Log(target: any, key: string) {
  console.log(`${key} was called`);
}

class Calculator {
  @Log
  add(x: number, y: number): number {
    return x + y;
  }
}
```

---

### Interview Questions with Answers

1. **What is TypeScript?**

   - TypeScript is a superset of JavaScript that adds static typing and object-oriented programming features.

2. **What are the benefits of using TypeScript over JavaScript?**

   - TypeScript provides static type-checking, enhanced tooling support, and better code organization through object-oriented features like classes and interfaces.

3. **What is Type Inference in TypeScript?**

   - TypeScript automatically infers the type of a variable based on its initial value if the type is not explicitly provided.

4. **Explain the difference between `interface` and `type` in TypeScript.**

   - `interface` is typically used for defining object shapes, while `type` can define unions, primitives, and more complex structures. Interfaces can also be extended, while types are more flexible but cannot extend other interfaces.

5. **What is a Union Type in TypeScript?**

   - A union type allows a variable to take one of multiple specified types. Example: `number | string`.

6. **What are Generics in TypeScript?**

   - Generics allow you to create reusable code components that work with various data types while maintaining type safety.

7. **How does TypeScript handle optional parameters in functions?**

   - Optional parameters are declared by adding a `?` after the parameter name.

8. **What is the difference between `any` and `unknown` in TypeScript?**

   - `any` disables all type checking, while `unknown` requires the type to be checked before usage.

9. **What is the use of `readonly` modifier in TypeScript?**

   - The `readonly` modifier makes a property immutable after it is initialized.

10. **What is the use of `enum` in TypeScript?**

    - `enum` is used to define a set of named constants.

11. **How do you define default parameters in TypeScript?**

    - Default parameters can be set by assigning a value to a parameter during function declaration.

12. **What is type assertion in TypeScript?**

    - Type assertion allows you to override the type inferred by TypeScript when you know the type of a value better than TypeScript does.

13. **Can you explain decorators in TypeScript?**

    - Decorators are functions that are applied to classes, methods, or properties to modify their behavior.

14. **What is module in TypeScript?**

    - A module is a file that contains import and export statements, allowing code to be reused across multiple files.

15. **What is `never` type in TypeScript?**

    - The `never` type represents a value that never occurs, used typically for functions that throw errors or have infinite loops.

16. **What are mapped types in TypeScript?**

    - Mapped types allow you to create new types by transforming existing ones using the `keyof` operator.

17. **How does `protected` differ from `private` in TypeScript?**

    - `private` restricts access to within the class, while `protected` allows access within the class and its subclasses.

18. **What is `strictNullChecks` in TypeScript?**
    - `strictNullChecks` is a compiler option that enforces stricter checking for `null` and `undefined`

# Below are from official documents and article. Refer it for more detail.

# TypeScript for JavaScript Programmers

TypeScript stands in an unusual relationship to JavaScript. TypeScript offers all of JavaScript’s features, and an additional layer on top of these: TypeScript’s type system.

For example, JavaScript provides language primitives like `string` and `number`, but it doesn’t check that you’ve consistently assigned these. TypeScript does.

This means that your existing working JavaScript code is also TypeScript code. The main benefit of TypeScript is that it can highlight unexpected behavior in your code, lowering the chance of bugs.

This tutorial provides a brief overview of TypeScript, focusing on its type system.

## Types by Inference

TypeScript knows the JavaScript language and will generate types for you in many cases. For example, in creating a variable and assigning it to a particular value, TypeScript will use the value as its type.

```ts
let helloWorld = "Hello World";
```

```ts
let helloWorld: string;
```

By understanding how JavaScript works, TypeScript can build a type-system that accepts JavaScript code but has types. This offers a type-system without needing to add extra characters to make types explicit in your code. That’s how TypeScript knows that `helloWorld` is a string in the above example.

You may have written JavaScript in Visual Studio Code and had editor auto-completion. Visual Studio Code uses TypeScript under the hood to make it easier to work with JavaScript.

## Defining Types

You can use a wide variety of design patterns in JavaScript. However, some design patterns make it difficult for types to be inferred automatically (for example, patterns that use dynamic programming). To cover these cases, TypeScript supports an extension of the JavaScript language, which offers places for you to tell TypeScript what the types should be.

For example, to create an object with an inferred type which includes `name: string` and `id: number`, you can write:

```ts
const user = {
  name: "Hayes",
  id: 0,
};
```

You can explicitly describe this object’s shape using an interface declaration:

```ts
interface User {
  name: string;
  id: number;
}
```

You can then declare that a JavaScript object conforms to the shape of your new interface by using syntax like `: TypeName` after a variable declaration:

```ts
const user: User = {
  name: "Hayes",
  id: 0,
};
```

If you provide an object that doesn’t match the interface you have provided, TypeScript will warn you:

```ts
interface User {
  name: string;
  id: number;
}

const user: User = {
  username: "Hayes",
  id: 0,
};
```

> Object literal may only specify known properties, and `'username' does not exist in type 'User'.`

Since JavaScript supports classes and object-oriented programming, so does TypeScript. You can use an interface declaration with classes:

```ts
interface User {
  name: string;
  id: number;
}

class UserAccount {
  name: string;
  id: number;

  constructor(name: string, id: number) {
    this.name = name;
    this.id = id;
  }
}

const user: User = new UserAccount("Murphy", 1);
```

You can use interfaces to annotate parameters and return values to functions:

```ts
function deleteUser(user: User) {
  // ...
}

function getAdminUser(): User {
  //...
}
```

There is already a small set of primitive types available in JavaScript: `boolean`, `bigint`, `null`, `number`, `string`, `symbol`, and `undefined`, which you can use in an interface. TypeScript extends this list with a few more, such as `any` (allow anything), `unknown` (ensure someone using this type declares what the type is), `never` (it’s not possible that this type could happen), and `void` (a function which returns undefined or has no return value).

You’ll see that there are two syntaxes for building types: `Interfaces` and `Types`. You should prefer `interface`. Use `type` when you need specific features.

## Composing Types

With TypeScript, you can create complex types by combining simple ones. There are two popular ways to do so: with unions, and with generics.

### Unions

With a union, you can declare that a type could be one of many types. For example, you can describe a boolean type as being either true or false:

```ts
type MyBool = true | false;
```

A popular use-case for union types is to describe the set of string or number literals that a value is allowed to be:

```ts
type WindowStates = "open" | "closed" | "minimized";
type LockStates = "locked" | "unlocked";
type PositiveOddNumbersUnderTen = 1 | 3 | 5 | 7 | 9;
```

Unions provide a way to handle different types too. For example, you may have a function that takes an array or a string:

```ts
function getLength(obj: string | string[]) {
  return obj.length;
}
```

To learn the type of a variable, use `typeof`:

| Type      | Predicate                          |
| --------- | ---------------------------------- |
| string    | `typeof s === "string"`            |
| number    | `typeof n === "number"`            |
| boolean   | `typeof b === "boolean"`           |
| undefined | `typeof undefined === "undefined"` |
| function  | `typeof f === "function"`          |
| array     | `Array.isArray(a)`                 |

For example, you can make a function return different values depending on whether it is passed a string or an array:

```ts
function wrapInArray(obj: string | string[]) {
  if (typeof obj === "string") {
    return [obj];
  }
  return obj;
}
```

### Generics

Generics provide variables to types. A common example is an array. An array without generics could contain anything. An array with generics can describe the values that the array contains.

```ts
type StringArray = Array<string>;
type NumberArray = Array<number>;
type ObjectWithNameArray = Array<{ name: string }>;
```

You can declare your own types that use generics:

```ts
interface Backpack<Type> {
  add: (obj: Type) => void;
  get: () => Type;
}

// This line is a shortcut to tell TypeScript there is a
// constant called `backpack`, and to not worry about where it came from.
declare const backpack: Backpack<string>;

// object is a string, because we declared it above as the variable part of Backpack.
const object = backpack.get();

// Since the backpack variable is a string, you can't pass a number to the add function.
backpack.add(23);
```

> Argument of type 'number' is not assignable to parameter of type 'string'.

## Structural Type System

One of TypeScript’s core principles is that type checking focuses on the shape that values have. This is sometimes called “duck typing” or “structural typing”.

In a structural type system, if two objects have the same shape, they are considered to be of the same type.

```ts
interface Point {
  x: number;
  y: number;
}

function logPoint(p: Point) {
  console.log(`${p.x}, ${p.y}`);
}

// logs "12, 26"
const point = { x: 12, y: 26 };
logPoint(point);
```

The `point` variable is never declared to be a `Point` type. However, TypeScript compares the shape of `point` to the shape of `Point` in the type-check. They have the same shape, so the code passes.

The shape-matching only requires a subset of the object’s fields to match.

```ts
const point3 = { x: 12, y: 26, z: 89 };
logPoint(point3); // logs "12, 26"

const rect = { x: 33, y: 3, width: 30, height: 80 };
logPoint(rect); // logs "33, 3"

const color = { hex: "#187ABF" };
logPoint(color);
```

> Argument of type '{ hex: string; }' is not assignable to parameter of type 'Point'.
> Type '{ hex: string; }' is missing the following properties from type 'Point': x, y

There is no difference between how classes and objects conform to shapes:

```ts
class VirtualPoint {
  x: number;
  y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

const newVPoint = new VirtualPoint(13, 56);
logPoint(newVPoint); // logs "13, 56"
```

If the object or class has all the required properties, TypeScript will say they match, regardless of the implementation details.

```

```
