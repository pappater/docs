CORS, or Cross-Origin Resource Sharing, is a security feature implemented in web browsers to prevent malicious websites from making unauthorized requests to a different domain. It allows web applications to request resources from another domain in a controlled and secure manner.

### Concepts of CORS

1. **Same-Origin Policy**: This is the foundational security measure that CORS builds upon. The same-origin policy restricts how a web page can request resources from another domain. For example, if you have a web page at `example.com`, it can only make requests to `example.com` unless explicitly allowed by CORS.

2. **Origin**: The origin is defined by the protocol (http/https), domain (example.com), and port (if specified). For example, `http://example.com:80` and `https://example.com` are different origins.

3. **Preflight Requests**: Before making a request that could potentially alter data (like a `PUT` or `DELETE` request), the browser sends a preflight `OPTIONS` request to the server to check if the actual request is safe. This preflight request contains headers that specify the HTTP method and headers of the actual request.

4. **Access-Control-Allow-Origin**: This is a response header sent by the server to indicate which origins are permitted to access the resources. For example, `Access-Control-Allow-Origin: *` allows any origin to access the resource, while `Access-Control-Allow-Origin: http://example.com` allows only the specified origin.

5. **Access-Control-Allow-Methods**: This header specifies which HTTP methods (GET, POST, PUT, DELETE, etc.) are allowed when accessing the resource.

6. **Access-Control-Allow-Headers**: This header indicates which headers can be used in the actual request. It’s used to specify custom headers that the server is willing to accept.

7. **Access-Control-Allow-Credentials**: This header determines whether the response to the request can be exposed when the credentials flag is true. This is used to allow cookies and HTTP authentication to be included in the request.

8. **Access-Control-Expose-Headers**: This header indicates which headers are safe to expose to the client.

9. **Access-Control-Max-Age**: This header specifies how long the results of a preflight request can be cached, in seconds.

### Example Scenario

Let's say you have two servers:

1. **Client Server**: `http://client.example.com`
2. **API Server**: `http://api.example.com`

If you want the client server to make a request to the API server, the API server needs to be configured to allow this cross-origin request.

#### Server Configuration (API Server)

On the API server, you would configure CORS headers like this (in an Express.js server, for example):

```javascript
const express = require("express");
const app = express();

app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "http://client.example.com"); // Allow specific origin
  res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE"); // Allow specific methods
  res.header("Access-Control-Allow-Headers", "Content-Type, Authorization"); // Allow specific headers
  next();
});

app.get("/data", (req, res) => {
  res.json({ message: "Hello from the API!" });
});

app.listen(3000, () => {
  console.log("API server running on port 3000");
});
```

#### Client Request

On the client side, you can make an HTTP request using JavaScript:

```javascript
fetch("http://api.example.com/data", {
  method: "GET",
  credentials: "include", // If sending cookies or authentication headers
})
  .then((response) => response.json())
  .then((data) => console.log(data))
  .catch((error) => console.error("Error:", error));
```

### Important Points

- **Security**: CORS helps prevent malicious cross-site requests, but proper server-side validation and security measures are also essential.
- **Browser Enforcement**: Browsers enforce CORS policies, and improper configuration can lead to errors or failures in data fetching.

### From https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS

````markdown
# Cross-Origin Resource Sharing (CORS)

Cross-Origin Resource Sharing (CORS) is an HTTP-header based mechanism that allows a server to indicate any origins (domain, scheme, or port) other than its own from which a browser should permit loading resources. CORS also relies on a mechanism where browsers make a **"preflight"** request to the server hosting the cross-origin resource to check if the server will permit the actual request. In this preflight, the browser sends headers indicating the HTTP method and headers that will be used in the actual request.

An example of a cross-origin request: the front-end JavaScript code served from `https://domain-a.com` uses `fetch()` to make a request for `https://domain-b.com/data.json`.

For security reasons, browsers restrict cross-origin HTTP requests initiated from scripts. For example, `fetch()` and `XMLHttpRequest` follow the **same-origin policy**. This means that a web application using these APIs can only request resources from the same origin the application was loaded from unless the response from other origins includes the correct CORS headers.

