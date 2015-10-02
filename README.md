#Channel9 Content Downloader

##Introduction
If just like me, you love the content published on Channel9 and you have a very long way to get back home, you will appreciate to take that time to watch the awesome sessions content from http://channel9.msdn.com/events/ with you.

This PowerShell script will download to your Downloads folder of your user profile file://%userprofile%/downloads/ all the videos and slides of the event of your choice, using the format that fit your needs.
Once at home, please, give some feedback about the content on the Channel9 website, the authors will appreciate.

##What's new?
###2.2
- Updated events (Azure section with AzureCon 2015, Azure Camp Juillet 2015, Microsoft Azure Conference 2015 events and Visual Studio 2015 Final Release event)

###2.1
- Updated events (Microsoft Edge Web Summit 2015, Devices and Networking Summit 2015)

###2.0
- Added progress for downloads
- Resume downloads

![Screen shot](https://github.com/danvy/Channel9/blob/master/img/Ch9Downloader2.JPG)

###1.5
- Updated events (Ignite 2015)

###1.4
- Updated events (Build 2015)

###1.3
- Updated events (Developer's Guide to Windows 10 Preview, under the "various" section)

###1.2
- Updated events (WinHEC & TechEd)

###1.1
- Added Visual Studio events to the list http://channel9.msdn.com/Events/Visual-Studio

###1.0
- Initial release

##Q&A
#### Q: When I execute the script on my machine, I get a "File cannot be loaded because the execution of scripts is disabled on this system" error
A: You might have to change the execution policy of your machine. Type this under PowerShell "Set-ExecutionPolicy Unrestricted". See the documentation http://technet.microsoft.com/en-us/library/ee176961.aspx
#### Q: Is this project related to https://github.com/danvy/build14 ?
A: Yes, this project is a replacement, the new version, no longer dedicated to the Build 2014 event.

If you have any problem with the scripts, use GitHub or contact me on Twitter @danvy
