# What is HTTPS? (https://www.cloudflare.com/en-gb/learning/ssl/what-is-https/)

## Link to refer

1.  https://howhttps.works/
2.  https://www.youtube.com/watch?v=hExRDVZHhig
3.  https://www.youtube.com/watch?v=GoXgl9r0Kjk

Hypertext Transfer Protocol Secure (HTTPS) is the secure version of HTTP, which is the primary protocol used to send data between a web browser and a website. HTTPS is encrypted to increase the security of data transfer, which is particularly important when transmitting sensitive data, such as logging into a bank account, email service, or health insurance provider.

Any website, especially those requiring login credentials, should use HTTPS. Modern web browsers like Chrome mark non-HTTPS websites differently from those that are secure. Look for a padlock in the URL bar to signify that the webpage is secure. Web browsers, including Google Chrome, flag all non-HTTPS websites as not secure.

## Google Chrome Security Example

### How does HTTPS work?

HTTPS uses an encryption protocol called Transport Layer Security (TLS), formerly known as Secure Sockets Layer (SSL). This protocol secures communications using an asymmetric public key infrastructure, which uses two different keys:

- **The private key**: Controlled by the website owner, kept private, and used to decrypt information encrypted by the public key.
- **The public key**: Available to anyone who wants to interact with the server securely. Information encrypted by the public key can only be decrypted by the private key.

### Why is HTTPS important? What happens if a website doesn’t have HTTPS?

HTTPS prevents websites from broadcasting information in a way that’s easily viewed by anyone snooping on the network. Regular HTTP sends information in packets that can be easily intercepted using free software, making communication over insecure mediums, like public Wi-Fi, highly vulnerable to interception. HTTP communications are in plain text, accessible to anyone with the right tools, and vulnerable to on-path attacks.

With HTTPS, traffic is encrypted so that even if intercepted, the data appears as nonsensical characters.

**Example:**

- **Before encryption**: This is a string of text that is completely readable.
- **After encryption**: ITM0IRyiEhVpa6VnKyExMiEgNveroyWBPlgGyfkflYjDaaFf/Kn3bo3OfghBPDWo6AfSHlNtL8N7ITEwIXc1gU5X73xMsJormzzXlwOyrCs+9XCPk63Y+z0=

Websites without HTTPS can also allow Internet Service Providers (ISPs) or other intermediaries to inject content, such as advertisements, into webpages without the website owner’s approval. HTTPS prevents unmoderated third parties from injecting content into web pages.

### What port does HTTPS use?

HTTPS uses port 443, which differentiates it from HTTP, which uses port 80.

_(In networking, a port is a virtual software-based point where network connections start and end. All network-connected computers expose a number of ports to enable them to receive traffic. Each port is associated with a specific process or service, and different protocols use different ports.)_

### How else is HTTPS different from HTTP?

Technically, HTTPS is not a separate protocol from HTTP but uses TLS/SSL encryption over the HTTP protocol. HTTPS involves the transmission of TLS/SSL certificates, verifying the provider’s identity.

When a user connects to a webpage, the site sends its SSL certificate, which contains the public key needed to start a secure session. The client and server then go through an SSL/TLS handshake—a series of communications used to establish a secure connection. To learn more, read about what happens in a TLS handshake.

### How does a website start using HTTPS?

Many website hosting providers offer TLS/SSL certificates for a fee. These certificates are often shared among customers, but more expensive certificates can be individually registered to specific web properties.

# Why HTTPS Matters

