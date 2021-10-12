# Introduction to Automation and Scripting

This repository contains some examples of bash scripts that will be used as an introduction to scripting. They're pretty simple but good for us to start learning how to use them.

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

Summing up, it's possible to change all the permissions at once or to grant access for a specific role. However, what if we want to **add** specific permission only to the user role without checking the permissions that the other roles already exist? We can specify which role we want to change and add to it `+` and the permission you want to give (`r` for reading, `w` for writing, and `x` for executing). Therefore, in the example mentioned before, we would have the following command:

```bash
chmod u+x hello-world.sh
```

To know more about this command, I highly recommend you to have a look at its manual. You can do that by running `man chmod` in your terminal.

## Running your script

Now that we know how to set up the necessary permissions to run our scripts, we can finally start to run some simple ones to understand how to do that!

### Hello World

The first bash script that we implement to get to know more about it. It prints "Hello World" in your terminal.

```
#!/bin/bash

echo "Hello World"
```

### Wishlist bot with Telegram

### Watching files inside a folder

## Shell initialization files

They're shell scripts that run automatically each time the user logs in. They usually set up the work environment and customizes the shell environment for the user.

The most common file is the `.bashrc`, or `.zshrc` for Zsh users. It's usually the place where we define aliases, functions, and environment variables that are useful in a daily basis. For instance, I have a lot of aliases for git and kubectl commands. A well-known practice is to create a repository in GitHub that we usually call dotfiles that contain those files, so we can have it somewhere else to avoid losing our setup in case of problems with our computer.

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

# Nice references

https://github.com/awesome-lists/awesome-bash

https://crontab.guru/every-minute

https://devhints.io/bash

https://tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html
