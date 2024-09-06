Web security refers to the measures taken to protect websites, web applications, and web services from malicious attacks and unauthorized access. It involves securing both the server and client-side components to ensure data privacy, integrity, and availability.

### **OWASP**

The **Open Web Application Security Project (OWASP)** is a nonprofit organization that aims to improve software security. OWASP provides free resources like tools, guides, and the famous **OWASP Top 10**, which is a list of the most critical web application security vulnerabilities. Understanding these vulnerabilities is fundamental for securing web applications.

### **OWASP Top 10 Web Security Vulnerabilities**

### 1. **Injection**

#### **Definition**:

Injection occurs when an attacker supplies untrusted data to an interpreter as part of a command or query, tricking the interpreter into executing unintended commands.

#### **Example**: SQL Injection

An attacker can input a specially crafted SQL query to manipulate the backend database.

```sql
SELECT * FROM users WHERE username = 'admin' AND password = '';
```

- If the input fields are not properly sanitized, an attacker can input something like:

```
username: 'admin'
password: ' OR '1'='1
```

- The resulting SQL query becomes:

```sql
SELECT * FROM users WHERE username = 'admin' AND password = '' OR '1' = '1';
```

- The `'1'='1'` always evaluates to true, so the attacker can log in without a valid password.

#### **Mitigation**:

- Use **prepared statements** with parameterized queries to ensure that user inputs are not executed as code.
- Validate and sanitize user inputs, especially for queries and commands.

```sql
SELECT * FROM users WHERE username = ? AND password = ?;
```

---

### 2. **Broken Authentication**

#### **Definition**:

Broken authentication occurs when application functions related to authentication and session management are improperly implemented, allowing attackers to compromise passwords, keys, or session tokens.

#### **Example**:

A website uses predictable session IDs. After logging in, a user receives a session ID in their cookies like:

```
Session ID: 12345
```

An attacker can guess the session ID and use it to impersonate a user. If they can guess or predict the session ID, they can hijack a session and gain unauthorized access.

#### **Mitigation**:

- Implement **multi-factor authentication (MFA)** to make accounts harder to compromise.
- Use **secure password storage** (bcrypt or Argon2 hashing with a salt).
- Implement strong session management (use random, unguessable session IDs, invalidate old sessions).

---

### 3. **Sensitive Data Exposure**

#### **Definition**:

Sensitive data exposure happens when sensitive information (credit cards, health records, passwords, etc.) is not properly protected, leaving it exposed to attackers.

#### **Example**:

A website allows users to enter credit card details and submits this information over an unsecured HTTP connection.

- An attacker could intercept the network traffic and steal the user’s credit card data using tools like Wireshark.

#### **Mitigation**:

- Always use **HTTPS** to encrypt data in transit (TLS).
- Encrypt sensitive data at rest (e.g., AES encryption for databases).
- Avoid storing sensitive data unless absolutely necessary.

---

### 4. **XML External Entities (XXE)**

#### **Definition**:

An XXE vulnerability occurs when an application processes XML input that includes a reference to an external entity, potentially allowing attackers to access internal files, perform SSRF attacks, or execute remote code.

#### **Example**:

An application parses XML files like:

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE foo [
  <!ELEMENT foo ANY >
  <!ENTITY xxe SYSTEM "file:///etc/passwd" >]><foo>&xxe;</foo>
