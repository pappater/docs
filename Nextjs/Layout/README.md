# Layouts

### **Layouts in Next.js**

**Definition** (from Next.js documentation):

> Layouts are used to define UI that is shared across multiple pages. They allow you to create consistent experiences by reusing the same structure (like headers, footers, and sidebars) across your application.

A layout can wrap one or more pages in the app and can be nested, enabling the creation of hierarchical layouts. Layouts are designed to be **Server Components** by default in Next.js, which makes them efficient for performance and static generation.

#### **Example: Basic Layout**

Folder structure:

```plaintext
app/
  ├── layout.tsx     // Global layout
  ├── page.tsx       // Home page
  ├── about/
  │   ├── page.tsx   // About page
```

- **`app/layout.tsx`**:

```tsx
export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        <header>My Website Header</header>
        <main>{children}</main>
        <footer>My Website Footer</footer>
      </body>
    </html>
  );
}
```

This layout wraps all pages in the app and applies a common structure: a header, main content area, and footer.

- **`app/page.tsx`**:

```tsx
export default function HomePage() {
  return <h1>Welcome to the Home Page</h1>;
}
```

When visiting `/`, the content from `HomePage` will be displayed within the layout structure.

#### **Key Points**:

- **Layouts** are Server Components by default.
- They provide a way to share consistent UI across multiple pages.
- Every layout file applies to all pages under its directory.

---

### **Nested Layouts in Next.js**

**Definition**:

> **Nested Layouts** allow you to create multiple layers of layouts, where each layout applies to a subset of pages. A nested layout wraps another layout, enabling hierarchical designs and shared sections at different levels.

Nested layouts are especially useful when you need to apply different layouts to different parts of the site, such as having a main layout for the entire site and a nested layout for specific sections.

#### **Example: Nested Layouts**

Folder structure:

```plaintext
app/
  ├── layout.tsx                // Root layout
  ├── dashboard/
  │   ├── layout.tsx            // Dashboard layout
  │   ├── settings/
  │   │   ├── page.tsx          // Settings page
  │   ├── profile/
  │       ├── page.tsx          // Profile page
```

- **`app/layout.tsx`**:

```tsx
export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        <header>My Website Header</header>
        <main>{children}</main>
      </body>
    </html>
  );
}
```

- **`app/dashboard/layout.tsx`**:

```tsx
export default function DashboardLayout({ children }) {
  return (
    <div>
      <nav>Dashboard Sidebar</nav>
      <div>{children}</div>
    </div>
  );
}
```

- **`app/dashboard/settings/page.tsx`**:

```tsx
export default function SettingsPage() {
  return <h1>Dashboard Settings</h1>;
}
```

When navigating to `/dashboard/settings`, the following layout structure will be rendered:

1. The **Root Layout** (`app/layout.tsx`) wraps the entire page.
2. The **Dashboard Layout** (`app/dashboard/layout.tsx`) wraps the `SettingsPage`, applying the sidebar to all dashboard-related pages.

#### **Key Points**:

- **Nested Layouts** enable hierarchical structure, allowing layouts within layouts.
- Each layout is specific to its directory and applies to all routes under that directory.

---

### **Route Group Layouts in Next.js**

**Definition** (from Next.js documentation):

> **Route Groups** allow you to group routes together without affecting the URL structure. You can define layouts that apply to certain groups of pages using route groups.

**Route Group Layouts** are similar to normal layouts, but they apply to specific groups of routes that are organized into folders that don't affect the URL.

#### **Example: Route Group Layouts**

Folder structure:

```plaintext
app/
  ├── (marketing)/
  │   ├── layout.tsx            // Layout for marketing pages
  │   ├── home/
  │   │   ├── page.tsx          // Home page (accessible at '/')
  │   ├── about/
  │       ├── page.tsx          // About page (accessible at '/about')
  ├── (dashboard)/
  │   ├── layout.tsx            // Layout for dashboard pages
  │   ├── settings/
  │       ├── page.tsx          // Settings page (accessible at '/settings')
```

- **`app/(marketing)/layout.tsx`**:

```tsx
export default function MarketingLayout({ children }) {
  return (
    <div>
      <header>Marketing Header</header>
      <main>{children}</main>
    </div>
  );
}
```

- **`app/(dashboard)/layout.tsx`**:

```tsx
export default function DashboardLayout({ children }) {
  return (
    <div>
      <nav>Dashboard Navigation</nav>
      <main>{children}</main>
    </div>
  );
}
```

In this example:

- The **Marketing Layout** applies to all routes under the `(marketing)` route group, but this does not affect the URLs. The `home` page is accessible at `/`, and the `about` page is accessible at `/about`.
- The **Dashboard Layout** applies to all routes under the `(dashboard)` route group, so the `settings` page is accessible at `/settings`.

#### **Key Points**:

- **Route Group Layouts** are layouts specific to a group of routes organized under a route group.
- The folder wrapped in parentheses `()` does not affect the URL structure but can be used to apply shared layouts or components across a group of routes.

