### Introduction to TanStack React Query

**TanStack React Query** (formerly known as React Query) is a powerful and popular data-fetching and state management library for React applications. It provides a simple and efficient way to handle server-state in your applications, making it easier to fetch, cache, and synchronize data.

#### **Key Features**

1. **Data Fetching**: Simplifies data fetching from APIs or other sources.
2. **Caching**: Automatically caches data to improve performance and reduce unnecessary network requests.
3. **Automatic Refetching**: Refetches data in the background to keep it up-to-date.
4. **Synchronization**: Synchronizes data between components.
5. **Query Invalidation**: Allows you to invalidate and refetch queries when data changes.
6. **Pagination & Infinite Query**: Provides built-in support for pagination and infinite scrolling.
7. **DevTools**: Comes with DevTools for debugging and monitoring query state.

#### **Why It’s Popular**

1. **Declarative Data Fetching**: Makes it easy to declare data dependencies and automatically handles data fetching and updating.
2. **Built-in Caching**: Improves performance by caching data and reducing network requests.
3. **Background Updates**: Keeps data fresh and up-to-date without manual intervention.
4. **Ease of Use**: Provides a simple and intuitive API.
5. **Optimistic Updates**: Supports optimistic updates to provide a better user experience.

### Setting Up React Query in a Vite + TypeScript + TailwindCSS Project

1. **Install React Query**

   First, you need to install the necessary packages:

   ```bash
   npm install @tanstack/react-query
   ```

2. **Set Up the React Query Client**

   Create a file (e.g., `react-query.ts`) to configure the React Query client:

   ```typescript
   // src/react-query.ts
   import { QueryClient } from "@tanstack/react-query";

   const queryClient = new QueryClient();

   export default queryClient;
   ```

3. **Provide the QueryClient to Your Application**

   Wrap your application with the `QueryClientProvider` to make the client available throughout your app:

   ```typescript
   // src/main.tsx
   import React from "react";
   import ReactDOM from "react-dom";
   import App from "./App";
   import { QueryClientProvider } from "@tanstack/react-query";
   import queryClient from "./react-query";

   ReactDOM.render(
     <React.StrictMode>
       <QueryClientProvider client={queryClient}>
         <App />
       </QueryClientProvider>
     </React.StrictMode>,
     document.getElementById("root")
   );
   ```

