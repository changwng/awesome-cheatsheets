
**https://awesomeopensource.com/project/typescript-cheatsheets/react**

[![AWESOME CHEATSHEETS LOGO](_design/cover_github@2x.png)](https://lecoupa.github.io/awesome-cheatsheets/)
https://lecoupa.github.io/awesome-cheatsheets/
[![Awesome](https://awesome.re/badge.svg)](https://awesome.re) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/LeCoupa/awesome-cheatsheets/blob/master/LICENSE)

두번째 branch 로감
**WEBSITE DIRECTORY**: [Available here](https://lecoupa.github.io/awesome-cheatsheets/).

> 📚 Awesome cheatsheets for popular programming languages, frameworks and development tools. They include everything you should know in one single file.

## 🤔 Why Awesome-Cheatsheets?

I usually make a cheat sheet when I want to improve my skills in a programming language, a framework or a development tool. [I started doing these kinds of things a long time ago on Gist](https://gist.github.com/LeCoupa). To better keep track of the history and to let people contribute, I reorganized all of them into this single repository. Most of the content is coming from official documentation and some books I have read.

Feel free to take a look. You might learn new things. They have been designed to provide a quick way to assess your knowledge and to save you time.

## 📚 Table of Contents

### 📃 Languages

<details>
<summary>View cheatsheets</summary>

#### Command line interface

- [Bash](languages/bash.sh)

#### Imperative

- [C](languages/C.txt)
- [C#](languages/C%23.txt)
- [PHP](languages/php.php)
- [JAVA](languages/java.md)
- [Python](languages/python.md)

#### Functional

- [JavaScript](languages/javascript.js)

</details>

### 📦 Backend

<details>
<summary>View cheatsheets</summary>

#### PHP

- [Laravel](backend/laravel.php)

#### Python

- [Django](backend/django.py)

#### Javascript

- [Adonis.js](backend/adonis.js)
- [Feathers.js](backend/feathers.js)
- [Moleculer](backend/moleculer.js)
- [Node.js](backend/node.js)
- [Sails.js](backend/sails.js)
  </details>

### 🌐 Frontend

<details>
<summary>View cheatsheets</summary>

#### Basics

- [HTML5](frontend/html5.html)

#### Frameworks

- [React.js](frontend/react.js)
- [Vue.js](frontend/vue.js)
- [Tailwind.css](frontend/tailwind.css)
- [Ember.js](frontend/ember.js)
- [Angular (2+)](frontend/angular.js)
- [AngularJS](frontend/angularjs.js)
  </details>

### 🗃️ Databases

<details>
<summary>View cheatsheets</summary>

#### SQL

- [MySQL](databases/mysql.sh)

#### NoSQL

- [Redis](databases/redis.sh)
  </details>

### 🔧 Tools

<details>
<summary>View cheatsheets</summary>

#### Development

- [cURL](tools/curl.sh)
- [Drush](tools/drush.sh)
- [Elasticsearch](tools/elasticsearch.js)
- [Emmet](tools/emmet.md)
- [Git](tools/git.sh)
- [Puppeteer](tools/puppeteer.js)
- [Sublime Text](tools/sublime_text.md)
- [VIM](tools/vim.txt)
- [Visual Studio Code](tools/vscode.md)
- [Xcode](tools/xcode.txt)

#### Infrastructure

- [AWS CLI](tools/aws.sh)
- [Docker](tools/docker.sh)
- [Heroku CLI](tools/heroku.sh)
- [Kubernetes](tools/kubernetes.md)
- [Nanobox Boxfile](tools/nanobox_boxfile.yml)
- [Nanobox CLI](tools/nanobox_cli.sh)
- [Nginx](tools/nginx.sh)
- [PM2](tools/pm2.sh)
- [Ubuntu](tools/ubuntu.sh)
  </details>

## 🙌🏼 How to Contribute?

You are more than welcome to contribute and build your own cheat sheet for your favorite programming language, framework or development tool. Just submit changes via pull request and I will review them before merging.

git hub 모니터링

### git branch --remote 
```code
PS C:\_vue\awesome-cheatsheets> git branch --remote       
  master/gh-pages
  master/master
  origin/HEAD -> origin/master
  origin/gh-pages
  origin/master
PS C:\_vue\awesome-cheatsheets> git checkout awesome_branch01
Already on 'awesome_branch01'
Your branch is up to date with 'master/awesome_branch01'.
PS C:\_vue\awesome-cheatsheets> git branch
* awesome_branch01
  master
  remote
PS C:\_vue\awesome-cheatsheets> git fetch origin
From https://github.com/changwng/awesome-cheatsheets
 * [new branch]      awesome_branch01 -> origin/awesome_branch01
PS C:\_vue\awesome-cheatsheets> git branch      
* awesome_branch01
  master
  remote
PS C:\_vue\awesome-cheatsheets> git branch --remote
  master/awesome_branch01
  master/gh-pages
  master/master
  master/nuxt
  origin/HEAD -> origin/master
  origin/awesome_branch01
  origin/gh-pages
  origin/master
  origin/nuxt
```