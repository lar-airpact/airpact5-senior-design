# Using Git: A Tutorial

GitHub is a version control system (VCS) which allows contributors to update existing code, approve code changes, and revert back to previous versions.  There are numerous benefits to using Git.

## Links to Sections
- [Setting Up Git](#setting-up-git)
- [Cloning a Repo](#cloning-a-repo)
- [Viewing Branches](#viewing-branches)
- [Check Out Existing Branches](#checking-out-existing-branches)
- [Making Changes](#making-changes)
- [Creating a New Branch](#creating-a-new-branch)
- [Adding a File](#adding-a-file)
- [Commiting the Change](#commiting-the-change)
- [Pushing the Change](#pushing-the-change)
- [Starting a Pull Request](#starting-a-pull-request)
- [Approving a Pull Request](#approving-a-pull-request)
- [Merge Conflicts](#the-dreaded-merge-conflicts)


## Basic Commands
- `git pull`
- `git add`
- `git status`
- `git push`
- `git checkout -b NewBranch`
- `git push -u origin NewBranch`
- `git merge`
- `git commit`

## Setting Up Git
- If on Windows, download Git Bash [here](https://gitforwindows.org/)
- If on MacOS, using HomeBrew as your package manager is very helpful.  For information on setting up HomeBrew, go to [here](https://brew.sh/).
    - From here, run `brew install git` to install Git.  In addition, you will want a text editor such as Vim, `brew install vim`

Let's have an example.  We have Bob, Joe, and Alice and they are working on project titled airpact5-senior-design.  Each person would want to **clone** this repository to their local machine.  This is achieved by:

## Cloning a Repo
- Off of the repo website, click the *Clone or download link* and copy the URL. 
- In the terminal: `git clone https://github.com/lar-airpact/airpact5-senior-design.git`

## Viewing Branches
Now each person will see the directory and if they do `git branch -a` it will list of the branches and the default branch they are on (in this example, the default branch is ***staging***)

## Checkout Out Existing Branches
- Update Branches: `git fetch`

Let's assume 3 branches are shown when running `git branch -a` and they are ABranch, BBranch, and CBranch
- Switch Branch to CBranch from Staging: `git checkout CBranch`


## Making Changes
**Important:** Never push changes directly to master or the default branch, all changes to these should be done through a **Pull Request**

### Creating a New Branch
Let's assume Joe wants to make a change to staging.  He would do the following to make a new branch called JoeChange (it's helpful to have useful branch names):
- Checkout a ***new*** branch: `git checkout -b JoeChange`
- Edit the code or whatever change he wants to edit.  Let's say he creates a csh script call Joe.csh

### Adding a file
Now that he is is done, hhe should run: `git status` which will show which files ***changed*** and then run `git add 'Joe.csh`
    - Another way of doing this is to do `git add .` which adds ***ALL*** files that have been changed

### Commiting the change
'Joe will want to write a helpful commit message so that Bob and Alice can read the commit message and know what files have been changed and what the changes do
- Commit: `git commit -m "I added the following file which does XYZ with the system"`

### Pushing the change
Now that Joe has commited, he is good to **push** it to his new branch
- Pushing **new** branch: `git push -u origin Joe Change`

If he has changes after that branch is setup remotely, then do:
- Pushing changes to **existing** remote branch: `git push`


### Starting a Pull Request
Joe can now request a review of his change. On the airpact5-senior-design Git repository website, he will do the following:
- click the button *New pull request*.  
- A new page will open which says *Compare changes* and has two names: *base* and *compare*
    - *base* is the branch Joe is wanting to **merge** his code into, in this example Staging
    - *compare* is JoeChange, the branch he pushed to
- Click *Create pull request* and then he can request a review from the other contributors Alice and Bob

### Approving a Pull Request
If Joe requested reviews from both Alice and Bob, they will both be notified.  Either can **review** and **approve** this. As the CI/CD testing is already setup, results will be displayed stating if it passed or not.  It is **important** to wait to ensure all test cases pass.  
- View files changed
- Approve or comment on PR
- Once approved, merge into the branch
- It is often helpful to delete Joe's branch after so that no other changes are made on that branch

## The Dreaded Merge Conflicts
These happen when 2 developers are working on the same file.  In this example, Joe used proper Git flow by doing his work in an isolated branch.  

Now let's say both Alice and Bob are working on file do_run.csh. There are a few scenarios that can arise:

1. Both working in Staging
    - Bad Git flow here.  
    - Alice **pushes** first.  Now when Bob **pushes**, he will get an abort due to a merge conflict
2. Both working on do_run.csh in their own branches
    - Good Git flow here, but sometimes things happen.  More communication is needed from the two of them so that they know which files are being worked on
    - Alice does a PR first and it's approved
    - Bob does a PR second, and his shows merge conflicts
3. Alice deletes do_run.csh, and Bob edits do_run.csh
    - Alice pushes the delete flag, Bob pushes his edits
    - OH NO! Which does Git do?

### How to resolve merge conflicts
Often times Git will allow you to edit files on their website.  You can view the information [here](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/resolving-a-merge-conflict-on-github)
- In essense, you tell Git which one to listen to.  There will be two flags.  
    - *current change*
    - *incoming change*
- Delete the segment of code you don't want, and then **commit** that