---

## Diagrammatic representation of CORS mechanism

CORS supports secure cross-origin requests and data transfers between browsers and servers. Browsers use CORS in APIs such as `fetch()` or `XMLHttpRequest` to mitigate the risks of cross-origin HTTP requests.

### What requests use CORS?

This cross-origin sharing standard can enable cross-origin HTTP requests for:

- Invocations of `fetch()` or `XMLHttpRequest`.
- Web Fonts (for cross-domain font usage in `@font-face` within CSS).
- WebGL textures.
- Images/video frames drawn to a canvas using `drawImage()`.
- CSS Shapes from images.

---

## Functional Overview

CORS works by adding new HTTP headers that let servers describe which origins are permitted to read that information from a web browser. Additionally, for HTTP request methods that can cause side-effects on server data (methods other than GET, or POST with certain MIME types), the specification mandates that browsers **preflight** the request. This is done by sending an HTTP `OPTIONS` request method to solicit supported methods from the server, and upon approval, sending the actual request.

Servers can also inform clients whether "credentials" (such as Cookies and HTTP Authentication) should be sent with requests.

### CORS Failures

CORS failures result in errors, but for security reasons, specifics about the error are not available to JavaScript. All the code knows is that an error occurred. The only way to determine what went wrong is to check the browser's console for details.

---

## Examples of Access Control Scenarios

Below are three scenarios demonstrating how CORS works. All examples use `fetch()`, which can make cross-origin requests in any supporting browser.

### Simple Requests

Some requests don't trigger a CORS preflight. These are called **simple requests** from the obsolete CORS spec, though the Fetch spec (which now defines CORS) no longer uses this term.

A **simple request** meets the following conditions:

1. Uses one of the allowed methods:
   - GET
   - HEAD
   - POST
2. Only the following headers can be manually set:
   - Accept
   - Accept-Language
   - Content-Language
   - Content-Type (with restrictions)
3. The allowed type/subtype combinations for the `Content-Type` header are:
   - `application/x-www-form-urlencoded`
   - `multipart/form-data`
   - `text/plain`
4. No `ReadableStream` object is used in the request.

> Note: Safari has additional restrictions on header values.

For example, content at `https://foo.example` might fetch JSON content from `https://bar.other` like this:

```js
const fetchPromise = fetch("https://bar.other");

fetchPromise
  .then((response) => response.json())
  .then((data) => {
    console.log(data);
  });
```
````

This operation performs a simple exchange between the client and the server, using CORS headers to handle privileges.

---

### Server Response to Simple CORS GET Request

The server responds with an `Access-Control-Allow-Origin` header:

```
Access-Control-Allow-Origin: *
```

This means that the resource can be accessed by any origin.

If the server wants to restrict access to requests only from `https://foo.example`, it would send:

```
Access-Control-Allow-Origin: https://foo.example
```

> **Note:** When responding to a credentialed request, the server must specify an origin in the value of the `Access-Control-Allow-Origin` header, instead of using the `"*"` wildcard.

````

```markdown
# Preflighted Requests

Unlike simple requests, for **preflighted** requests, the browser first sends an HTTP request using the `OPTIONS` method to the resource on the other origin to determine if the actual request is safe to send. Such cross-origin requests are preflighted since they may have implications for user data.

The following is an example of a request that will be preflighted:

```js
const fetchPromise = fetch("https://bar.other/doc", {
  method: "POST",
  mode: "cors",
  headers: {
    "Content-Type": "text/xml",
    "X-PINGOTHER": "pingpong",
  },
  body: "<person><name>Arun</name></person>",
});

fetchPromise.then((response) => {
  console.log(response.status);
});
````

In this example, the request uses a `Content-Type` of `text/xml`, and a custom header `X-PINGOTHER` is set, which triggers a preflight request.

---

### Diagram of a Request That is Preflighted

The actual `POST` request does not include the `Access-Control-Request-*` headers; they are needed only for the `OPTIONS` request. Below is the full exchange between client and server.