---

### **Summary**:

1. **Layouts**: Shared structure for multiple pages (e.g., header, footer) and are defined as `layout.tsx` in any directory.
2. **Nested Layouts**: Layouts that are applied to subdirectories within other layouts, allowing for hierarchical designs.
3. **Route Group Layouts**: Layouts applied to routes organized under route groups (`()` folders) without affecting the URL structure.

Each of these layout types provides a way to modularize your Next.js application, making it scalable and easy to maintain.

# Metadata

Next.js has a robust metadata API that allows developers to define meta tags for SEO, social media sharing, and other purposes at the page level. Starting from Next.js 13, Next.js uses **App Router** which introduces a new way to define static, dynamic, and async metadata.

Metadata in Next.js helps improve SEO and the overall performance of your app by controlling page title, description, Open Graph metadata for social sharing, and more.

### Types of Metadata in Next.js

1. **Static Metadata**: Metadata defined at build time and remains constant.
2. **Dynamic Metadata**: Metadata that can change based on runtime data, e.g., from a request.
3. **Async Metadata**: Metadata that can be fetched asynchronously, for example, from a database or external API.

Each type of metadata is integrated into Next.js’s **App Router**.

---

## 1. Static Metadata

Static metadata is defined in a component at build time. This means that it remains the same throughout the application lifecycle and does not rely on any runtime data.

### Example:

Static metadata is usually defined inside the `metadata` object exported from a component file, like `layout.tsx` or `page.tsx`. Here's how you can define static metadata:

```tsx
// app/page.tsx

export const metadata = {
  title: "Home | My Next.js App",
  description: "Welcome to the home page of my Next.js app",
};
```

### Key points:

- **Static metadata** is useful when you don’t expect the data to change.
- It's defined inside the `metadata` object and can be used on both **pages** and **layouts**.
- Metadata such as the `title`, `description`, and `keywords` are static values, ideal for simple pages where the content doesn't change based on user interaction or external data.

---

## 2. Dynamic Metadata

Dynamic metadata allows you to set metadata based on the runtime state or request. This is important when your page's content and metadata depend on dynamic input, such as route parameters or query strings.

Dynamic metadata can be generated based on **props**, **params**, or even **cookies**.

### Example:

Imagine a blog where the page's metadata depends on the slug (unique identifier) of the blog post:

```tsx
// app/blog/[slug]/page.tsx

import { Metadata } from "next";

export async function generateMetadata({
  params,
}: {
  params: { slug: string };
}): Promise<Metadata> {
  const post = await getPostBySlug(params.slug);

  return {
    title: post.title,
    description: post.excerpt,
  };
}

export default function BlogPost({ params }: { params: { slug: string } }) {
  return <h1>{params.slug}</h1>;
}
```

### Key points:

- **Dynamic metadata** is generated at runtime based on the current state, like `params.slug`.
- This is useful for dynamic routes or when metadata needs to adapt to varying data (e.g., user-specific content, blog post titles).
- The `generateMetadata` function allows you to use **route parameters** or **query parameters** to generate page-specific metadata dynamically.

---

## 3. Async Metadata

Async metadata in Next.js lets you fetch metadata asynchronously, often from external APIs or databases. This is beneficial when metadata depends on data that is fetched during runtime.

In Next.js 13, `generateMetadata` can also be an asynchronous function to allow for async data fetching inside the metadata generation process.

### Example:

Consider a page where the metadata is fetched from an external API, such as a headless CMS:

```tsx
// app/product/[id]/page.tsx

import { Metadata } from "next";

async function fetchProductData(id: string) {
  const res = await fetch(`https://api.example.com/products/${id}`);
  return res.json();
}

export async function generateMetadata({
  params,
}: {
  params: { id: string };
}): Promise<Metadata> {
  const product = await fetchProductData(params.id);

  return {
    title: product.name,
    description: product.description,
    openGraph: {
      title: product.name,
      description: product.description,
      images: [
        {
          url: product.image,
        },
      ],
    },
  };
}