[Read more](https://web.dev/articles/why-https-matters)

Always protect all your websites with HTTPS, even if they don't handle sensitive communications. In addition to providing critical security and data integrity for both your websites and your users' personal information, HTTPS is required for many new browser features, especially those required for progressive web apps.

## HTTPS Protects Your Website's Integrity

HTTPS helps prevent intruders from tampering with communication between your sites and your users' browsers. Intruders include both intentionally malicious attackers and legitimate but intrusive companies, such as ISPs that inject ads into pages.

Intruders exploit unprotected communications to trick your users into giving up sensitive information or installing malware, or to insert their own resources. For example, some third parties inject ads that can break your user experience and create security vulnerabilities.

Intruders exploit every unprotected resource that travels between your websites and your users. Images, cookies, scripts, and HTML are all exploitable. Intrusions can occur at any point in the network, including a user's machine, a Wi-Fi hotspot, or a compromised ISP. HTTPS makes it harder for intruders to access your sites' resources.

## HTTPS Protects Your Users' Privacy and Security

HTTPS prevents intruders from passively listening to communications between your websites and your users.

One common misconception about HTTPS is that only websites handling sensitive communications need it. In fact, every unprotected HTTP request can potentially reveal information about your users' behaviors and identities.

A single visit to an unprotected website might seem benign, but some intruders analyze users' aggregate browsing activities to infer behaviors and intentions, and to de-anonymize identities. For example, employees might inadvertently disclose sensitive health conditions to their employers just by reading unprotected medical articles.

## HTTPS is the Future of the Web

Powerful new web platform features, such as taking pictures or recording audio with `getUserMedia()`, enabling offline app experiences with service workers, or building progressive web apps, require explicit permission from the user through HTTPS. Many older APIs are also being updated to require permission to execute, such as the Geolocation API. HTTPS is a key component of the permission workflows for both new and updated features.

Here's the content formatted in Markdown:

# Enable HTTPS on Your Servers (https://web.dev/articles/enable-https )

This provides guidance for setting up HTTPS on your servers, including the following steps:

1. Creating a 2048-bit RSA public/private key pair.
2. Generating a certificate signing request (CSR) that embeds your public key.
3. Sharing your CSR with your Certificate Authority (CA) to receive a final certificate or a certificate chain.
4. Installing your final certificate in a non-web-accessible place such as `/etc/ssl` (Linux and Unix) or wherever IIS requires it (Windows).

## Generate Keys and Certificate Signing Requests

This section uses the `openssl` command-line program, which comes with most Linux, BSD, and Mac OS X systems, to generate private and public keys and a CSR.

### Generate a Public/Private Key Pair

To start, generate a 2,048-bit RSA key pair. A shorter key can be broken by brute-force guessing attacks, and longer keys use unnecessary resources.

Use the following command to generate an RSA key pair:

```bash
openssl genrsa -out www.example.com.key 2048
```

This gives the following output:

```
Generating RSA private key, 2048 bit long modulus
.+++
.......................................................................................+++
e is 65537 (0x10001)
```

### Generate a Certificate Signing Request

In this step, you embed your public key and information about your organization and your website into a certificate signing request or CSR. The `openssl` command asks you for the required metadata.

Run the following command:

```bash
openssl req -new -sha256 -key www.example.com.key -out www.example.com.csr
```

This will prompt you for information:

```
You are about to be asked to enter information that will be incorporated
into your certificate request

What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:CA
State or Province Name (full name) [Some-State]:California
Locality Name (for example, city) []:Mountain View
Organization Name (for example, company) [Internet Widgits Pty Ltd]:Example, Inc.
Organizational Unit Name (for example, section) []:Webmaster Help Center Example Team
Common Name (e.g. server FQDN or YOUR name) []:www.example.com
Email Address []:webmaster@example.com

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
```

To ensure the validity of the CSR, run:

```bash
openssl req -text -in www.example.com.csr -noout
```

The response should look like this:

```
Certificate Request:
    Data:
        Version: 0 (0x0)
        Subject: C=CA, ST=California, L=Mountain View, O=Google, Inc.,
OU=Webmaster Help Center Example Team,
CN=www.example.com/emailAddress=webmaster@example.com
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:ad:fc:58:e0:da:f2:0b:73:51:93:29:a5:d3:9e:
                    f8:f1:14:13:64:cc:e0:bc:be:26:5d:04:e1:58:dc:
                    ...
                Exponent: 65537 (0x10001)
        Attributes:
            a0:00
    Signature Algorithm: sha256WithRSAEncryption
         5f:05:f3:71:d5:f7:b7:b6:dc:17:cc:88:03:b8:87:29:f6:87:
         2f:7f:00:49:08:0a:20:41:0b:70:03:04:7d:94:af:69:3d:f4:
         ...
```

## Submit Your CSR to a Certificate Authority

Different certificate authorities (CAs) require you to submit your CSRs in different ways. This can include using a form on their website or sending the CSR by email. Some CAs, or their resellers, might even automate some or all of the process, including key pair and CSR generation.

Send the CSR to your CA and follow their instructions to receive your final certificate or certificate chain. Different CAs charge different amounts for the service of vouching for your public key.

There are also options for mapping your key to more than one DNS name, including several distinct names (e.g., all of `example.com`, `www.example.com`, `example.net`, and `www.example.net`) or "wildcard" names such as `*.example.com`.

**Note:** In wildcard certificates, the wildcard applies to only one DNS label. A certificate valid for `*.example.com` works for `foo.example.com` and `bar.example.com`, but not for `foo.bar.example.com`.

Copy the certificates to all your front-end servers in a non-web-accessible place such as `/etc/ssl` (Linux and Unix) or wherever IIS (Windows) requires them.

## Enable HTTPS on Your Servers

Enabling HTTPS on your servers is a critical step in providing security for your web pages.

1. Use Mozilla's Server Configuration tool to set up your server for HTTPS support.
2. Regularly test your site with Qualys' SSL Server Test and ensure you get at least an A or A+.
3. At this point, you must make a crucial operations decision. Choose one of the following:
   - Dedicate a distinct IP address to each hostname your web server serves content from.
   - Use name-based virtual hosting.

If you've been using distinct IP addresses for each hostname, you can support both HTTP and HTTPS for all clients. However, most site operators use name-based virtual hosting to conserve IP addresses and because it's generally more convenient.

If you don't already have HTTPS service available on your servers, enable it now (without redirecting HTTP to HTTPS. See [Redirect HTTP to HTTPS](#redirect-http-to-https) for more information). Configure your web server to use the certificates you bought and installed. Mozilla's configuration generator might be useful.

If you have many hostnames or subdomains, they each need to use the right certificate.

**Warning:** If you've already completed these steps, but are using HTTPS only to redirect clients back to HTTP, stop doing that now. See the next section to ensure HTTPS and HTTP work smoothly.

**Note:** Ultimately you should redirect HTTP requests to HTTPS and use HTTP Strict Transport Security (HSTS). However, that needs to happen later in the migration process. For more information, see [Redirect HTTP To HTTPS](#redirect-http-to-https) and [Turn On Strict Transport Security And Secure Cookies](#turn-on-strict-transport-security-and-secure-cookies).

Now, and regularly throughout your site's lifetime, check your HTTPS configuration with Qualys' SSL Server Test. Your site should score an A or A+. Treat anything that causes a lower grade as a bug, and stay diligent, as new attacks against algorithms and protocols are always being developed.

## Make Intrasite URLs Relative

Now that you're serving your site on both HTTP and HTTPS, things need to work as smoothly as possible regardless of protocol. An important factor is using relative URLs for intrasite links.

Make sure intrasite URLs and external URLs don't depend on a specific protocol. Use relative paths or leave out the protocol as in `//example.com/something.js`.

Serving a page that contains HTTP resources using HTTPS can cause issues. When a browser encounters an otherwise secure page using insecure resources, it warns users that the page isn't completely secure, and some browsers refuse to load or execute the HTTP resources, which breaks the page. However, you can safely include HTTPS resources in an HTTP page. For more guidance on fixing these issues, see [Fixing Mixed Content](#fixing-mixed-content).

Following HTTP-based links to other pages on your site can also downgrade the user experience from HTTPS to HTTP. To fix this, make your intrasite URLs as relative as possible, by making them either protocol-relative (lacking a protocol, starting with `//example.com`) or host-relative (starting with just the path, like `/jquery.js`).

**Do**

```html
<h1>Welcome To Example.com</h1>
<script src="/jquery.js"></script>
<link rel="stylesheet" href="/assets/style.css" />
<img src="/images/logo.png" />
<p>A <a href="/2014/12/24">new post on cats!</a></p>
```

**Use relative intrasite URLs.**

**Do**

```html
<h1>Welcome To Example.com</h1>
<script src="//example.com/jquery.js"></script>
<link rel="stylesheet" href="//assets.example.com/style.css" />
<img src="//img.example.com/logo.png" />
<p>A <a href="//example.com/2014/12/24/">new post on cats!</a></p>
```

**Or, use protocol-relative intrasite URLs.**

**Do**

```html
<h1>Welcome To Example.com</h1>
<script src="/jquery.js"></script>
<link rel="stylesheet" href="/assets/style.css" />
<img src="/images/logo.png" />
<p>A <a href="/2014/12/24">new post on cats!</a></p>
<p>
  Check out this <a href="https://foo.com/"><b>other cool site.</b></a>
</p>
```

\*\*Use HTTPS

URLs for links to other sites where possible.\*\*

Update your links with a script, not by hand, to avoid making mistakes. If your site's content is in a database, test your script on a development copy of the database. If your site's content consists of only simple files, test your script on a development copy of the files. Push the changes to production only after the changes pass QA, as normal. You can use Bram van Damme's script or something similar to detect mixed content in your site.

When linking to other sites (as opposed to including resources from them), don't change the protocol. You don't have control over how those sites operate.

To make migration smoother for large sites, we recommend protocol-relative URLs. If you aren't sure whether you can fully deploy HTTPS yet, forcing your site to use HTTPS for all subresources can backfire. There is likely to be a period of time in which HTTPS is new and weird for you, and the HTTP site must still work as well as ever. Over time, you'll complete the migration and lock in HTTPS (see the next two sections).

If your site depends on scripts, images, or other resources served from a third party, such as a CDN or `jquery.com`, you have two options:

1. Use protocol-relative URLs for these resources. If the third party doesn't serve HTTPS, ask them to. Most already do, including `jquery.com`.
2. Serve the resources from a server that you control, which offers both HTTP and HTTPS. This is often a good idea anyway, because then you have better control over your site's appearance, performance, and security, and don't have to trust a third party to keep your site secure.

**Caution:** You'll also need to change intrasite URLs in your stylesheets, JavaScript, redirect rules, `<link>` tags, and CSP declarations, not just in your HTML pages.

## Redirect HTTP to HTTPS

To tell search engines to use HTTPS to access your site, put a canonical link at the head of each page using `<link rel="canonical" href="https://…"/>` tags.

## Turn On Strict Transport Security and Secure Cookies

At this point, you're ready to "lock in" the use of HTTPS:

1. Use HTTP Strict Transport Security (HSTS) to avoid the cost of the 301 redirect.
2. Always set the Secure flag on cookies.

First, use Strict Transport Security to tell clients they should always connect to your server using HTTPS, even when following an `http://` reference. This defeats attacks like SSL Stripping and avoids the round-trip cost of the 301 redirect that we enabled in [Redirect HTTP to HTTPS](#redirect-http-to-https).

**Note:** Clients that have listed your site as a known HSTS Host are likely to hard-fail if your site ever has an error in its TLS configuration (such as an expired certificate). HSTS is explicitly designed this way to ensure that network attackers can't trick clients into accessing the site without HTTPS. Don't enable HSTS until you're certain your site operation is robust enough to avoid ever deploying HTTPS with certificate validation errors.

To turn on HSTS, set the Strict-Transport-Security header. OWASP's [HSTS page](https://owasp.org/www-community/HttpOnly) has links to instructions for various kinds of server software. Most web servers offer a similar ability to add custom headers.

**Note:** `max-age` is measured in seconds. You can start with low values and gradually increase the max-age as you become more comfortable operating an HTTPS-only site.

It's also important to make sure clients never send cookies (such as for authentication or site preferences) over HTTP. For example, if a user's authentication cookie were to be exposed in plain text, your security guarantee for their entire session is destroyed, even if you've done everything else right!

To avoid this, change your web app to always set the Secure flag on cookies it sets. This OWASP page explains how to set the Secure flag in several app frameworks. Every app framework has a way to set the flag.

Most web servers offer a simple redirect feature. Use 301 (Moved Permanently) to indicate to search engines and browsers that the HTTPS version is canonical, and redirect your users to the HTTPS version of your site from HTTP.

## Search Ranking

Google uses HTTPS as a positive search quality indicator. Google also publishes a guide to how to transfer, move, or migrate your site while maintaining its search rank. Bing also publishes guidelines for webmasters.

## Performance

When the content and application layers are well-tuned (refer to Steve Souders' books for advice), the remaining TLS performance concerns are generally small relative to the overall cost of the application. You can also reduce and amortize those costs. For advice on TLS optimization, see [High Performance Browser Networking](https://www.oreilly.com/library/view/high-performance-browser/9781449344760/) by Ilya Grigorik, as well as [Ivan Ristic's OpenSSL Cookbook](https://www.feistyduck.com/book/open-source-ssl-tls-and-tls/) and [Bulletproof SSL and TLS](https://www.feistyduck.com/book/bulletproof-ssl-and-tls/).

In some cases, TLS can improve performance, mostly as a result of making HTTP/2 possible. For more information, refer to Chris Palmer's talk on HTTPS and HTTP/2 performance at Chrome Dev Summit 2014.

## Referer Headers

When users follow links from your HTTPS site to other HTTP sites, user agents don't send the Referer header. If this is a problem, there are several ways to solve it:

- The other sites should migrate to HTTPS. If referee sites complete the [Enable HTTPS on Your Servers](#enable-https-on-your-servers) section of this guide, you can change links in your site to theirs from `http://` to `https://` or use protocol-relative links.
- To work around a variety of problems with Referer headers, use the new Referrer Policy standard.

**Caution:** According to the HTTP RFC, clients MUST NOT include a Referer header field in a (non-secure) HTTP request if the referring page is transferred using a secure protocol.

## Ad Revenue

Site operators that monetize their site by showing ads want to make sure migrating to HTTPS doesn't reduce ad impressions. However, because of mixed content security concerns, an HTTP `<iframe>` doesn't work on an HTTPS page. Until advertisers publish over HTTPS, site operators can't migrate to HTTPS without losing ad revenue; but until site operators migrate to HTTPS, advertisers have little motivation to publish HTTPS.

You can start the process of breaking this stalemate by using advertisers that offer ad services over HTTPS and asking advertisers that don't serve HTTPS at all to at least make it an option. You might need to defer completing [Make IntraSite URLs Relative](#make-intrasite-urls-relative) until enough advertisers interoperate properly.
