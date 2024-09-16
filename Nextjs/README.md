# Introduction to Next.js

**Next.js** is a popular React framework that enables you to build fast, scalable, and SEO-friendly web applications. It provides a full-stack development environment where you can build both the frontend and backend of an application within a single project.

#### Key Features of Next.js

1. **Server-Side Rendering (SSR)**:
   Next.js allows pages to be rendered on the server instead of the client, which improves performance and SEO. Server-side rendering means that the content is generated on the server for each request and sent to the browser as a fully rendered HTML page.

2. **Static Site Generation (SSG)**:
   With SSG, Next.js can generate HTML pages at build time, which means these pages are pre-rendered and served as static files. This makes the app incredibly fast and scalable.

3. **Hybrid Rendering**:
   Next.js allows you to combine both SSR and SSG in the same project. You can choose to render some pages statically while others can be rendered on-demand on the server.

4. **File-Based Routing**:
   Instead of manually configuring routes, Next.js creates routes based on the file structure inside the `pages` directory. This eliminates the need for third-party routing libraries and simplifies navigation between pages.

5. **API Routes**:
   Next.js allows you to create API endpoints directly in the project by adding JavaScript/TypeScript files in the `pages/api` folder. These routes can handle backend logic and database operations without needing an external server like Express.

6. **Image Optimization**:
   Built-in support for automatic image optimization helps reduce image sizes and improve loading times. Images are optimized on-demand, and formats like WebP are used where possible.

7. **Automatic Code Splitting**:
   Next.js automatically splits your code into smaller bundles, so only the code necessary for the current page is loaded, improving performance.

8. **Fast Refresh**:
   Next.js includes a fast refresh feature for a better development experience, allowing you to see changes instantly as you modify your code without losing your component state.

9. **SEO-Friendly**:
   Since Next.js supports SSR and SSG, it is much easier to optimize pages for search engines, unlike client-side-only React apps.

10. **TypeScript Support**:
    Next.js has first-class TypeScript support, allowing you to build type-safe applications seamlessly.

#### Use Cases of Next.js

- **SEO-optimized websites**: Blogs, marketing sites, and e-commerce platforms benefit from SSR and SSG to boost SEO.
- **Performance-driven applications**: Fast loading times and optimized image handling make it perfect for high-performance applications.
- **Full-stack React apps**: With API routes, Next.js allows you to create a backend within the same codebase as the frontend.

# To install Next.js, follow these steps:

1. **Ensure Node.js is installed**:
   Make sure you have Node.js installed on your machine. You can check by running:

   ```bash
   node -v
   ```

2. **Create a Next.js app**:
   You can use the `create-next-app` command to set up a Next.js project with everything you need pre-configured. Run the following command in your terminal:

   ```bash
   npx create-next-app@latest
   ```

   You can also specify a project name:

   ```bash
   npx create-next-app@latest my-next-app
   ```

3. **Navigate to the project directory**:
   Once the installation is complete, move into the project directory:

   ```bash
   cd my-next-app
   ```

4. **Run the development server**:
   Start the development server by running:

   ```bash
   npm run dev
   ```

   Your Next.js app will now be accessible at `http://localhost:3000`.

# Next js control flow, how pages renders and stuff

When you start a Next.js application, the framework follows a structured control flow to render the initial page (like `Home()`). To understand how it works behind the scenes, let’s break it down step by step:

### 1. **File-Based Routing**

In Next.js, pages are built around the concept of file-based routing. Each file in the `pages` directory corresponds to a route. For example:

- `pages/index.js` → the home page (`/`)
- `pages/about.js` → the about page (`/about`)

When you create a `Home` component in `pages/index.js`, Next.js automatically registers it as the root route (`/`).

Example `pages/index.js`:

```js
export default function Home() {
  return <h1>Welcome to the Home Page</h1>;
}
```

### 2. **Initial Request Handling**

When a user accesses the homepage (e.g., `http://localhost:3000/`), Next.js performs the following tasks:

- **Development Mode (with `npm run dev`)**:
  - A development server listens for requests. The first request for the homepage triggers the following flow:
  - Next.js compiles the components on the fly (with Hot Module Replacement) and renders the `Home()` component.