4. **Fetch Data Using React Query**

   Use the `useQuery` hook to fetch data and handle state. Here’s an example of how to integrate it into your `StockComponent`:

   ```typescript
   import React from "react";
   import { useQuery } from "@tanstack/react-query";
   import StockTabs from "./StockTabs";

   // Function to fetch chart data
   const fetchChartData = async (symbol: string) => {
     const response = await fetch(`http://localhost:3000/chart/${symbol}`);
     if (!response.ok) {
       throw new Error("Network response was not ok");
     }
     return response.json();
   };

   const StockComponent = () => {
     // Use the useQuery hook to fetch chart data
     const { data, error, isLoading } = useQuery(
       ["chartData", "TCS"], // Query key
       () => fetchChartData("TCS") // Fetch function
     );

     return (
       <div className="stock-container">
         <StockTabs />
         {isLoading && <p>Loading chart data...</p>}
         {error && <p>Error fetching chart data: {error.message}</p>}
         {data && (
           <div>
             {/* Render your chart data here */}
             <pre>{JSON.stringify(data, null, 2)}</pre>
           </div>
         )}
       </div>
     );
   };

   export default StockComponent;
   ```

### Detailed Notes on TanStack React Query

1. **Fundamentals**

   - **Query Client**: The core of React Query. It manages all query states, caching, and synchronization.
   - **Queries**: Fetch data using `useQuery`. Supports async functions to retrieve data.
   - **Mutations**: Use `useMutation` for creating, updating, or deleting data. Useful for non-GET requests.
   - **Query Keys**: Unique identifiers for queries. They are used to cache and manage query data.
   - **Query Functions**: Functions used to fetch data. They should return a promise.

2. **Core Concepts**

   - **Caching**: React Query caches data to avoid unnecessary requests. Cache duration and invalidation can be configured.
   - **Automatic Refetching**: Automatically refetches data on certain triggers (e.g., window focus, interval).
   - **Query Invalidation**: Manually trigger refetching of queries to ensure data consistency.
   - **Pagination & Infinite Query**: Built-in support for handling paginated data and infinite scrolling.

3. **Advanced Features**

   - **Query DevTools**: Provides a UI to inspect and manage queries. Useful for debugging.
   - **Optimistic Updates**: Allows for immediate updates to the UI while the mutation request is processed.
   - **Query Cancelling**: Cancels ongoing requests if they become irrelevant (e.g., when navigating away from a page).

### Summary

TanStack React Query is a powerful tool for managing server-state in React applications. Its efficiency stems from its built-in caching, automatic refetching, and synchronization capabilities. Its popularity is due to its ease of use, declarative data-fetching approach, and rich feature set.

To share data fetched using `useQuery` among different components, you have a few options. Here’s a detailed approach on how to achieve this in a React application using TanStack React Query:

### 1. **Using React Query Context**

Since the data is already fetched and cached by React Query, you can access it from any component that uses `useQuery` with the same query key. To share and manipulate this data effectively, follow these steps:

#### **Step-by-Step Solution**

1. **Fetch and Transform Data in a Parent Component**

   You can fetch the data and add an ID or perform any transformation in a parent component. Then, pass the transformed data down to child components via props or a context provider.

   ```typescript
   // src/components/StockComponent.tsx
   import React from "react";
   import { useQuery } from "@tanstack/react-query";
   import { useHistory } from "react-router-dom"; // If you use React Router
   import StockTabs from "./StockTabs";
   import CalendarComponent from "./CalendarComponent"; // Import your CalendarComponent

   const fetchChartData = async (symbol: string) => {
     const response = await fetch(`http://localhost:3000/chart/${symbol}`);
     if (!response.ok) {
       throw new Error("Network response was not ok");
     }
     return response.json();
   };

   const StockComponent = () => {
     const { data, error, isLoading } = useQuery(["chartData", "TCS"], () =>
       fetchChartData("TCS")
     );

     // Adding an ID or modifying the data
     const transformedData = data ? { ...data, id: "unique-id" } : null;

     return (
       <div className="stock-container">
         <StockTabs />
         {isLoading && <p>Loading chart data...</p>}
         {error && <p>Error fetching chart data: {error.message}</p>}
         {transformedData && (
           <div>
             {/* Render your chart data */}
             <pre>{JSON.stringify(transformedData, null, 2)}</pre>
             <CalendarComponent stockData={transformedData} />
           </div>
         )}
       </div>
     );
   };

   export default StockComponent;
   ```

2. **Use Context for Global State**

   If you need to access the stock data in multiple places or components, consider using React Context to provide and consume the data globally.

   **Create a Context Provider:**

   ```typescript
   // src/contexts/StockContext.tsx
   import React, { createContext, useContext, ReactNode } from "react";

   interface StockContextType {
     stockData: any; // Adjust type if needed
   }

   const StockContext = createContext<StockContextType | undefined>(undefined);

   export const StockProvider: React.FC<{ children: ReactNode }> = ({
     children,
   }) => {
     const { data } = useQuery(["chartData", "TCS"], () =>
       fetchChartData("TCS")
     );

     const stockData = data ? { ...data, id: "unique-id" } : null;

     return (
       <StockContext.Provider value={{ stockData }}>
         {children}
       </StockContext.Provider>
     );
   };

   export const useStockContext = () => {
     const context = useContext(StockContext);
     if (context === undefined) {
       throw new Error("useStockContext must be used within a StockProvider");
     }
     return context;
   };
   ```

   **Wrap Your Application with the Provider:**

   ```typescript
   // src/main.tsx
   import React from "react";
   import ReactDOM from "react-dom";
   import App from "./App";
   import { QueryClientProvider } from "@tanstack/react-query";
   import queryClient from "./react-query";
   import { StockProvider } from "./contexts/StockContext";

   ReactDOM.render(
     <React.StrictMode>
       <QueryClientProvider client={queryClient}>
         <StockProvider>
           <App />
         </StockProvider>
       </QueryClientProvider>
     </React.StrictMode>,
     document.getElementById("root")
   );
   ```

   **Consume the Context in Your Components:**

   ```typescript
   // src/components/CalendarComponent.tsx
   import React from "react";
   import { useStockContext } from "../contexts/StockContext";

   const CalendarComponent = () => {
     const { stockData } = useStockContext();

     return (
       <div>
         <h2>Calendar Component</h2>
         {stockData && (
           <div>
             <p>Stock ID: {stockData.id}</p>
             {/* Render other parts of stockData */}
           </div>
         )}
       </div>
     );
   };

   export default CalendarComponent;
   ```

### Summary

- **Parent Component Prop Passing**: Ideal for simple use cases where the parent component fetches data and passes it down to children.
- **React Context**: Suitable for scenarios where multiple components need access to the same data, and it’s beneficial to manage state globally.

Using context allows for better scalability in complex applications, as you can avoid prop drilling and centralize data management. Choose the approach that best fits your application’s needs.

## If you want to manage multiple API calls (like stock data, weather data, news feed) and provide their data to various components using a single context, you can follow an approach where you create a central context for your application's data and fetch all the data within that context. This allows you to maintain a single source of truth and access different data sets across your app.

Here’s a detailed approach on how to achieve this:

### 1. **Create a Central Context**

You will create a central context that wraps your entire application and provides access to various pieces of data fetched from different APIs.

**Create the Context and Provider:**

1. **Define the Context:**

   ```typescript
   // src/contexts/AppDataContext.tsx
   import React, { createContext, useContext, ReactNode } from "react";
   import {
     useQuery,
     QueryClient,
     QueryClientProvider,
   } from "@tanstack/react-query";

   // Define types for your data
   interface StockData {
     id: string;
     // Add other properties
   }

   interface WeatherData {
     temperature: number;
     // Add other properties
   }

   interface NewsFeedData {
     articles: Array<any>;
     // Add other properties
   }

   interface AppDataContextType {
     stockData: StockData | null;
     weatherData: WeatherData | null;
     newsFeedData: NewsFeedData | null;
   }

   const AppDataContext = createContext<AppDataContextType | undefined>(
     undefined
   );

   // Fetch functions
   const fetchStockData = async () => {
     const response = await fetch("http://localhost:3000/stock");
     if (!response.ok) throw new Error("Network response was not ok");
     return response.json();
   };

   const fetchWeatherData = async () => {
     const response = await fetch("http://localhost:3000/weather");
     if (!response.ok) throw new Error("Network response was not ok");
     return response.json();
   };

   const fetchNewsFeedData = async () => {
     const response = await fetch("http://localhost:3000/news");
     if (!response.ok) throw new Error("Network response was not ok");
     return response.json();
   };

   export const AppDataProvider: React.FC<{ children: ReactNode }> = ({
     children,
   }) => {
     const { data: stockData } = useQuery(["stockData"], fetchStockData);
     const { data: weatherData } = useQuery(["weatherData"], fetchWeatherData);
     const { data: newsFeedData } = useQuery(
       ["newsFeedData"],
       fetchNewsFeedData
     );

     const contextValue = {
       stockData: stockData || null,
       weatherData: weatherData || null,
       newsFeedData: newsFeedData || null,
     };

     return (
       <AppDataContext.Provider value={contextValue}>
         {children}
       </AppDataContext.Provider>
     );
   };

   export const useAppDataContext = () => {
     const context = useContext(AppDataContext);
     if (context === undefined) {
       throw new Error(
         "useAppDataContext must be used within an AppDataProvider"
       );
     }
     return context;
   };
   ```

2. **Wrap Your Application with the Provider:**

   ```typescript
   // src/main.tsx
   import React from "react";
   import ReactDOM from "react-dom";
   import App from "./App";
   import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
   import { AppDataProvider } from "./contexts/AppDataContext";

   const queryClient = new QueryClient();

   ReactDOM.render(
     <React.StrictMode>
       <QueryClientProvider client={queryClient}>
         <AppDataProvider>
           <App />
         </AppDataProvider>
       </QueryClientProvider>
     </React.StrictMode>,
     document.getElementById("root")
   );
   ```

### 2. **Consume Data from the Context**

In any component, you can access the data provided by the context. Here’s how to use the context to access the data in different components:

**Example Usage in a Component:**

```typescript
// src/components/StockComponent.tsx
import React from "react";
import { useAppDataContext } from "../contexts/AppDataContext";