#### Preflight Request/Response:

```http
OPTIONS /doc HTTP/1.1
Host: bar.other
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:71.0) Gecko/20100101 Firefox/71.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-us,en;q=0.5
Accept-Encoding: gzip,deflate
Connection: keep-alive
Origin: https://foo.example
Access-Control-Request-Method: POST
Access-Control-Request-Headers: content-type,x-pingother
```

```http
HTTP/1.1 204 No Content
Date: Mon, 01 Dec 2008 01:15:39 GMT
Server: Apache/2
Access-Control-Allow-Origin: https://foo.example
Access-Control-Allow-Methods: POST, GET, OPTIONS
Access-Control-Allow-Headers: X-PINGOTHER, Content-Type
Access-Control-Max-Age: 86400
Vary: Accept-Encoding, Origin
Keep-Alive: timeout=2, max=100
Connection: Keep-Alive
```

The `OPTIONS` method is used to determine further information from the server. The `Access-Control-Request-Method: POST` header tells the server that the actual request will use the `POST` method, and `Access-Control-Request-Headers` informs the server that custom headers (`X-PINGOTHER` and `Content-Type`) will be included.

#### Server Response:

```http
Access-Control-Allow-Origin: https://foo.example
Access-Control-Allow-Methods: POST, GET, OPTIONS
Access-Control-Allow-Headers: X-PINGOTHER, Content-Type
Access-Control-Max-Age: 86400
```

- **Access-Control-Allow-Origin**: Restricts access to the requesting origin domain only.
- **Access-Control-Allow-Methods**: Specifies valid methods (`POST`, `GET`) for querying the resource.
- **Access-Control-Allow-Headers**: Confirms that custom headers (`X-PINGOTHER`, `Content-Type`) are allowed.
- **Access-Control-Max-Age**: Indicates the time (in seconds) the preflight response can be cached (86400 seconds = 24 hours).

---

### Real Request After Preflight

```http
POST /doc HTTP/1.1
Host: bar.other
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:71.0) Gecko/20100101 Firefox/71.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-us,en;q=0.5
Accept-Encoding: gzip,deflate
Connection: keep-alive
X-PINGOTHER: pingpong
Content-Type: text/xml; charset=UTF-8
Referer: https://foo.example/examples/preflightInvocation.html
Content-Length: 55
Origin: https://foo.example
Pragma: no-cache
Cache-Control: no-cache

<person><name>Arun</name></person>
```

```http
HTTP/1.1 200 OK
Date: Mon, 01 Dec 2008 01:15:40 GMT
Server: Apache/2
Access-Control-Allow-Origin: https://foo.example
Vary: Accept-Encoding, Origin
Content-Encoding: gzip
Content-Length: 235
Keep-Alive: timeout=2, max=99
Connection: Keep-Alive
Content-Type: text/plain
```

---

## Preflighted Requests and Redirects

Not all browsers currently support following redirects after a preflighted request. If a redirect occurs, some browsers will report an error like:

```
The request was redirected to https://example.com/foo, which is disallowed for cross-origin requests that require preflight.
```

This behavior was originally required by the CORS protocol but was changed in later specifications. However, not all browsers have implemented this change.

### Workarounds for Redirects:

- Change the server-side behavior to avoid preflight or redirects.
- Modify the request to be a **simple request** that doesn't trigger a preflight.
- Perform a simple request to determine the final URL, then send the actual request to that URL.

If the `Authorization` header triggers the preflight, you won't be able to work around this limitation unless you control the server.

````markdown
# Requests with Credentials

> **Note**: When making credentialed requests to a different domain, third-party cookie policies will still apply. This policy is enforced regardless of any server or client setup.

The most interesting capability exposed by both `fetch()` or `XMLHttpRequest` and CORS is the ability to make **credentialed** requests that are aware of HTTP cookies and HTTP Authentication information. By default, in cross-origin `fetch()` or `XMLHttpRequest` calls, browsers do not send credentials.

- To ask for a `fetch()` request to include credentials, set the `credentials` option to `"include"`.
- To ask for an `XMLHttpRequest` request to include credentials, set the `XMLHttpRequest.withCredentials` property to `true`.

