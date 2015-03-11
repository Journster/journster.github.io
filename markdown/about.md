## About

Journster is a cloud based content management system for static websites.

### Sign up

<span class="bg-warning">Journster is in private beta.</span>
Send us a <a href="https://twitter.com/journster">tweet</a> with a link to your site. If you fit our current product level, we'll get you on board for free.

### What does Journster do?

1. When a file has been edited in a selected repository, [GitHub](https://github.com/) sends Journster a webhook.
2. Journster clones the repository.
3. Install any [npm](https://www.npmjs.org/) packages.
4. Install any [Bower](http://bower.io/) packages.
5. Run the `default` [Grunt](http://gruntjs.com/) task.
6. Run the `default` [Gulp](http://gulpjs.com/) task.
7. If there were no errors, push all files from the `dist` folder to the repository's `gh-pages` branch.
8. The repository's [GitHub Pages](https://pages.github.com/) hosted website is now updated.

### Requirements

Currently the Grunt or Gulp script must output files for the `gh-pages` branch in the `/dist` folder and Journster runs only the `default` task.

### Journster go wayback

Journster version 1 was launched in 1998 as Webalogic ~ "Content management delivered online". At the time _cloud_ was called _hosted_ or _delivered online_. Journster v1 is template based, programming language independent and is still serving clients. This next version will only be for static websites.