- **Production Mode (with `npm run build` and `npm start`)**:
  - The build process pre-compiles and optimizes the app. The initial request fetches the optimized and pre-rendered HTML page.

### 3. **Rendering the `Home()` Component**

#### a. **Static Rendering (Static Site Generation - SSG)**:

In many cases, the initial rendering of the `Home()` component is done statically at **build time**. Here's what happens:

- Next.js compiles and executes the `Home()` function at build time (for static pages).
- It generates an HTML file and stores it in the `.next` directory.
- When a user visits the homepage, this pre-built HTML file is sent directly to the client, making the page load extremely fast.

#### b. **Server-Side Rendering (SSR)**:

In server-side rendering mode, Next.js renders the `Home()` component at **runtime** for each request.

- When a user requests the homepage, Next.js runs the `Home()` function on the server to generate the HTML page on the fly.
- The rendered HTML is sent to the client.

### 4. **Hydration on the Client-Side**

Regardless of whether the page is statically generated or server-rendered, Next.js sends the fully rendered HTML to the browser. Once the HTML is loaded, **hydration** happens:

- The React JavaScript code for the `Home()` component is sent to the browser.
- The React app becomes interactive as the client-side JavaScript "hydrates" the static HTML by attaching event listeners and other dynamic behaviors.

### 5. **Data Fetching Mechanism (Optional)**

If your `Home()` component needs to fetch data, Next.js provides methods to do this:

- **`getStaticProps` (SSG)**:
  If you export a `getStaticProps` function from your page, Next.js runs this function at build time and passes the returned data as props to the `Home()` component.

  ```js
  export async function getStaticProps() {
    const data = await fetchData(); // Fetch data from an API
    return { props: { data } }; // Pass data as props to Home()
  }

  export default function Home({ data }) {
    return <div>{data}</div>;
  }
  ```

- **`getServerSideProps` (SSR)**:
  If you export a `getServerSideProps` function, Next.js runs it at runtime, on each request. The returned data is passed to the `Home()` component, and SSR is used to render the page on the server before sending it to the client.

  ```js
  export async function getServerSideProps() {
    const data = await fetchData();
    return { props: { data } };
  }

  export default function Home({ data }) {
    return <div>{data}</div>;
  }
  ```

### 6. **API Routes Handling (Optional)**

If you use an API route within your Next.js app, it is handled similarly to traditional REST APIs. When the `Home()` component makes a call to an API route (e.g., `/api/hello`), Next.js intercepts the request, processes the backend logic within the `pages/api/` file, and sends the response back.

### Behind the Scenes

- **Webpack/Babel Compilation**:
  When the development server is running or when you build for production, Next.js uses **Webpack** to bundle your app and **Babel** to transpile your modern JavaScript/TypeScript code.

- **React Rendering**:
  Next.js extends React's core rendering capabilities (both on the client and server). It uses React’s `renderToString()` method for SSR, generating the HTML content that will be sent to the client.

- **Routing & Middleware**:
  Next.js has its own router built into the framework. It maps URLs to files in the `pages/` directory and handles navigation between pages without needing third-party routing libraries. For SSR, Next.js uses a custom server and middleware to handle requests.

### Flow Summary

1. **Routing**: Next.js determines the route by checking the file structure (e.g., `/` → `pages/index.js`).
2. **Static/Server-Side Rendering**:
   - Static pages are rendered at build time and served as HTML.
   - SSR pages are rendered on each request and sent as HTML.
3. **Client-Side Hydration**: The browser receives the static HTML and hydrates it with React to make the page interactive.
4. **Data Fetching**: If `getStaticProps` or `getServerSideProps` is used, data is fetched and passed to the component.
5. **API Routes (if applicable)**: API routes process backend logic if called by the page.

# React Server Components (RSC) and React Client Components

In Next.js, you can use **React Server Components** and **Client Components** to optimize your app by determining which parts of your UI are rendered on the server and which are rendered on the client.

### 1. **React Server Components**

- **Server Components** are executed on the server and do not require JavaScript to be loaded or executed on the client side.
- These components are ideal for rendering parts of the UI that don’t require interactivity or access to browser APIs (like local storage, events, etc.).

#### Characteristics:

- **No JavaScript sent to the client**: The server renders the HTML, and no additional JavaScript is needed to display the component in the browser.
- **Data fetching is easy**: Since they are rendered on the server, you can fetch data directly inside these components without hooks like `useEffect` or relying on APIs.
- **Faster load times**: By sending pre-rendered HTML, Server Components reduce the amount of JavaScript shipped to the client, improving performance.

#### Example of a Server Component:

```jsx
// pages/index.js (Server Component by default)
export default function Home() {
  const data = fetchSomeData(); // Server-side data fetching
  return (
    <div>
      <h1>Welcome to the Home Page</h1>
      <p>Data from server: {data}</p>
    </div>
  );
}
```

- In this example, the `Home` component fetches data and renders it server-side. The client receives static HTML without JavaScript.

### 2. **React Client Components**

- **Client Components** are rendered on the client and require JavaScript to run in the browser.
- They are used for interactive parts of the application, such as handling events, managing state, and interacting with browser APIs.

#### Characteristics:

- **JavaScript is sent to the client**: These components include client-side JavaScript to enable interactivity (e.g., click events, dynamic state).
- **Uses React hooks**: You can use hooks like `useState`, `useEffect`, and `useContext` in Client Components to manage the UI and handle side effects.
- **Client-Side Rendering (CSR)**: These components can dynamically render or update based on user interaction.

#### Example of a Client Component:

To explicitly declare a component as a **Client Component** in Next.js 13+ using the App Router, you need to add a special `'use client'` directive at the top of the component file.

```jsx
// components/InteractiveComponent.js
"use client";

import { useState } from "react";

export default function InteractiveComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>Client-side counter: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}
```

- In this example, `InteractiveComponent` is a Client Component that updates the count when the button is clicked.

### 3. **Mixed Usage: Server and Client Components Together**

- In Next.js, you can combine Server and Client Components. Server Components can pass props to Client Components, allowing you to split responsibilities.

#### Example: Combining Server and Client Components

```jsx
// pages/index.js (Server Component)
import InteractiveComponent from "../components/InteractiveComponent";

export default function Home() {
  const data = fetchSomeData(); // Server-side fetching

  return (
    <div>
      <h1>Welcome to the Home Page</h1>
      <p>Server-rendered data: {data}</p>
      <InteractiveComponent /> {/* Client Component */}
    </div>
  );
}
```

In this example:

- The `Home` component is a Server Component, and it renders static content.
- The `InteractiveComponent` is a Client Component that handles interactivity, like managing the count.

### 4. **When to Use Server vs Client Components**

- **Use Server Components** for:
  - Content that does not require interactivity (e.g., static text, fetched data).
  - Pages or sections where SEO is important.
  - Reducing JavaScript sent to the client.
- **Use Client Components** for:
  - Interactive components (e.g., buttons, forms, dropdowns).
  - Components that rely on browser APIs (e.g., local storage, cookies).
  - Managing UI state, side effects, and user interactions.

### 5. **Server vs Client Component Flow**

- **Server Component Flow**:

  - The component renders on the server.
  - The server sends the pre-rendered HTML to the client.
  - No JavaScript is sent to the client unless there are Client Components nested inside.

- **Client Component Flow**:
  - The component’s JavaScript is sent to the client.
  - The component is rendered in the browser with full interactivity.

### Key Takeaways:

- **Server Components** are rendered on the server, provide static HTML, and improve load times by reducing JavaScript sent to the client.
- **Client Components** run in the browser, handle dynamic behaviors, and enable interactivity.

This distinction enables more efficient rendering in Next.js and makes it easier to build fast, optimized applications.

# Routing

Let’s take a deep dive into Next.js routing, incorporating detailed explanations, folder structures, and examples based on the latest Next.js conventions using both the **Pages Router** (`pages/` directory) and **App Router** (`app/` directory introduced in Next.js 13+). I’ll also reference official documentation concepts as we explore each topic.

---

## **1. Basic Routing**

Next.js provides two routing systems depending on whether you're using the **Pages Router** or the **App Router**.

### **Pages Router (File-based routing)**:

- The **`pages/`** directory enables file-based routing. Each file inside this folder automatically becomes a route.
- The default `index.tsx` file is the root route (`/`).

#### Example Folder Structure:

```
pages/
  ├── index.tsx      // maps to '/'
  ├── about.tsx      // maps to '/about'
  ├── profile.tsx    // maps to '/profile'
```

#### Code Example:

```tsx
// pages/index.tsx
export default function Home() {
  return <h1>Welcome to the Homepage</h1>;
}
```

- **Routing Logic**: The files inside `pages/` correspond to routes by their filenames, and you don't need additional configuration.

### **App Router (Folder-based routing)**:

- In **Next.js 13+**, you can use the **`app/` directory** for routing. This system allows you to organize your application using folders rather than just files, offering a more scalable routing system, especially for large applications.

#### Example Folder Structure:

```
app/
  ├── page.tsx       // maps to '/'
  ├── about/
  │   ├── page.tsx   // maps to '/about'
  ├── profile/
      ├── page.tsx   // maps to '/profile'
```

#### Code Example:

```tsx
// app/page.tsx
export default function Home() {
  return <h1>Welcome to the Homepage</h1>;
}
```

- **Routing Logic**: Folders act as route segments. Inside each folder, you define the route using `page.tsx`. This enables a more modular structure, especially when combined with layouts.

---

## **2. Layouts (`layout.tsx`)**

Layouts enable you to define shared UI elements (e.g., navigation bars, footers) that persist across different pages.

### **Pages Router (File-based Layout)**:

- The Pages Router does not natively support layouts. You must manually create a layout component and use it in each page.

#### Example Folder Structure:

```
components/
  ├── Layout.tsx
pages/
  ├── about.tsx
  ├── profile.tsx
```

#### Code Example:

```tsx
// components/Layout.tsx
export default function Layout({ children }) {
  return (
    <div>
      <header>Header</header>
      <main>{children}</main>
      <footer>Footer</footer>
    </div>
  );
}

// pages/about.tsx
import Layout from "../components/Layout";

export default function About() {
  return (
    <Layout>
      <h1>About Page</h1>
    </Layout>
  );
}
```

### **App Router (Folder-based Layout)**:

- In the **App Router**, layouts are integrated into the folder structure. You create a `layout.tsx` file, and it automatically wraps around all pages inside that directory.

#### Example Folder Structure:

```
app/
  ├── layout.tsx       // Root layout
  ├── page.tsx         // Homepage
  ├── about/
  │   ├── layout.tsx   // About-specific layout (optional)
  │   ├── page.tsx     // About page
  ├── profile/
      ├── page.tsx     // Profile page
```

#### Code Example:

```tsx
// app/layout.tsx (Root Layout)
export default function RootLayout({ children }) {
  return (
    <html>
      <body>
        <header>Site Header</header>
        {children}
        <footer>Site Footer</footer>
      </body>
    </html>
  );
}

// app/about/page.tsx
export default function AboutPage() {
  return <h1>About Us</h1>;
}
```

- **Routing Logic**: Any `page.tsx` inside the folder will use the `layout.tsx` as a wrapper.

---

## **3. Nested Routes**

Nested routes are useful for structuring more complex pages.

### **Pages Router (File-based Nested Routing)**:

- You can nest routes by organizing files in folders.

#### Example Folder Structure:

```
pages/
  ├── about/
  │   ├── team.tsx    // maps to '/about/team'
  │   ├── history.tsx // maps to '/about/history'
```

#### Code Example:

```tsx
// pages/about/team.tsx
export default function Team() {
  return <h1>Meet the Team</h1>;
}
```

### **App Router (Folder-based Nested Routing)**:

- Nested routing is achieved by creating subfolders with their own `page.tsx`.

#### Example Folder Structure:

```
app/
  ├── about/
  │   ├── page.tsx         // maps to '/about'
  │   ├── team/
  │   │   ├── page.tsx     // maps to '/about/team'
  │   ├── history/
      │   ├── page.tsx     // maps to '/about/history'
```

#### Code Example:

```tsx
// app/about/team/page.tsx
export default function TeamPage() {
  return <h1>Meet the Team</h1>;
}
```

- **Routing Logic**: You create folders to represent the nested route structure, and inside each folder, `page.tsx` represents the actual route.

---

## **4. Dynamic Routes**

Dynamic routes allow you to create pages that accept parameters, making them reusable.