### Example of a Credentialed Request

Content originally loaded from `https://foo.example` makes a simple GET request to a resource on `https://bar.other` which sets cookies. Content on `foo.example` might contain JavaScript like this:

```js
const url = "https://bar.other/resources/credentialed-content/";
const request = new Request(url, { credentials: "include" });
const fetchPromise = fetch(request);

fetchPromise.then((response) => console.log(response));
```
````

This code creates a `Request` object, setting the `credentials` option to `"include"`, then passes this request into `fetch()`. Since this is a simple GET request, it is not preflighted. However, the browser will reject any response that does not have the `Access-Control-Allow-Credentials: true` header, and the response will not be available to the invoking web content.

---

### Example Exchange: Client and Server

```http
GET /resources/credentialed-content/ HTTP/1.1
Host: bar.other
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:71.0) Gecko/20100101 Firefox/71.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-us,en;q=0.5
Accept-Encoding: gzip,deflate
Connection: keep-alive
Referer: https://foo.example/examples/credential.html
Origin: https://foo.example
Cookie: pageAccess=2
```

```http
HTTP/1.1 200 OK
Date: Mon, 01 Dec 2008 01:34:52 GMT
Server: Apache/2
Access-Control-Allow-Origin: https://foo.example
Access-Control-Allow-Credentials: true
Cache-Control: no-cache
Pragma: no-cache
Set-Cookie: pageAccess=3; expires=Wed, 31-Dec-2008 01:34:53 GMT
Vary: Accept-Encoding, Origin
Content-Encoding: gzip
Content-Length: 106
Keep-Alive: timeout=2, max=100
Connection: Keep-Alive
Content-Type: text/plain
```

In this example, although the request's `Cookie` header contains a cookie for `https://bar.other`, if `bar.other` did not respond with `Access-Control-Allow-Credentials: true`, the response would be ignored by the browser and not made available to the web content.

---

## Preflight Requests and Credentials

Preflight requests for CORS must **never** include credentials. The response to a preflight request must specify `Access-Control-Allow-Credentials: true` to indicate that the actual request can be made with credentials.

> **Note**: Some enterprise authentication services require that TLS client certificates be sent in preflight requests, which is against the Fetch specification.

- Firefox 87 allows non-compliant behavior by setting `network.cors_preflight.allow_client_cert` to `true`.
- Chromium-based browsers always send TLS client certificates in CORS preflight requests.

---

## Credentialed Requests and Wildcards

When responding to a credentialed request:

1. The server **must not** specify the `*` wildcard for the `Access-Control-Allow-Origin` header but must specify an explicit origin, such as `Access-Control-Allow-Origin: https://example.com`.
2. The server **must not** specify the `*` wildcard for the `Access-Control-Allow-Headers` header but must specify an explicit list of headers, like `Access-Control-Allow-Headers: X-PINGOTHER, Content-Type`.
3. The server **must not** specify the `*` wildcard for the `Access-Control-Allow-Methods` header but must specify an explicit list of methods, like `Access-Control-Allow-Methods: POST, GET`.
4. The server **must not** specify the `*` wildcard for the `Access-Control-Expose-Headers` header but must specify an explicit list of headers, like `Access-Control-Expose-Headers: Content-Encoding, Kuma-Revision`.

If a request includes a credential (like a `Cookie` header) and the response includes an `Access-Control-Allow-Origin: *` header, the browser will block access to the response and report a CORS error in the console.

However, if the response includes an actual origin rather than the wildcard (e.g., `Access-Control-Allow-Origin: https://example.com`), the browser will allow access to the response from that origin.

> **Note**: Any `Set-Cookie` header in the response will not set a cookie if the `Access-Control-Allow-Origin` value is the `*` wildcard rather than an actual origin.

---

## Third-Party Cookies

Cookies set in CORS responses are subject to normal third-party cookie policies. In the example above, the page is loaded from `foo.example`, but the `Cookie` header in the response is sent by `bar.other`. If the user's browser is configured to reject third-party cookies, the cookie from `bar.other` will not be saved.

