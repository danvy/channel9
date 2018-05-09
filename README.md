# Channel9 Content Downloader

## Introduction
If just like me, you love the content published on Channel9 and you have a very long way to get back home, you will appreciate to take that time to watch the awesome sessions content from http://channel9.msdn.com/events/ with you.

This PowerShell script will download to your Downloads folder of your user profile file://%userprofile%/downloads/ all the videos and slides of the event of your choice, using the format that fit your needs.
Once at home, please, give some feedback about the content on the Channel9 website, the authors will appreciate.

<<<<<<< HEAD
## What's new?
### 2.8
- Updated events and shows (Azure Red Shirt, Ignite 2017, Build 2017, Connect 2017)

### 2.7
- Updated events and shows (Azure Red Shirt, Ignite 2017, Build 2017, Connect 2017)

### 2.6
=======
##What's new?
###2.7
- Updated events and shows (Azure Red Shirt, Ignite 2017, Build 2017, Connect 2017)

###2.6
>>>>>>> 8fb14084f2392447d775f4757c3df4e3e3ea4598
- Updated events and shows (Ignite 2016, Data Exposed, TechNet Radio, The Defrag Show and Xamarin Show)

### 2.5
- Added destination folder on command line. Usage: Ch9Downloader.ps1 d:\downloads

### 2.4
- Updated events (Build 2016, Azure Friday, Game Dev Show, Microsoft Imagine, MS Dev Show, This week on Channel9, Visual Studio Toolbox)

### 2.3
- Updated events (DEVintersection 2015, TechDays Sweden 2015 and Windows 10 IT Pro Readiness under Various section)

### 2.2
- Updated events (Azure section with AzureCon 2015, Azure Camp Juillet 2015, Microsoft Azure Conference 2015 events and Visual Studio 2015 Final Release event)

### 2.1
- Updated events (Microsoft Edge Web Summit 2015, Devices and Networking Summit 2015)

### 2.0
- Added progress for downloads
- Resume downloads

![Screen shot](https://github.com/danvy/Channel9/blob/master/img/Ch9Downloader2.JPG)

### 1.5
- Updated events (Ignite 2015)

### 1.4
- Updated events (Build 2015)

### 1.3
- Updated events (Developer's Guide to Windows 10 Preview, under the "various" section)

### 1.2
- Updated events (WinHEC & TechEd)

### 1.1
- Added Visual Studio events to the list http://channel9.msdn.com/Events/Visual-Studio

### 1.0
- Initial release

## Requirements
This Powershell script requires :
- Powershell https://msdn.microsoft.com/en-us/powershell/mt173057.aspx
- the fantastic YouTube-DL https://rg3.github.io/youtube-dl/

## Q&A
#### Q: When I execute the script on my machine, I get a "File cannot be loaded because the execution of scripts is disabled on this system" error
A: You might have to change the execution policy of your machine. Type this under PowerShell "Set-ExecutionPolicy Unrestricted". See the documentation http://technet.microsoft.com/en-us/library/ee176961.aspx
#### Q: Is this project related to https://github.com/danvy/build14 ?
A: Yes, this project is a replacement, the new version, no longer dedicated to the Build 2014 event.

If you have any problem with the scripts, use GitHub or contact me on Twitter [@danvy](https://twitter.com/danvy)