```

- The `xxe` entity tries to read the content of the `/etc/passwd` file on a Unix system, which may contain sensitive information.

#### **Mitigation**:

- **Disable external entity resolution** in XML parsers.
- Use less complex data formats such as **JSON**.

```xml
parserFactory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
```

---

### 5. **Broken Access Control**

#### **Definition**:

Broken access control occurs when restrictions on what authenticated users are allowed to do are improperly enforced. Attackers can act as users or admins, or access unauthorized resources.

#### **Example**:

A user has a standard account, but through URL manipulation, they try to access the admin page:

```
http://example.com/admin/deleteUser?userId=1
```

- If the website does not properly enforce access control, the user could delete accounts even though they are not an admin.

#### **Mitigation**:

- Implement **Role-Based Access Control (RBAC)**, ensuring users can only access functions they are authorized for.
- Deny by default—make sure the system checks the user's permissions at every level.

---

### 6. **Security Misconfigurations**

#### **Definition**:

Security misconfigurations arise when the application or its underlying infrastructure has been set up in an insecure way. This includes using default credentials, unnecessary features, or debug modes.

#### **Example**:

A production server still has the default admin username and password (`admin:admin`). An attacker can simply log in to the admin panel.

#### **Mitigation**:

- **Disable unnecessary features** (e.g., directory listings, debug modes).
- Regularly audit and harden the system's configurations (e.g., change default passwords, disable unused services).

---

### 7. **Cross-Site Scripting (XSS)**

#### **Definition**:

XSS occurs when an attacker injects malicious scripts into web pages viewed by other users. The victim's browser executes the script in the context of the trusted site, potentially leading to stolen session cookies or user impersonation.

#### **Example**:

A blog comment section allows users to post comments without sanitizing the input. An attacker posts a comment like this:

```html
<script>
  alert("Your session has been hijacked!");
