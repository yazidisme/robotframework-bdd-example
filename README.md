# Web Test Automation using **Robot Framework**
---


## What's this?
This is automated web testing for any web application. Its using page object model as a pattern structure and BDD (Behavior Driven Development) framework as a testing approach with single gherkin language and data-driven style. Its using 4 folders and 1 file in the root directory.
* **pages folder**
    * This folder contain some files that initiate all of page elements, also their action as objects.
* **steps folder**
    * This folder contain some files that initiate any reusable steps.
    * Its steps should have direct relations to specific test files.
* **tests folder**
    * This folder contain some files that test cases executed.
    * Its can also contain some reusable steps for specific test cases that use data-driven or gherkin language on the same test files.
* **resources.robot file**
    * This is file for global setup or any reusable logic or steps that used all of steps or tests file.
* **result folder**
    * This folder for saving result file of report that generate after tests execute has finished.

---


## What's you need?
### Homebrew
1. Install _[Homebrew](https://brew.sh/)_ in _Terminal_ using the following command
  ```sh
  $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```
2. Follow the instructions until _Homebrew_ installing success

### Chromedriver
1. Install _[Chromedriver](https://chromedriver.chromium.org/)_ using _brew_ in _Terminal_ using the following command
  ```sh
  $ brew install chromedriver --cask
  ```
2. Follow the instructions until _chromedriver_ installing success

### Python
1. Install _[Python](https://www.python.org/)_ using _brew_ in _Terminal_ using the following command
  ```sh
  $ brew install python
  ```
2. Follow the instructions until _python_ installating success

### Setup Python Path
1. Create and open your .bash_profile or .zshrc from _Terminal_
  ```sh
  $ cd
  $ touch .bash_profile
  $ open -e .bash_profile
  ```
2. Set the _python_ PATH in .bash_profile file
  ```
  PATH="/usr/local/opt/python/libexec/bin:${PATH}"
  export PATH;
  ```
3. Save and exit your bash_profile

### Pip
1. Install _[Pip](https://pypi.org/project/pip/)_ using `easy_install` command
  ```sh
  $ sudo easy_install pip
  $ sudo pip install --upgrade pip
  ```
2. Follow the instructions until _pip_ installing success

### Robot Framework
1. Install _[Robot Framework](https://robotframework.org/)_ using _pip_ in _Terminal_ using the following command
  ```sh
  $ pip install robotframework
  ```
2. Follow the instructions until _robot framework_ installing success

### Selenium Library
1. Install _[Selenium Library in Robot Framework](https://github.com/robotframework/SeleniumLibrary)_ using _pip_ in _Terminal_ using the following command
  ```sh
  $ pip install robotframework-seleniumlibrary
  ```
2. Follow the instructions until _selenium library in robot framework_ installing success

---


## Go... run, run, run, burn, fire!
1. From your _Terminal_, go to the project directory
2. Run the test cases using the following command
  ```sh
  $ robot -d result/ tests/
  ```
4. Wait until [tests executing has finished](https://prnt.sc/lllrxi)
5. See the output of tests result in the result folder then open `log.html` or `report.html` using your browser
6. See the [log of tests result](http://prntscr.com/lllt0q)
7. See the [report of tests result](http://prntscr.com/llltea)

---


## What's next?
See general [guidelines](https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst) for good or standarization test cases from robot framework