const StockComponent = () => {
  const { stockData } = useAppDataContext();

  return (
    <div className="stock-container">
      {stockData ? (
        <div>
          <h2>Stock Data</h2>
          <pre>{JSON.stringify(stockData, null, 2)}</pre>
        </div>
      ) : (
        <p>No stock data available</p>
      )}
    </div>
  );
};

export default StockComponent;
```

**Example Usage in Another Component:**

```typescript
// src/components/WeatherComponent.tsx
import React from "react";
import { useAppDataContext } from "../contexts/AppDataContext";

const WeatherComponent = () => {
  const { weatherData } = useAppDataContext();

  return (
    <div className="weather-container">
      {weatherData ? (
        <div>
          <h2>Weather Data</h2>
          <pre>{JSON.stringify(weatherData, null, 2)}</pre>
        </div>
      ) : (
        <p>No weather data available</p>
      )}
    </div>
  );
};

export default WeatherComponent;
```

### Summary

- **Central Context**: A single context (`AppDataContext`) provides all the fetched data.
- **Context Provider**: Fetches data from multiple APIs and provides it to the entire application.
- **Query Integration**: Uses `useQuery` to fetch data within the context provider.
- **Data Access**: Any component can access the shared data using the context.

This approach centralizes data management and avoids prop drilling, making your application more organized and scalable. It’s particularly useful in larger applications where multiple components need access to various pieces of data.

### Refactored Structure

1. **Create API Call Functions**
2. **Create Data Fetching Hooks**
3. **Create the Context Provider**

### 1. **Create API Call Functions**

Move the API call functions to a separate file. This keeps your code modular and easier to test.

```typescript
// src/api/stockApi.ts
export const fetchStockData = async () => {
  const response = await fetch("http://localhost:3000/stock");
  if (!response.ok) throw new Error("Network response was not ok");
  return response.json();
};