</script>
```

- When another user views the page, the script runs in their browser, displaying the alert. A more advanced attack could steal the user's session cookie.

#### **Mitigation**:

- **Sanitize user inputs** by escaping characters like `<`, `>`, and `&`.
- Use **Content Security Policies (CSP)** to limit the execution of scripts.

```html
comment = htmlspecialchars(comment, ENT_QUOTES, 'UTF-8');
```

---

### 8. **Insecure Deserialization**

#### **Definition**:

Insecure deserialization occurs when untrusted data is used to recreate objects (deserialize), leading to potential manipulation of the object or execution of arbitrary code.

#### **Example**:

An attacker modifies a serialized object before sending it to the server:

```json
{
  "username": "user",
  "isAdmin": true
}
```

- The server deserializes the object and grants the user admin privileges.

#### **Mitigation**:

- **Avoid deserialization** of untrusted data, especially in formats like binary.
- Use **data integrity checks** (e.g., signing objects before deserialization).

---

### 9. **Using Components with Known Vulnerabilities**

#### **Definition**:

This vulnerability occurs when applications use software components (libraries, frameworks) that have known security vulnerabilities. Attackers exploit these weaknesses to compromise the system.

#### **Example**:

Using an outdated version of a popular library (e.g., **Log4j**) that has a known remote code execution vulnerability allows attackers to execute arbitrary code on your server.

#### **Mitigation**:

- Regularly update all components.
- Use tools like **Dependabot** or **Snyk** to automatically scan for vulnerabilities in dependencies.

---

### 10. **Insufficient Logging and Monitoring**

#### **Definition**:

Without proper logging and monitoring, attacks can go undetected, and security breaches may not be identified in a timely manner, allowing attackers to cause prolonged damage.

#### **Example**:

A web application does not log failed login attempts. An attacker uses brute force to guess passwords, but there’s no alert because logging was insufficient.

#### **Mitigation**:

- **Log security-related events** such as failed login attempts, access control failures, and other suspicious activities.
- Set up **alerting systems** to notify administrators of potential attacks.
- Regularly review and test log files to ensure events are being captured correctly.

### **Key Concepts to Remember**

- **Input Validation**: Always validate and sanitize user inputs to prevent injection attacks.
- **Encryption**: Protect sensitive data using encryption both in transit (HTTPS) and at rest.
- **Access Control**: Implement least privilege access control and regularly test for vulnerabilities.
- **Security Updates**: Keep all components updated and patch known vulnerabilities.
- **Logging & Monitoring**: Ensure that security events are logged and that systems are monitored for anomalies.

# AJAX Security Cheat Sheet (https://cheatsheetseries.owasp.org/cheatsheets/AJAX_Security_Cheat_Sheet.html)

## Introduction

This document provides a starting point for AJAX security and will be updated regularly to include more detailed information about specific frameworks and technologies.

## Client-Side (JavaScript)

### 1. Use `.innerText` instead of `.innerHTML`

The use of `.innerText` will prevent most XSS problems as it automatically encodes the text.

### 2. Don't use `eval()`, `new Function()`, or other code evaluation tools

The `eval()` function is dangerous and should never be used. Needing to use `eval` usually indicates a design flaw.

### 3. Canonicalize data to the consumer (read: encode before use)

When using data to build HTML, scripts, CSS, XML, JSON, etc., ensure the data is properly encoded to prevent injection vulnerabilities and preserve the logical meaning. Check out the [OWASP Java Encoder Project](https://owasp.org/projects/#div-java-encoder).

### 4. Don't rely on client logic for security

Remember that users control the client-side logic. Browser plugins can set breakpoints, skip code, change values, etc. Never rely on client logic for security.

### 5. Don't rely on client business logic

Like security logic, ensure that any business rules or logic are duplicated on the server side to prevent users from bypassing important logic.

### 6. Avoid writing serialization code

Writing serialization code is difficult, and even small mistakes can lead to large security issues. Use existing frameworks to handle this functionality. Check the [JSON page](https://json.org/) for resources.

### 7. Avoid building XML or JSON dynamically

Dynamically building XML or JSON can introduce injection bugs. Use encoding libraries or safe JSON/XML libraries to make attributes and element data safe.

- [XSS (Cross Site Scripting) Prevention](https://owasp.org/www-community/attacks/xss/)
- [SQL Injection Prevention](https://owasp.org/www-community/attacks/SQL_Injection)

### 8. Never transmit secrets to the client

Any secrets transmitted to the client can be discovered by the user. Keep all sensitive data on the server.

### 9. Don't perform encryption in client-side code

Use **TLS/SSL** for encryption and handle encryption on the server.

### 10. Don't perform security-impacting logic on the client side

Never perform security-sensitive logic on the client side. Always handle it on the server to prevent bypassing.

## Server-Side

### 1. Use CSRF Protection

Review the [Cross-Site Request Forgery (CSRF) Prevention Cheat Sheet](https://owasp.org/www-community/attacks/csrf).

### 2. Protect against JSON Hijacking for Older Browsers

Review the [AngularJS JSON Hijacking Defense Mechanism](https://docs.angularjs.org/api/ng/service/$http#json-vulnerability-protection).

### 3. Always return JSON with an object on the outside

Always wrap JSON responses in an object to avoid security vulnerabilities.

- **Exploitable**:
  ```json
  [{ "object": "inside an array" }]
  ```
- **Not exploitable**:

  ```json
  { "object": "not inside an array" }
  ```

- **Also not exploitable**:
  ```json
  { "result": [{ "object": "inside an array" }] }
  ```

### 4. Avoid writing serialization code server-side

Avoid writing your own serialization logic. Use well-reviewed libraries and be cautious with reference vs. value types.

### 5. Services can be called by users directly

Even if you only expect AJAX client-side code to call your services, users can call them directly. Always validate inputs as they are under user control.

### 6. Avoid building XML or JSON by hand

Use your framework’s built-in tools to handle XML and JSON. Manually building these can lead to security issues.

### 7. Use JSON and XML Schema for Webservices

Use third-party libraries to validate web services against schemas to prevent security vulnerabilities.

# What is Content Security Policy (CSP)?

Content Security Policy (CSP) is a web security standard designed to prevent various types of attacks like Cross-Site Scripting (XSS), data injection, and other code execution vulnerabilities. It controls which resources a browser is allowed to load for a web page.

### Why is CSP Important?

By restricting the origins from which content can be loaded, CSP acts as a layer of defense to reduce the likelihood of code injection attacks. Without a proper CSP, malicious scripts can be injected and executed, which can compromise user data and site integrity.

### Examples of Content Security Policy Directives

Here are five common CSP directives with examples:

1. **`default-src`**: This specifies the default source for all content types (scripts, images, etc.) that are not explicitly set by other directives.

   ```http
   Content-Security-Policy: default-src 'self';
   ```

   Example: Only allow resources from the same origin (`'self'`).

2. **`script-src`**: Restricts where JavaScript can be loaded from.

   ```http
   Content-Security-Policy: script-src 'self' https://trusted-scripts.com;
   ```

   Example: Allow scripts only from the same origin (`'self'`) and a trusted third-party domain (`trusted-scripts.com`).

3. **`img-src`**: Controls where images can be loaded from.

   ```http
   Content-Security-Policy: img-src 'self' https://images.com;
   ```

   Example: Only allow images from the same origin and `images.com`.

4. **`style-src`**: Restricts where CSS can be loaded from.

   ```http
   Content-Security-Policy: style-src 'self' 'unsafe-inline';
   ```

   Example: Allow CSS from the same origin but also permit inline styles (not recommended unless necessary).

5. **`frame-ancestors`**: Restricts who can embed your site in an iframe.
   ```http
   Content-Security-Policy: frame-ancestors 'none';
   ```
   Example: Prevent your site from being embedded in any iframe to avoid clickjacking attacks.

### Is CSP Implemented by Default in React or Node.js?

CSP is **not implemented by default** in React or Node.js. You need to configure and apply it manually to enforce the policy on your web application.

### How to Add CSP in a React Application

In a React application, you can configure the CSP in the `index.html` file located in the `public` folder.

Add the following meta tag inside the `<head>` section of `public/index.html`:

```html
<meta
  http-equiv="Content-Security-Policy"
  content="default-src 'self'; script-src 'self' https://trusted-scripts.com; img-src 'self' https://images.com; style-src 'self' 'unsafe-inline'; frame-ancestors 'none';"