### **Pages Router (File-based Dynamic Routing)**:

- Create a file using square brackets to define a dynamic route.

#### Example Folder Structure:

```
pages/
  ├── profile/
  │   ├── [username].tsx  // maps to '/profile/:username'
```

#### Code Example:

```tsx
// pages/profile/[username].tsx
import { useRouter } from "next/router";

export default function Profile() {
  const router = useRouter();
  const { username } = router.query;

  return <h1>Profile of {username}</h1>;
}
```

### **App Router (Folder-based Dynamic Routing)**:

- Dynamic routing is achieved by using square-bracket folders to represent dynamic parameters.

#### Example Folder Structure:

```
app/
  ├── profile/
  │   ├── [username]/
  │   │   ├── page.tsx  // maps to '/profile/:username'
```

#### Code Example:

```tsx
// app/profile/[username]/page.tsx
import { useParams } from "next/navigation";

export default function ProfilePage() {
  const { username } = useParams();

  return <h1>Profile of {username}</h1>;
}
```

- **Routing Logic**: The folder name `[username]` indicates a dynamic route. The value of `username` is extracted from the URL.

---

## **5. Nested Dynamic Routes**

Nested dynamic routes allow for complex dynamic parameters in your application.

### **Pages Router (File-based Nested Dynamic Routing)**:

- Combine nested folders with dynamic filenames.

#### Example Folder Structure:

```
pages/
  ├── blog/
  │   ├── [category]/
  │   │   ├── [postId].tsx  // maps to '/blog/:category/:postId'
```

#### Code Example:

```tsx
// pages/blog/[category]/[postId].tsx
import { useRouter } from "next/router";

export default function BlogPost() {
  const router = useRouter();
  const { category, postId } = router.query;

  return (
    <div>
      <h1>Category: {category}</h1>
      <p>Post ID: {postId}</p>
    </div>
  );
}
```

### **App Router (Folder-based Nested Dynamic Routing)**:

- Use nested dynamic folders to achieve the same effect.

#### Example Folder Structure:

```
app/
  ├── blog/
  │   ├── [category]/
  │   │   ├── [postId]/
  │   │   │   ├── page.tsx  // maps to '/blog/:category/:postId'
```

#### Code Example:

```tsx
// app/blog/[category]/[postId]/page.tsx
import { useParams } from "next/navigation";

export default function BlogPost() {
  const { category, postId } = useParams();

  return (
    <div>
      <h1>Category: {category}</h1>
      <p>Post ID: {postId}</p>
    </div>
  );
}
```

---

## **6. Catch-all and Optional Catch-all Segments**

### **Pages Router (File-based Catch-all and Optional Catch-all)**:

- **Catch-all**: Use `[...param]` to capture all segments.
- **Optional Catch-all**: Use `[[...param]]` to make the parameter optional.

#### Example Folder Structure:

```
pages/
  ├── [...slug].tsx         // maps to '/a/b/c'
  ├── [[...slug]].tsx       // maps to '/' or '/a/b/c'
```

#### Code Example

:

```tsx
// pages/[...slug].tsx
import { useRouter } from "next/router";

export default function CatchAll() {
  const router = useRouter();
  const { slug } = router.query;

  return <p>Slug: {slug?.join("/")}</p>;
}
```

### **App Router (Folder-based Catch-all and Optional Catch-all)**:

- You can similarly define catch-all routes using `[...param]` or `[[...param]]`.

#### Example Folder Structure:

```
app/
  ├── [...slug]/
  │   ├── page.tsx       // maps to '/a/b/c'
  ├── [[...slug]]/
      ├── page.tsx       // maps to '/' or '/a/b/c'
```

---

## **7. Handling Non-matching Routes**

### **Pages Router**:

- The **`404.tsx`** file in `pages/` handles non-matching routes.

#### Example:

```tsx
// pages/404.tsx
export default function Custom404() {
  return <h1>404 - Page Not Found</h1>;
}
```

### **App Router**:

- The **`not-found.tsx`** file in `app/` is used to handle non-matching routes.

#### Example:

```tsx
// app/not-found.tsx
export default function NotFound() {
  return <h1>404 - Page Not Found</h1>;
}
```

---