export default function ProductPage({ params }: { params: { id: string } }) {
  const product = fetchProductData(params.id);

  return (
    <div>
      <h1>{product.name}</h1>
      <p>{product.description}</p>
    </div>
  );
}
```

### Key points:

- **Async metadata** enables you to fetch data dynamically at runtime, which can then be used to set metadata.
- The `generateMetadata` function can return a `Promise` that resolves to metadata.
- This approach is useful for pages where metadata comes from an external source, like a CMS, API, or database.

---

### How to Structure Metadata

#### 1. **Basic Metadata Fields**:

Next.js offers several commonly used metadata fields that you can include in your metadata object.

```tsx
export const metadata = {
  title: "My Page Title",
  description: "This is a description of my page",
  keywords: ["next.js", "seo", "metadata"],
  author: "John Doe",
  viewport: "width=device-width, initial-scale=1.0",
};
```

#### 2. **Open Graph Metadata**:

For social media optimization (Facebook, Twitter, etc.), Open Graph metadata is essential.

```tsx
export const metadata = {
  openGraph: {
    title: "My Awesome Site",
    description: "A short description of my site",
    url: "https://mysite.com",
    siteName: "MySite",
    images: [
      {
        url: "https://mysite.com/og-image.jpg",
        width: 800,
        height: 600,
        alt: "Og Image Alt",
      },
    ],
    locale: "en_US",
    type: "website",
  },
};
```

#### 3. **Twitter Metadata**:

Twitter-specific metadata can also be added:

```tsx
export const metadata = {
  twitter: {
    card: "summary_large_image",
    site: "@site_account",
    creator: "@individual_account",
    title: "Twitter Title",
    description: "Twitter Description",
    images: ["https://example.com/image.jpg"],
  },
};
```

---

### Using Metadata in Layouts

In Next.js, you can define metadata for entire sections of your app by exporting metadata from the `layout.tsx` file. This is beneficial when the metadata is shared across multiple pages, such as in an eCommerce site where all product pages share common metadata.

```tsx
// app/products/layout.tsx

export const metadata = {
  title: "Products - My eCommerce Site",
  description: "Browse our wide selection of products.",
};

export default function ProductsLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return <>{children}</>;
}
```

---

### Combining Metadata

You can combine static, dynamic, and async metadata together. For example, you may want to define static metadata for common pages like the homepage but have dynamic metadata for product pages and async metadata for fetching product data.

```tsx
export async function generateMetadata({
  params,
}: {
  params: { id: string };
}): Promise<Metadata> {
  const staticMetadata = {
    title: "Static Title",
    description: "This is a static description",
  };

  const product = await fetchProductData(params.id); // Async fetching data

  return {
    ...staticMetadata,
    title: `${staticMetadata.title} | ${product.name}`,
    description: product.description,
    openGraph: {
      title: product.name,
      description: product.description,
      images: [
        {
          url: product.image,
        },
      ],
    },
  };
}
```

This combination gives you flexibility to manage SEO metadata efficiently and effectively.

---

### Summary:

- **Static Metadata**: Metadata defined at build-time, used when values do not change (e.g., homepage title).
- **Dynamic Metadata**: Metadata that changes based on runtime data, such as route parameters.
- **Async Metadata**: Metadata fetched asynchronously from APIs or databases.

Next.js’s metadata API is a powerful tool to enhance your app's SEO, social media sharing, and more. The combination of static, dynamic, and async metadata allows for great flexibility across different types of applications.

# Title Metadata

In Next.js, managing the page title and metadata is essential for SEO and a great user experience. Starting from Next.js version 13.3, it introduced the `metadata` API, which allows for more flexibility and control over how metadata (like title, description, etc.) is defined for pages and components.

When working with the `title` metadata, there are three important properties:

### 1. **`default` Property**:

- This property defines a default title for your page. If no other title is provided, this will be used.
- Example: You can set a default title that will be used for pages that don’t define their own title.

### 2. **`absolute` Property**:

- This property defines whether the title should be an absolute value or if it should be appended/prepended to the default or template value.
- Example: If `absolute: true`, the title will appear as is, without the default or template being applied.

### 3. **`template` Property**:

- This property provides a way to define a reusable template for your title. The template is a string where the page title will be interpolated, allowing you to append or prepend certain elements to your title (e.g., site name).
- Example: A template like `"%s | MyWebsite"` would append the site name to each page title.

---

### Example

Here’s how you can use the `title` metadata in Next.js with `default`, `absolute`, and `template`:

```js
// app/layout.js (in Next.js app directory structure)

export const metadata = {
  title: {
    default: "My Website",
    template: "%s | My Website",
    absolute: false, // If true, it will ignore the template and default.
  },
};

// For a specific page in app directory (e.g., app/about/page.js):

export const metadata = {
  title: "About Us",
};

// Final output on this page would be "About Us | My Website"
```

#### How Each Property Works:

1. **`default`**:

   - This is the fallback title when no other title is provided. For example, if a page doesn't specify a title, it would just show "My Website."

2. **`template`**:

   - This string is used to format the title. The `%s` will be replaced with the actual page title.
   - For example, if a page has a title of `About Us`, the final title in the HTML will be: `About Us | My Website`.

3. **`absolute`**:
   - When set to `true`, the title will be exactly what you specify on the page, without any default or template applied.
   - If `absolute` is `true`, the page with a title of `About Us` will just have `About Us` in the title tag, without the `| My Website` suffix.

---

### Example Output in the `<head>`:

1. **With Template**:

   ```html
   <title>About Us | My Website</title>
   ```

2. **With Absolute Title**:

   ```js
   // app/contact/page.js
   export const metadata = {
     title: { absolute: true, default: "Contact Us" },
   };
   ```

   ```html
   <title>Contact Us</title>
   ```