/>
```

This example restricts scripts, images, and styles, allowing only trusted sources.

### How to Add CSP in a Node.js Application

In a Node.js project, you can configure CSP using middleware, such as **Helmet**. Helmet is a security library for Express.js that helps secure your app by setting various HTTP headers, including CSP.

1. Install Helmet:

   ```bash
   npm install helmet
   ```

2. Apply CSP in your Node.js app:

   ```javascript
   const helmet = require("helmet");
   const express = require("express");
   const app = express();

   app.use(
     helmet.contentSecurityPolicy({
       directives: {
         defaultSrc: ["'self'"],
         scriptSrc: ["'self'", "https://trusted-scripts.com"],
         imgSrc: ["'self'", "https://images.com"],
         styleSrc: ["'self'", "'unsafe-inline'"],
         frameAncestors: ["'none'"],
       },
     })
   );

   app.get("/", (req, res) => {
     res.send("CSP is enabled!");
   });

   app.listen(3000, () => {
     console.log("Server is running on port 3000");
   });
   ```

This example sets up a CSP policy in a Node.js application with Helmet.

### Key Takeaways

- **CSP is a manual configuration**—you must set it up for both React and Node.js apps.
- **React**: Add a CSP meta tag to the `index.html` file.
- **Node.js**: Use security libraries like **Helmet** to set CSP through middleware.
- CSP helps to **mitigate XSS, data injection, and other attacks** by controlling which resources the browser is allowed to load.

Make sure to audit and test your CSP settings regularly to ensure your site is secure while still functioning as expected.

# Web Security Model: Same-Origin Policy and Content Security Policy (CSP) (https://web.dev/articles/csp)

The web's security model is based on a **same-origin policy**. For example, code from `https://mybank.com` must have access to only `https://mybank.com`'s data, and `https://evil.example.com` must never be allowed access. Each origin is, in theory, kept isolated from the rest of the web, giving developers a safe sandbox to build in. In practice, however, attackers have found several ways to subvert the system.

**Cross-site scripting (XSS)** attacks, for example, bypass the same-origin policy by tricking a site into delivering malicious code along with the intended content. This is a huge problem, as browsers trust all of the code that shows up on a page as being legitimately part of that page's security origin. The [XSS Cheat Sheet](https://owasp.org/www-project-cheat-sheets/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html) is an old but representative cross-section of the methods an attacker might use to violate this trust by injecting malicious code. If an attacker successfully injects any code at all, they've compromised the user session and gained access to private information.

This page outlines **Content Security Policy (CSP)** as a strategy for reducing the risk and impact of XSS attacks in modern browsers.

## Components of CSP

To implement an effective CSP, take the following steps:

