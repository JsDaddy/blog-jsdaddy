---
title: CI/CD with GiHub Actions
tags:
  - CI/CD
  - DEVELOPMENT PROCESS
---
![](/blog/css/images/git.png)

GitHub Actions now makes it easier to automate how you build, test, and deploy your projects on any platform, including Linux, macOS, and Windows. Run your workflows in a container or in a virtual machine. Actions also supports more languages and frameworks than ever, including Node.js, Python, Java, PHP, Ruby, C/C++, .NET, Android, and iOS. You can test your web service and its database together by simply adding some docker-compose to your workflow file.

## Setting up continuous integration using GitHub Actions
You can set up continuous integration for your project using a workflow template that matches the language and tooling you want to use.

Anyone with write permission to a repository can set up continuous integration (CI) using GitHub Actions.

1\. On GitHub, navigate to the main page of the repository.
2\. Under your repository name, click Actions.
![action button location](/blog/css/images/action_button_location.png)
3\. Find the template that matches the language and tooling you want to use, then click Set up this workflow.
![setup workflow button location](/blog/css/images/setup-workflow-button.png)
4\. Click Start commit.
![start commit button location](/blog/css/images/start_commit_button_location.png)
5\. Type a short, meaningful commit message that describes the change you made to the file. Below the commit message fields, decide whether to add your commit to the current branch or to a new branch and then create a pull request.

After you set up CI, you can customize the workflow to meet your needs.

## Customizing a workflow
You can create more than one workflow in a repository. You must store workflows in the `.github/workflows` directory in the root of your repository. 

Workflows must have at least one job, and jobs contain a set of steps that perform individual tasks. Steps can run commands or use an action. You can create your own actions or use actions shared by the GitHub community and customize them as needed.

You can configure a workflow to start when a GitHub event occurs, on a schedule, or from an external event.

You need to configure workflows using YAML syntax, and save them as workflow files in your repository. Once you've successfully created a YAML workflow file and triggered the workflow, you will see the build logs, tests results, artifacts, and statuses for each step of your workflow.
![annotated workflow](/blog/css/images/annotated-workflow.png)

## Creating a new workflow file
1\. At the root of your repository, create a directory named .github/workflows to store your workflow files.
2\. In `.github/workflows`, add a `.yml` or `.yaml` file for your workflow. For example, .github/workflows/continuous-integration-workflow.yml.
3\. Choose events to trigger an action, add actions, and customize your workflow.
4\. Commit your changes in the workflow file to the branch where you want your workflow to run.

Example of workflow file
```yml
name: Node CI

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: [8.x, 10.x, 12.x]

    steps:
    - uses: actions/checkout@v1
    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v1
      with:
        node-version: ${{ matrix.node-version }}
    - name: npm install, build, and test
      run: |
        npm install
        npm run build --if-present
        npm test
      env:
        CI: true
```
## Events that trigger workflows
Example using one event
```yml
on: push
```
Example using more than one event
```yml
on: [push, pull_request]
```
**See [full list](https://help.github.com/en/articles/events-that-trigger-workflows#webhook-events) of events with examples.**
**For some event types you may need to [create an access token](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line).**

To test across multiple operating systems, platforms, and language versions at the same time, you can configure a build matrix.
```yml
runs-on: ${{ matrix.os }}
strategy:
  matrix:
    os: [ubuntu-14.04, ubuntu-18.04]
    node: [6, 8, 10]
```

## Referencing actions in your workflow

Workflows can use actions defined in:

\- A public repository
\- The same repository where your workflow file references the actions
\- A published Docker container image on Docker Hub

If an action is defined in the same repository where your workflow file uses the action, you can reference the action with either the ‌`{owner}/{repo}@{ref}` or `./path/to/dir` syntax in your workflow file.

If an action is defined in a published Docker container image on Docker Hub, you must reference the action with the `docker://{image}:{tag}` syntax in your workflow file. To protect your code and data, we strongly recommend you verify the integrity of the Docker container image from Docker Hub before using it in your workflow.

## Filtering for specific branches, tags, and paths
You can set up your workflow to run only on certain branches. For example, this workflow runs when a push that includes files in the test directory is made on the master branch, or pushes to the v1 tag.

```yml on:
  push:
    branches:
      - master
    tags:
      - v1
    # file paths to consider in the event. Optional; defaults to all.
    paths:
      - 'test/*'
```

Also you can [follow the status and detailed logs](https://help.github.com/en/articles/managing-a-workflow-run) of your continuous integration workflow run on GitHub and [receive customized notifications](https://help.github.com/en/articles/choosing-the-delivery-method-for-your-notifications#choosing-the-delivery-method-for-your-notifications-about-github-actions).

## Live logs show you real-time feedback
Live logs provide rich feedback into the progress of your builds as they run. GitHub streams your logs to the Actions console to show your status in real time. 

And you can deep-link to any line in any log file with a clean and simple permalink, making it easy for you to discuss a build failure or test result with a friend.
![CI logs](/blog/css/images/ci_logs.png)

**You can see more [information](https://github.com/features/actions) with examples.**