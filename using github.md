# Using Github in LPO-8800

## What is Github?

GitHub is a code hosting platform for version control and collaboration. It also works well for simple file sharing, which is how I use it in this class.

## How should I use Github in this class?

I have created a Github *repository* for LPO-8800 at https://github.com/spcorcor18/LPO-8800. A repository is a home where project files are stored. In this class, this includes folders for assignments, lectures, datasets, etc. The main repository--and each folder--includes a README file with relevant information. Github users can invite collaborators to repositories who can then be assigned read/write/edit privileges. The LPO-8800 repository is publicly available, visible to anyone, and thus not editable by anyone but me. 

I recommend you create a (free) Github account [here](https://github.com). Once you have done so, you can favorite ("star") repositories you would like to follow. You can search for LPO-8800 or spcorcor18/LPO-8800 and add this to your favorites.

I also recommend you "clone" (sync) the LPO-8800 repository to your local drive using Github Desktop (https://desktop.github.com). Once you have downloaded the Github Desktop client, you can select "Clone a repository" and then under "URL" type the Github username and repository (spcorcor18/LPO-8800). Choose a local path where you wish to clone the files.

A cloned repository will not sync automatically with the latest changes. You will need to open Github Desktop and click on "Fetch Origin" (while in the LPO-8800 repository) to check for updates. If updates have been made in the repository, you will see a "Pull Origin" button that will allow you to update the cloned repository on your local drive. You should keep your own files separate from the cloned repository, as Github may delete them during this update process.

## Can I read class datasets directly from Github into Stata?

Yes. Commands of the following type work:

    use https://github.com/spcorcor18/LPO-8800/raw/main/data/nels.dta, clear
    use https://github.com/spcorcor18/LPO-8800/raw/main/data/TNDOE%20schools%202018-19.dta

Note the repository name is in the URL (spcorcor18/LPO-8800), followed by raw/main. "Data" refers to the data subfolder in the LPO-8800 repository. The Stata dta file name comes at the end. If the filename includes spaces, you must us "%20" in place of them for the command to work correctly, as in the second example above.

## How can I learn more?

Github has many features that go well beyond its application in this class. You can learn how to create and use your own repositories here: https://docs.github.com/en/get-started/quickstart/hello-world