# GitHub Pages and Jekyll: A Detailed Guide

This guide covers all essential aspects of **GitHub Pages** and **Jekyll**, along with key links and official documentation.

## 1. GitHub Pages Overview

**GitHub Pages** is a static site hosting service that allows you to host personal, organization, or project websites directly from a GitHub repository.

### Types of GitHub Pages

- **User/Organization Pages**:  
  Hosted at `https://<username>.github.io/` or `https://<orgname>.github.io/`
- **Project Pages**:  
  Hosted at `https://<username>.github.io/<project-name>/`

### Setting Up GitHub Pages

1. Create a repository or use an existing one.
2. Go to the repository’s settings and scroll to the "GitHub Pages" section.
3. Select the branch (usually `gh-pages` for project pages).
4. The site will be published under `https://<username>.github.io/<repository-name>/`.

### Key Features

- Free hosting for static websites.
- Supports custom domains.
- Jekyll integration (optional).

**Official Documentation**:  
[GitHub Pages Documentation](https://docs.github.com/en/pages)

## 2. Jekyll Overview

**Jekyll** is a static site generator integrated with GitHub Pages. It converts plain text into websites, blogs, or other formats.

### Why Jekyll?

- No need for a backend or database.
- Easy Markdown support.
- Supports Liquid templating for dynamic content.
- Built-in support for blogs, archives, and paginated lists.

### Key Concepts

- **Posts**: Blog entries stored in the `_posts` directory (`YYYY-MM-DD-title.md`).
- **Pages**: Non-post content like `about.md` or `contact.md`.
- **Layouts**: HTML templates defining the site structure.
- **Includes**: Reusable chunks of code for headers, footers, etc.

### Setting Up Jekyll Locally

1. **Install Ruby and Bundler**:
   ```bash
   gem install bundler jekyll
   ```
2. **Create a New Jekyll Site**:
   ```bash
   jekyll new my-awesome-site
   cd my-awesome-site
   ```
3. **Serve the Site**:
   ```bash
   bundle exec jekyll serve
   ```
   The site will be hosted locally at `http://localhost:4000/`.

### Jekyll Themes

You can use custom themes or apply one of the many GitHub-provided themes. Add the theme to your `Gemfile` and reference it in `_config.yml`.

**Official Documentation**:  
[Jekyll Documentation](https://jekyllrb.com/docs/)

## 3. How Jekyll Integrates with GitHub Pages

GitHub Pages natively supports Jekyll. No additional setup is required to run Jekyll on GitHub Pages.

### Steps:

1. Push your Jekyll site to the repository you're using for GitHub Pages (`gh-pages` or `main` branch).
2. GitHub Pages will automatically build and deploy the Jekyll site.
3. Configure your Jekyll site with a `_config.yml` file for custom settings, layouts, and themes.

### Additional Configurations

- Add custom domains via the repository’s settings.
- Configure themes via `_config.yml`.

## 4. Jekyll Configuration Files

### \_config.yml

Stores configuration data for the site. Example:

```yaml
title: My Awesome Site
description: >-
  A blog about coding.
baseurl: "/blog"
url: "https://myusername.github.io"
theme: minima
```

### Gemfile

Defines dependencies (e.g., Jekyll and plugins).

## 5. Plugins and Extensions for Jekyll

Jekyll supports plugins for additional functionality such as SEO and sitemaps. Popular plugins include:

- **jekyll-sitemap**: Automatically generates a sitemap.
- **jekyll-seo-tag**: Adds SEO metadata to pages.

### Adding Plugins

1. Add the plugin to `Gemfile`:
   ```ruby
   gem 'jekyll-sitemap'
   ```
2. Configure `_config.yml`:
   ```yaml
   plugins:
     - jekyll-sitemap
   ```

## 6. Deploying Jekyll on GitHub Pages

Once your Jekyll site is set up, deploy it to GitHub Pages by pushing changes to the correct branch.

### Steps:

1. Push your repository to GitHub.
2. Go to the repository settings.
3. Under "GitHub Pages," select the branch (`main` or `gh-pages`).
4. Your site will be deployed at `https://<username>.github.io/<repository>`.

> **Note**: GitHub Pages runs Jekyll in **safe mode**, allowing only specific plugins. For unsupported plugins, build your site locally and push the HTML files to GitHub Pages.

## 7. Custom Domains for GitHub Pages

You can set up a custom domain for your GitHub Pages site:

1. Add a `CNAME` file to the repository root containing your domain name (e.g., `www.example.com`).
2. Configure your DNS provider to point to GitHub Pages IP addresses.

## 8. Additional Resources

- [GitHub Pages: Supported Jekyll Versions](https://pages.github.com/versions/)
- [Jekyll: Themes](https://jekyllrb.com/docs/themes/)
- [GitHub Pages Help](https://help.github.com/categories/github-pages-basics/)

## 9. Debugging GitHub Pages and Jekyll Issues

If your site isn’t updating or you encounter build issues, check the build logs on GitHub under the Actions tab. Locally, run:

```bash
bundle exec jekyll serve
```

to troubleshoot errors.