Similarly, cookies in requests may be suppressed by third-party cookie policies, potentially nullifying the capability of making credentialed requests altogether.

The cookie policy around the `SameSite` attribute would also apply.

````


```markdown
# The HTTP Response Headers

This section lists the HTTP response headers that servers return for access control requests as defined by the Cross-Origin Resource Sharing (CORS) specification. The previous section provides an overview of these in action.

## Access-Control-Allow-Origin

A returned resource may have one `Access-Control-Allow-Origin` header with the following syntax:

```http
Access-Control-Allow-Origin: <origin> | *
````

`Access-Control-Allow-Origin` specifies either a single origin, allowing browsers to grant that origin access to the resource, or — for requests without credentials — the `*` wildcard allows any origin to access the resource.

For example, to allow code from the origin `https://mozilla.org` to access the resource, you can specify:

```http
Access-Control-Allow-Origin: https://mozilla.org
Vary: Origin
```

If the server specifies a single origin (that may dynamically change based on the requesting origin as part of an allowlist) rather than the `*` wildcard, the server should also include `Origin` in the `Vary` response header to indicate to clients that server responses differ based on the value of the `Origin` request header.

## Access-Control-Expose-Headers

The `Access-Control-Expose-Headers` header adds specified headers to the allowlist that JavaScript (e.g., `Response.headers`) in browsers can access.

```http
Access-Control-Expose-Headers: <header-name>[, <header-name>]*
```

For example:

```http
Access-Control-Expose-Headers: X-My-Custom-Header, X-Another-Custom-Header
```

This would allow the `X-My-Custom-Header` and `X-Another-Custom-Header` headers to be exposed to the browser.

## Access-Control-Max-Age

The `Access-Control-Max-Age` header indicates how long the results of a preflight request can be cached.

```http
Access-Control-Max-Age: <delta-seconds>
```

The `delta-seconds` parameter specifies the number of seconds the results can be cached.

## Access-Control-Allow-Credentials

The `Access-Control-Allow-Credentials` header indicates whether the response to the request can be exposed when the credentials flag is `true`. If this header is not returned with the resource, the response is ignored by the browser.

```http
Access-Control-Allow-Credentials: true
```

Credentialed requests are discussed in more detail in the previous sections.

## Access-Control-Allow-Methods

The `Access-Control-Allow-Methods` header specifies the HTTP method(s) allowed when accessing the resource. This is used in response to a preflight request.

```http
Access-Control-Allow-Methods: <method>[, <method>]*
```

An example of a preflight request is provided in earlier sections, which includes an example that sends this header to the browser.

## Access-Control-Allow-Headers

The `Access-Control-Allow-Headers` header is used in response to a preflight request to indicate which HTTP headers can be used when making the actual request. This header responds to the browser's `Access-Control-Request-Headers` header.

```http
Access-Control-Allow-Headers: <header-name>[, <header-name>]*
```

# The HTTP Request Headers

This section lists the headers that clients may use when issuing HTTP requests in order to make use of the cross-origin sharing feature. These headers are set for you when making server requests. Developers do not need to set these headers programmatically.

## Origin

The `Origin` header indicates the origin of the cross-origin access request or preflight request.

```http
Origin: <origin>
```

The origin is a URL indicating the server from which the request originates. It does not include any path information, only the server name.

> **Note**: The origin value can be `null`.

The `Origin` header is always sent in access control requests.

## Access-Control-Request-Method

The `Access-Control-Request-Method` is used when issuing a preflight request to let the server know what HTTP method will be used when the actual request is made.

```http
Access-Control-Request-Method: <method>
```

Examples of this usage are provided above.

## Access-Control-Request-Headers

The `Access-Control-Request-Headers` header is used when issuing a preflight request to let the server know which HTTP headers will be used when the actual request is made (e.g., passing them as the `headers` option). This browser-side header is answered by the server-side `Access-Control-Allow-Headers` header.

```http
Access-Control-Request-Headers: <field-name>[, <field-name>]*
```
