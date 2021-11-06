
## Automating webdriver download for latest version of Chrome for Mac64

Selenium is an excellent, open-source automated webrowser that is also incredibly useful for scraping dynamic webpages. In order to use selenium, however, a webdriver must first be installed, and that driver needs to be reinstalled with every updated version of the webrowser. Given relatively frequent updates, that reinstallation process can become a repititive task. This short script automates that task for Chrome on Mac64.

Chrome webdrivers available for download are located at this [link](https://chromedriver.chromium.org/downloads). After selecting the desired version, users are brought to another page with a base URL and parameter that matches the targeted version. Example: to download Chrome version 95, the URL will be: https://chromedriver.storage.googleapis.com/index.html?path=95.0.4638.54/

The bash script must be fed a single positional parameter; this is the targeted version for Chrome. The script combines the second URL with the targeted version, then curl downloads a zip file. That file is then inflated and the contents moved into the machine's path (the original zip is then deleted).

Because newer Mac OS versions prohibit the execution of applications from unknown developers, we have to add a work-around by using the xattr -d command to strip the files name. 

In the end, this basic bash script, when fed a given version of Chrome, will replace the webdriver in the machine's path.