// src/api/weatherApi.ts
export const fetchWeatherData = async () => {
  const response = await fetch("http://localhost:3000/weather");
  if (!response.ok) throw new Error("Network response was not ok");
  return response.json();
};

// src/api/newsApi.ts
export const fetchNewsFeedData = async () => {
  const response = await fetch("http://localhost:3000/news");
  if (!response.ok) throw new Error("Network response was not ok");
  return response.json();
};
```

### 2. **Create Data Fetching Hooks**

Create custom hooks for fetching data using `useQuery`. This separates the data fetching logic from the context provider.

```typescript
// src/hooks/useStockData.ts
import { useQuery } from "@tanstack/react-query";
import { fetchStockData } from "../api/stockApi";

export const useStockData = () => {
  return useQuery(["stockData"], fetchStockData);
};

// src/hooks/useWeatherData.ts
import { useQuery } from "@tanstack/react-query";
import { fetchWeatherData } from "../api/weatherApi";

export const useWeatherData = () => {
  return useQuery(["weatherData"], fetchWeatherData);
};

// src/hooks/useNewsFeedData.ts
import { useQuery } from "@tanstack/react-query";
import { fetchNewsFeedData } from "../api/newsApi";

export const useNewsFeedData = () => {
  return useQuery(["newsFeedData"], fetchNewsFeedData);
};
```

### 3. **Create the Context Provider**

Use the custom hooks in your context provider to fetch and provide the data.

```typescript
// src/contexts/AppDataContext.tsx
import React, { createContext, useContext, ReactNode } from "react";
import { useStockData } from "../hooks/useStockData";
import { useWeatherData } from "../hooks/useWeatherData";
import { useNewsFeedData } from "../hooks/useNewsFeedData";

interface StockData {
  id: string;
  // Add other properties
}

interface WeatherData {
  temperature: number;
  // Add other properties
}

interface NewsFeedData {
  articles: Array<any>;
  // Add other properties
}

interface AppDataContextType {
  stockData: StockData | null;
  weatherData: WeatherData | null;
  newsFeedData: NewsFeedData | null;
}

const AppDataContext = createContext<AppDataContextType | undefined>(undefined);

export const AppDataProvider: React.FC<{ children: ReactNode }> = ({
  children,
}) => {
  const {
    data: stockData,
    error: stockError,
    isLoading: stockLoading,
  } = useStockData();
  const {
    data: weatherData,
    error: weatherError,
    isLoading: weatherLoading,
  } = useWeatherData();
  const {
    data: newsFeedData,
    error: newsError,
    isLoading: newsLoading,
  } = useNewsFeedData();

  if (stockLoading || weatherLoading || newsLoading)
    return <div>Loading...</div>;
  if (stockError || weatherError || newsError)
    return <div>Error loading data</div>;

  const contextValue = {
    stockData: stockData || null,
    weatherData: weatherData || null,
    newsFeedData: newsFeedData || null,
  };

  return (
    <AppDataContext.Provider value={contextValue}>
      {children}
    </AppDataContext.Provider>
  );
};

export const useAppDataContext = () => {
  const context = useContext(AppDataContext);
  if (context === undefined) {
    throw new Error("useAppDataContext must be used within an AppDataProvider");
  }
  return context;
};
```

### Summary

- **API Call Functions**: Separate API functions for better modularity.
- **Data Fetching Hooks**: Custom hooks for data fetching using `useQuery`.
- **Context Provider**: Uses hooks to fetch data and provide it via context.

This structure maintains separation of concerns and ensures that each piece of your application is responsible for a specific part of the logic. It’s easier to manage and test each part of your application this way.
