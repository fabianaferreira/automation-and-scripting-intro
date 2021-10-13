# Introduction to Automation and Scripting

This repository contains some examples of bash scripts that will be used as an introduction to scripting. They're pretty simple but good for us to start learning how to use them.

## What's a shell script, and where do they live?

A shell script contains shell commands with just a few words whose main objective is to automate tasks. It has a complete programming language with loops, variables, conditional statements, functions, etc.

They're powerful but not the best choice for some tasks. For instance, shell scripts are suitable for:

- Work with text;
- Manage processes;
- File system operations;
- System administration.

But they are not so good for:

- Complex calculations;
- Complex data structures;
- Graphical user interface

In the next sections, you'll learn more about setting the correct permissions and running the scripts. Furthermore, we'll go through some examples to present to you the syntax and language specificities. Shall we?

There are different shells, and each one of them has its advantages and disadvantages. In this repository, we're focusing on bash scripts, but I use [zsh](https://www.zsh.org/) as my current shell for its nice extras and for [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh), the open-source framework to manage the `zsh` configurations.

## Setting up the permissions for scripts

Every script, by default, will not have the necessary permissions so we can execute them; this is a security matter since scripts can be powerful and harm your system. So, how do we grant access to it so we can run?

There is a command in Linux called `chmode`, which stands for _change mode_. We use it to change the permissions (read, write and execute) for a specific file. You can run the `ls` command with the flag `-l` to check the current permissions. For example:

![image](https://user-images.githubusercontent.com/19495917/136972765-c72a770e-1cfa-4a5b-9afb-ec62c9e613fc.png)

The first three are related to the owner permissions (u), then the next three refer to group permissions (g), and the last ones are the "everyone" permissions (o).

How can we change it? The order is "read, write and execute", so if we want to give full access, we should have "111", and this in base 10 is 7. Another example is that if we're going to give permission only for reading and to execute, it should be "101", which is 5 in base 10. For the file in the screenshot, imagine you want to give execute permission for every role, then we should run the following command:

```bash
chmod 755 hello-world.sh
```

Can you understand the reason behind each number in the command? Take some time to think about it!

Summing up, it's possible to change all the permissions at once or to grant access for a specific role. However, what if we want to **add** explicit permission only to the user role without checking the permissions that the other roles already exist? We can specify which role we want to change and add to it `+` and the permission you want to give (`r` for reading, `w` for writing, and `x` for executing). Therefore, in the example mentioned before, we would have the following command:

```bash
chmod u+x hello-world.sh
```

To know more about this command, I highly recommend you to have a look at its manual. You can do that by running `man chmod` in your terminal.

## Running your script

Now that we know how to set up the necessary permissions to run our scripts, we can finally start to run some simple ones to understand how to do that!

### Hello World

The first bash script that we implement to get to know more about it. It prints "Hello World" in your terminal.

```bash
#!/bin/bash

echo "Hello World"
```

This example is inside the examples folder from this repository, fell free to use it to start learning. To run it, you can simply use the following command:

```bash
./hello-world.sh
```

> Do not forget that you need to have granted access to the owner to execute the script!

### Telegram bot

This bot makes a cURL request to a specific bot that I've created to send a message to the chat that it has with me. For now, the code for this script wasn't pushed due to some tokens that I did not hide with secrets (TODO).

### Fetching and pulling changes for git repositories

This script goes to every subfolder inside the directory provided by a user argument while running the script. It fetches and pulls the changes on each one of them. It does not deal with conflicts and merges.

## Debugging shell scripts

Whenever you need to debug a shell script, you can use flags in the shebang line (the first line of the script, where you define the shell that will interpret it).

For instance, the `-v` flag stands for verbose, and it will give you as output each one of the commands that are running. However, this might not be that useful since you do not have the values of each line, and that's when the `-x` flag comes to the field of play. It will give you both the commands and the values.

Example:
Let's say that we're running a "Hello World", but it gets an argument from the user. The script looks like this:

```bash
#!/bin/bash

echo "Hello World, $1"
```

If I add the `-v` flag to the first line, the output will be the following:

```
#!/bin/bash -v

echo "Hello World, $1"
```

But if I run it with the `-x` flag, it will have the output mentioned below, which can be helpful if you are unsure of the variables.

```
+ echo 'Hello World, Fabiana'
```

## Shell initialization files

They're shell scripts that run automatically each time the user logs in. They usually set up the work environment and customizes the shell environment for the user.

The most common file is the `.bashrc`, or `.zshrc` for Zsh users. It's usually the place where we define aliases, functions, and environment variables that are useful daily. For instance, I have a lot of aliases for git and kubectl commands. A well-known practice is to create a repository in GitHub that we usually call dotfiles that contain those files, so we can have it somewhere else to avoid losing our setup in case of problems with our computer.

## Cron jobs

In just a few words, a cron job is a Linux command used for scheduling tasks to be executed sometime in the future. It's usually used to schedule jobs that are executed periodically.

Most cron jobs have three components:

- The script to be called or executed;
- The command that executes the script on a reoccurring basis;
- The action or output of the script, which depends on what the script being called, does. Frequently, scripts called cron jobs modify files or databases.

### Running a cron job by using Crontab

First, we need to create a bash script that will run as a crontab job. To do so, we need to create a `.sh` file that will contain the script that we will run.

After creating the file, we need to make our bash script executable, which means changing its permissions so crontab can run it. To do so, we'll run the following command:

```bash
chmod +x hello-world.sh
```

### Important notes

It's possible that you face some problems while running the script. For instance, if you use a shell other than `sh`, you'll probably have to explicitly tell crontab the absolute path to the shell that you use. To do that, you need to add a line before the cron expression. Example:

```
SHELL=/bin/zsh
PATH=/usr/local/bin:/usr/bin
* * * * * cd ~/Documents/automation-and-scripting-intro/scripting/examples && ./prs_repos.sh vtex cloud-services
```

In my case, I faced two problems:

- My script wasn't finding the jq package that is installed in `zsh` (it was looking for it in `sh`);
- The `zsh` installation folder wasn't in the PATH variable.

Besides that, I had to grant some access to `cron` in the settings for the MacOS.

# Nice references

https://github.com/awesome-lists/awesome-bash

https://crontab.guru/every-minute

https://devhints.io/bash

https://tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html

# Special thanks

Thank you, @saviomuniz, for encouraging me to go deep in this subject to share this knowledge, and for all the good aliases and tips that you've given to me while working with you :rocket:.