1. Use allowlists to tell the client what's allowed and what isn't.
2. Learn what directives are available.
3. Learn the keywords they take.
4. Restrict the use of inline code and `eval()`.
5. Report policy violations to your server before enforcing them.

### Source Allowlists

XSS attacks exploit the browser's inability to distinguish between script that's part of your application and script that's been maliciously injected by a third party. For example, the Google +1 button at the bottom of this page loads and executes code from `https://apis.google.com/js/plusone.js` in the context of this page's origin. We trust that code, but we can't expect the browser to figure out on its own that code from `apis.google.com` is safe to run, while code from `apis.evil.example.com` probably isn't. The browser happily downloads and executes any code a page requests, regardless of the source.

CSP's **Content-Security-Policy** HTTP header lets you create an allowlist of sources of trusted content, and tells the browser to execute or render only resources from those sources. Even if an attacker can find a hole to inject a script through, the script won't match the allowlist, and therefore won't be executed.

We trust `apis.google.com` to deliver valid code, and we trust ourselves to do the same. Here's an example policy that allows scripts to execute only when they come from one of those two sources:

```http
Content-Security-Policy: script-src 'self' https://apis.google.com
```

The `script-src` directive controls a set of script-related privileges for a page. This header allows `'self'` as one valid source of script, and `https://apis.google.com` as another. The browser can now download and execute JavaScript from `apis.google.com` over HTTPS, as well as from the current page's origin, but not from any other origin. If an attacker injects code into your site, the browser throws an error and doesn't run the injected script.

**Console error**:

```console
Refused to load the script 'http://evil.example.com/evil.js' because it violates the following Content Security Policy directive: script-src 'self' https://apis.google.com
```

The console shows an error when a script tries to run from an origin not on the allowlist.

## Policy Applies to a Wide Variety of Resources

CSP provides a set of policy directives that enable granular control over the resources a page is allowed to load, including `script-src` from the previous example.

The following list outlines the rest of the resource directives as of level 2. A level 3 specification has been drafted, but it's largely unimplemented in the major browsers.

### CSP Resource Directives

- **base-uri**: Restricts the URLs that can appear in a page's `<base>` element.
- **child-src**: Lists the URLs for workers and embedded frame contents. For example, `child-src https://youtube.com` enables embedding videos from YouTube but not from other origins.
- **connect-src**: Limits the origins that you can connect to using XHR, WebSockets, and EventSource.
- **font-src**: Specifies the origins that can serve web fonts. For example, you can allow Google's web fonts using `font-src https://themes.googleusercontent.com`.
- **form-action**: Lists valid endpoints for submission from `<form>` tags.
- **frame-ancestors**: Specifies the sources that can embed the current page. This directive applies to `<frame>`, `<iframe>`, `<embed>`, and `<applet>` tags. It can't be used in `<meta>` tags or for HTML resources.
- **frame-src**: This directive was deprecated in level 2, but is restored in level 3. If it's not present, the browser falls back to `child-src`.
- **img-src**: Defines the origins images can be loaded from.
- **media-src**: Restricts the origins allowed to deliver video and audio.
- **object-src**: Allows control over Flash and other plugins.
- **plugin-types**: Limits the kinds of plugins a page can invoke.
- **report-uri**: Specifies a URL the browser sends reports to when a content security policy is violated. This directive can't be used in `<meta>` tags.
- **style-src**: Limits the origins a page can use stylesheets from.
- **upgrade-insecure-requests**: Instructs user agents to rewrite URL schemes by changing HTTP to HTTPS. This directive is for websites with large numbers of old URLs that need to be rewritten.
- **worker-src**: A CSP Level 3 directive that restricts the URLs that can be loaded as a worker, shared worker, or service worker. As of July 2017, this directive has limited implementations.

By default, the browser loads the associated resource from any origin, with no restrictions, unless you set a policy with a specific directive. To override the default, specify a **default-src** directive. This directive defines the defaults for any unspecified directive that ends with `-src`. For example, if you set `default-src` to `https://example.com`, and you don't specify a `font-src` directive, then you can load fonts only from `https://example.com`.

