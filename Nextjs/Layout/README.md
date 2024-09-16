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