The following directives don't use `default-src` as a fallback. Failing to set them is the same as allowing anything:

- **base-uri**
- **form-action**
- **frame-ancestors**
- **plugin-types**
- **report-uri**
- **sandbox**

Here's your content formatted in Markdown:

# Basic CSP Syntax

To use CSP directives, list them in the HTTP header with directives separated by colons. Make sure to list all required resources of a specific type in a single directive as follows:

```
script-src https://host1.com https://host2.com
```

The following is an example of multiple directives, in this case for a web app that loads all its resources from a content delivery network at `https://cdn.example.net`, and doesn't use framed content or plugins:

```
Content-Security-Policy: default-src https://cdn.example.net; child-src 'none'; object-src 'none'
```

## Implementation Details

Modern browsers support the unprefixed **Content-Security-Policy** header. This is the recommended header. The `X-WebKit-CSP` and `X-Content-Security-Policy` headers you might see in online tutorials are deprecated.

CSP is defined on a page-by-page basis. You'll need to send the HTTP header with every response that you want to protect. This lets you fine-tune the policy for specific pages based on their specific needs. For example, if one set of pages in your site has a +1 button, while others don't, you can allow the button code to load only when necessary.

The source list for each directive is flexible. You can specify sources by scheme (e.g., `data:`, `https:`) or ranging in specificity from hostname-only (`example.com`, which matches any origin on that host: any scheme, any port) to a fully qualified URI (`https://example.com:443`, which matches only HTTPS, only `example.com`, and only port 443). Wildcards are accepted, but only as a scheme, a port, or in the leftmost position of the hostname: `*://*.example.com:*` would match all subdomains of `example.com` (but not `example.com` itself), using any scheme, on any port.

The source list also accepts four keywords:

- `'none'` matches nothing.
- `'self'` matches the current origin, but not its subdomains.
- `'unsafe-inline'` allows inline JavaScript and CSS. For more information, see Avoid inline code.
- `'unsafe-eval'` allows text-to-JavaScript mechanisms like `eval`. For more information, see Avoid eval().

These keywords require single quotes. For example, `script-src 'self'` (with quotes) authorizes the execution of JavaScript from the current host; `script-src self` (no quotes) allows JavaScript from a server named "self" (and not from the current host), which probably isn't what you meant.

## Sandbox Your Pages

There's one more directive worth talking about: **sandbox**. It's a bit different from the others we've looked at, as it places restrictions on actions that the page can take rather than on resources that the page can load. If the sandbox directive is present, the page is treated as though it was loaded inside of an `<iframe>` with a sandbox attribute. This can have a wide range of effects on the page, such as forcing the page into a unique origin and preventing form submission, among others. You can find full details on valid sandboxing attributes in the "Sandboxing" section of the [HTML5 spec](https://html.spec.whatwg.org/multipage/embedded-content.html#the-iframe-element).

## The Meta Tag

CSP's preferred delivery mechanism is an HTTP header. It can be useful, however, to set a policy on a page directly in the markup. Do that using a `<meta>` tag with an `http-equiv` attribute:

```html
<meta
  http-equiv="Content-Security-Policy"
  content="default-src https://cdn.example.net; child-src 'none'; object-src 'none'"
/>
```

This can't be used for `frame-ancestors`, `report-uri`, or `sandbox`.

## Avoid Inline Code

As powerful as the origin-based allowlists used in CSP directives are, they can't solve the biggest threat posed by XSS attacks: **inline script injection**. If an attacker can inject a script tag that directly contains some malicious payload (such as `<script>sendMyDataToEvilDotCom()</script>`), the browser has no way to distinguish it from a legitimate inline script tag. CSP solves this problem by banning inline script entirely.

This ban includes not only scripts embedded directly in script tags, but also inline event handlers and `javascript:` URLs. You'll need to move the content of script tags into an external file, and replace `javascript:` URLs and `<a ... onclick="[JAVASCRIPT]">` with appropriate `addEventListener()` calls. For example, you might rewrite the following:

```html
<script>
  function doAmazingThings() {
    alert("YOU ARE AMAZING!");
  }
</script>
<button onclick="doAmazingThings();">Am I amazing?</button>
```

To something more like:

```html
<!-- amazing.html -->
<script src="amazing.js"></script>
<button id="amazing">Am I amazing?</button>
```

```javascript
// amazing.js
function doAmazingThings() {
  alert("YOU ARE AMAZING!");
}
document.addEventListener("DOMContentLoaded", function () {
  document.getElementById("amazing").addEventListener("click", doAmazingThings);
});
```

The rewritten code is not only compatible with CSP, but also aligned with web design best practices. Inline JavaScript mixes structure and behavior in ways that make code confusing. It's also more complicated to cache and compile. Moving your code into external resources makes your pages perform better.

Moving inline style tags and attributes into external stylesheets is also strongly recommended to protect your site against CSS-based data exfiltration attacks.

```

```

# How to Temporarily Allow Inline Scripts and Styles

**Warning:** Banning inline scripts and styles is CSP's most important security feature. Only use these methods if a script or style sheet absolutely must be inline.

You can enable inline scripts and styles by adding `'unsafe-inline'` as an allowed source in a `script-src` or `style-src` directive. CSP Level 2 also lets you add specific inline scripts to your allowlist using either a cryptographic nonce (number used once) or hash as follows.

## Using a Nonce

To use a nonce, give your script tag a `nonce` attribute. Its value must match one in the list of trusted sources. For example:

```html
<script nonce="EDNnf03nceIOfn39fn3e9h3sdfa">
  // Some inline code I can't remove yet, but need to as soon as possible.
</script>
```

Add the nonce to your `script-src` directive following the `nonce-` keyword:

```
Content-Security-Policy: script-src 'nonce-EDNnf03nceIOfn39fn3e9h3sdfa'
```

Nonces must be regenerated for every page request, and they must be unguessable.

## Using Hashes

Hashes work in a similar way. Instead of adding code to the script tag, create an SHA hash of the script itself and add it to the `script-src` directive. For example, if your page contained this:

```html
<script>
  alert("Hello, world.");
</script>
```

Your policy must contain this:

```
Content-Security-Policy: script-src 'sha256-qznLcsROx4GACP2dm0UCKCzCG-HiZ1guq6ZZDob_Tng='
```

The `sha*` prefix specifies the algorithm that generates the hash. The previous example uses `sha256-`, but CSP also supports `sha384-` and `sha512-`. When generating the hash, omit the `<script>` tags. Capitalization and whitespace matter, including leading and trailing whitespace.

Solutions for generating SHA hashes are available in many languages. Using Chrome 40 or later, you can open DevTools and then reload your page. The Console tab shows error messages with the correct SHA-256 hash for each of your inline scripts.

## Avoid `eval()`

Even when an attacker can't inject script directly, they might be able to trick your application into converting input text into executable JavaScript and executing it on their behalf. `eval()`, `new Function()`, `setTimeout([string], …)`, and `setInterval([string], ...)` are all vectors attackers can use to execute malicious code through injected text. CSP's default response to this risk is to completely block all of these vectors.

This has the following effects on the way you build applications:

- You must parse JSON using the built-in `JSON.parse`, instead of relying on `eval`. Safe JSON operations are available in every browser since IE8.
- You must rewrite any `setTimeout` or `setInterval` calls you make using inline functions instead of strings. For example, if your page contains the following:

  ```javascript
  setTimeout("document.querySelector('a').style.display = 'none';", 10);
  ```

  Rewrite it as:

  ```javascript
  setTimeout(function () {
    document.querySelector("a").style.display = "none";
  }, 10);
  ```

- Avoid inline templating at runtime. Many templating libraries use `new Function()` often to speed up template generation at runtime, which allows evaluation of malicious text. Some frameworks support CSP out of the box, falling back to a robust parser in the absence of `eval`. AngularJS's `ng-csp` directive is a good example of this. However, we recommend using a templating language that offers precompilation, such as Handlebars. Precompiling your templates can make the user experience even faster than the fastest runtime implementation, as well as making your site more secure.

If `eval()` or other text-to-JavaScript functions are essential to your application, you can enable them by adding `'unsafe-eval'` as an allowed source in a `script-src` directive. We strongly discourage this because of the code injection risk it presents.

## Report Policy Violations

To notify the server of bugs that might allow malicious injection, you can tell the browser to POST JSON-formatted violation reports to a location specified in a `report-uri` directive:

```
Content-Security-Policy: default-src 'self'; ...; report-uri /my_amazing_csp_report_parser;
```

These reports look like the following:

```json
{
  "csp-report": {
    "document-uri": "http://example.org/page.html",
    "referrer": "http://evil.example.com/",
    "blocked-uri": "http://evil.example.com/evil.js",
    "violated-directive": "script-src 'self' https://apis.google.com",
    "original-policy": "script-src 'self' https://apis.google.com; report-uri http://example.org/my_amazing_csp_report_parser"
  }
}
```

The report contains helpful information for finding the cause of a policy violation, including the page it happened on (`document-uri`), that page's referrer (`referrer`), the resource that violated the page's policy (`blocked-uri`), the specific directive it violated (`violated-directive`), and the page's complete policy (`original-policy`).

## Report-Only

If you're just starting out with CSP, we recommend using report-only mode to evaluate the state of your app before you change your policy. To do this, instead of sending a `Content-Security-Policy` header, send a `Content-Security-Policy-Report-Only` header:

```
Content-Security-Policy-Report-Only: default-src 'self'; ...; report-uri /my_amazing_csp_report_parser;
```

The policy specified in report-only mode doesn't block restricted resources, but it does send violation reports to the location you specify. You can even send both headers, to enforce one policy while monitoring another. This is a great way to test changes to your CSP while enforcing your current policy: turn on reporting for a new policy, monitor the violation reports and fix any bugs, and when you're satisfied with the new policy, start enforcing it.

## Real World Usage

The first step towards crafting a policy for your app is to evaluate the resources it loads. When you understand your app's structure, create a policy based on its requirements. The following sections walk through a few common use cases and the decision process for supporting them following the CSP guidelines.

### Social Media Widgets

Facebook's Like button has several implementation options. We recommend using the `<iframe>` version to keep it sandboxed from the rest of your site. It needs a `child-src https://facebook.com` directive to function properly.

X's Tweet button relies on access to a script. Move the script it provides into an external JavaScript file, and use the directive `script-src https://platform.twitter.com; child-src https://platform.twitter.com`.

Other platforms have similar requirements and can be addressed similarly. To test these resources, we recommend setting a `default-src` of `'none'` and watching your console to determine which resources you'll need to enable.

To use multiple widgets, combine the directives as follows:

```
script-src https://apis.google.com https://platform.twitter.com; child-src https://plusone.google.com https://facebook.com https://platform.twitter.com
```

### Lockdown

For some websites, you'll want to make sure that only local resources can be loaded. The following example develops a CSP for a banking site, starting with a default policy that blocks everything (`default-src 'none'`).

The site loads all images, style, and script from a CDN at `https://cdn.mybank.net`, and connects to `https://api.mybank.com/` using XHR to retrieve data. It uses frames, but only for pages local to the site (no third-party origins). There's no Flash on the site, no fonts, no extras. The most restrictive CSP header it can send is this:

```
Content-Security-Policy: default-src 'none'; script-src https://cdn.mybank.net; style-src https://cdn.mybank.net; img-src https://cdn.mybank.net; connect-src https://api.mybank.com; child-src 'self'
```

### SSL Only

The following is an example CSP for a forum administrator who wants to ensure that all resources on their forum are only loaded using secure channels but is inexperienced at coding and doesn't have the resources to rewrite third-party forum software full of inline scripts and styles:

```
Content-Security-Policy: default-src https:; script-src https: 'unsafe-inline'; style-src https: 'unsafe-inline'
```

Although `https:` is specified in `default-src`, the `script` and `style` directives don't automatically inherit that source. Each directive overwrites the default for that specific type of resource.

## CSP Standard Development

Content Security Policy Level 2 is a W3C recommended standard. W3C's Web Application Security Working Group is developing the specification's next iteration, Content Security Policy Level 3.
