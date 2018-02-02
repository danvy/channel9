param
(
    [string]$baseFolder = ""
);
<#
.SYNOPSIS
    Return supported media formats by default
.DESCRIPTION
.NOTES  
.LINK  
.EXAMPLE  
#>
function New-Ch9FormatStandard()
{
    $formats = @()
    $formats += New-Ch9Format "PowerPoint slides" "slides" ".pptx"
    $formats += New-Ch9Format "MP4 High" "mp4high" ".mp4"
    $formats += New-Ch9Format "MP4 Low" "mp4" ".mp4"
    $formats += New-Ch9Format "WMV High" "wmvhigh" ".wmv"
    $formats += New-Ch9Format "WMV Low" "wmv" ".wmv"
    $formats += New-Ch9Format "MP3" "mp3" ".mp3"
    return $formats
}
<#
.SYNOPSIS
.DESCRIPTION
.NOTES  
.LINK  
.EXAMPLE  
#>
function New-Ch9Format()
{
  param ([string]$Name, [string]$Url, [string]$Extension)
  $format = new-object PSObject
  $format | add-member -type NoteProperty -Name Name -Value $Name
  $format | add-member -type NoteProperty -Name Url -Value $Url
  $format | add-member -type NoteProperty -Name Extension -Value $Extension
  return $format
}
<#
.SYNOPSIS
.DESCRIPTION
.NOTES  
.LINK  
.EXAMPLE  
#>
function New-Ch9EventEdition([string]$Name, [string]$Folder, [string]$Url)
{
  $eventEdition = new-object PSObject
  $eventEdition | add-member -type NoteProperty -Name Name -Value $Name
  $eventEdition | add-member -type NoteProperty -Name Folder -Value $Folder
  $eventEdition | add-member -type NoteProperty -Name Url -Value $Url
  $formats = New-Ch9FormatStandard
  $eventEdition | add-member -type NoteProperty -Name Formats -Value $formats
  return $eventEdition
}
<#
.SYNOPSIS
.DESCRIPTION
.NOTES  
.LINK  
.EXAMPLE  
#>
function New-Ch9Event([string]$Name)
{
  $event = new-object PSObject
  $event | add-member -type NoteProperty -Name Name -Value $Name
  $event | add-member -type NoteProperty -Name Editions -Value @()
  return $event
}
<#
.SYNOPSIS
.DESCRIPTION
.NOTES  
.LINK  
.EXAMPLE  
#>
function New-Ch9Events()
{
    $events = @()

    $event = New-Ch9Event "Azure"
    $edition = New-Ch9EventEdition "Azure Red Shirt Dev Tour NYC 2017" "RedShirtNYC2017" "https://channel9.msdn.com/Events/Microsoft-Azure/Azure-Red-Shirt-Dev-Tour-NYC-2017/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "AzureCon 2015" "AzureCon2015" "https://channel9.msdn.com/Events/Microsoft-Azure/AzureCon-2015/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Azure Camp du 7 juillet 2015" "AzureCampJuillet2015" "https://channel9.msdn.com/Events/Microsoft-Azure/Azure-Camp-du-7-juillet/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Microsoft Azure Conference 2015" "AzureConference2015" "https://channel9.msdn.com/Events/Microsoft-Azure/mac2015/RSS/"
    $event.Editions += $edition
    $events += $event

    $event = New-Ch9Event "Build"
    $edition = New-Ch9EventEdition "Build 2017" "Build2017" "https://s.ch9.ms/Events/Build/2017/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Build 2016" "Build2016" "https://s.ch9.ms/Events/Build/2016/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Build 2015" "Build2015" "http://s.ch9.ms/Events/Build/2015/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Build 2014" "Build2014" "http://s.ch9.ms/Events/Build/2014/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Build 2013" "Build2013" "http://s.ch9.ms/Events/Build/2013/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Build 2012" "Build2012" "http://s.ch9.ms/Events/Build/2012/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Build 2011" "Build2011" "http://s.ch9.ms/Events/Build/2011/RSS/"
    $event.Editions += $edition
    $events += $event

    $event = New-Ch9Event "Ignite"
    $edition = New-Ch9EventEdition "Ignite 2017" "Ignite2017" "https://channel9.msdn.com/Events/Ignite/2017/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Ignite 2016" "Ignite2016" "https://channel9.msdn.com/Events/Ignite/2016/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Ignite 2015 Australia" "Ignite2015Australia" "https://s.ch9.ms/Events/Ignite/Australia-2015/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Ignite 2015 China" "Ignite2015China" "https://s.ch9.ms/Events/Ignite/Microsoft-Ignite-China-2015/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Ignite 2015 New Zealand" "Ignite2015NewZealand" "https://s.ch9.ms/Events/Ignite/Microsoft-Ignite-New-Zealand-2015/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Ignite 2015" "Ignite2015" "http://channel9.msdn.com/Events/Ignite/2015/RSS/"
    $event.Editions += $edition
    $events += $event

    $event = New-Ch9Event "Connect()"
    $edition = New-Ch9EventEdition "Connect() 2017" "Connect2017" "https://channel9.msdn.com/Events/Connect/2017/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Connect() 2016" "Connect2016" "https://channel9.msdn.com/Events/Connect/2016/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Connect(); // 2015" "Connect2015" "https://channel9.msdn.com/Events/Visual-Studio/Connect-event-2015/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Connect(); Microsoft Visual Studio vNext & Azure" "Connect2014" "http://channel9.msdn.com/Events/Visual-Studio/Connect-event-2014/RSS/"
    $event.Editions += $edition

    $event = New-Ch9Event "Shows"
    $edition = New-Ch9EventEdition "Azure Friday" "AzureFriday" "https://s.ch9.ms/Shows/Azure-Friday/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Data Exposed" "DataExposed" "https://channel9.msdn.com/Shows/Data-Exposed/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Game Dev Show" "GameDevShow" "https://s.ch9.ms/Shows/gamedev/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Microsoft Imagine" "MicrosoftImagine" "https://s.ch9.ms/Blogs/Microsoft-Imagine/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "MS Dev Show" "MSDevShow" "https://s.ch9.ms/Shows/msdevshow/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "TechNet Radio" "TechNetRadio" "https://channel9.msdn.com/Shows/TechNet+Radio/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "The Maker Show" "TheMakerShow" "https://s.ch9.ms/Shows/themakershow/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "The Defrag Show" "TheDefragShow" "https://channel9.msdn.com/Shows/The-Defrag-Show/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "This Week On Channel 9" "ThisWeekOnChannel9" "https://s.ch9.ms/Shows/This+Week+On+Channel+9/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Visual Studio Toolbox" "VisualStudioToolbox" "https://s.ch9.ms/Shows/Visual-Studio-Toolbox/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Xamarin Show" "XamarinShow" "https://channel9.msdn.com/Shows/XamarinShow/RSS/"
    $event.Editions += $edition
    $events += $event

    $event = New-Ch9Event "TechEd"
    $edition = New-Ch9EventEdition "TechEd Europe 2014" "TechEdEurope2014" "http://channel9.msdn.com/Events/TechEd/Europe/2014/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "TechEd Australia 2014" "TechEdAustralia2014" "http://channel9.msdn.com/Events/TechEd/Australia/2014/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "TechEd New Zealand 2014" "TechEdNewZealand2014" "http://channel9.msdn.com/Events/TechEd/NewZealand/2014/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "TechEd North America  2014" "TechEdNorthAmerica2014" "http://channel9.msdn.com/Events/TechEd/NorthAmerica/2014/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "TechEd New Zealand 2013" "TechEdNewZealand2013" "http://channel9.msdn.com/Events/TechEd/NewZealand/2013/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "TechEd Australia 2013" "TechEdAustralia2013" "http://channel9.msdn.com/Events/TechEd/Australia/2013/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "TechEd Europe 2013" "TechEdEurope2013" "http://channel9.msdn.com/Events/TechEd/Europe/2013/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "TechEd North America  2013" "TechEdNorthAmerica2013" "http://channel9.msdn.com/Events/TechEd/NorthAmerica/2013/RSS/"
    $event.Editions += $edition
    $events += $event
    
	$event = New-Ch9Event "Various"
    $edition = New-Ch9EventEdition "DEVintersection 2015" "DEVintersection2015" "https://channel9.msdn.com/Events/DEVintersection/DEVintersection-2015/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "TechDays Sweden 2015" "TechDaysSweden2015" "https://channel9.msdn.com/Events/TechDays-Sweden/TechDays-Sweden-2015/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Windows 10 IT Pro Readiness" "Windows10ITProReadiness" "https://channel9.msdn.com/Events/MVP-Virtual-Conference/Windows-10-IT-Pro-Readiness/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Developer's Guide to Windows 10 Preview" "DevGuideWin10Preview" "https://channel9.msdn.com/Series/Developers-Guide-to-Windows-10-Preview/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Microsoft Edge Web Summit 2015" "EdgeWebSummit2015" "https://channel9.msdn.com/Events/WebPlatformSummit/2015/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Devices and Networking Summit 2015" "DevicesSummit2015" "https://channel9.msdn.com/Events/Microsoft-Research/Devices-and-Networking-Summit-2015/RSS/"
    $event.Editions += $edition
	$events += $event
    
    $event = New-Ch9Event "Visual Studio"
    $edition = New-Ch9EventEdition "Visual Studio 2015 Final Release Event" "VS2015FinalRelease" "https://channel9.msdn.com/Events/Visual-Studio/Visual-Studio-2015-Final-Release-Event/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Cross-platform development" "Cross-platform2014" "http://channel9.msdn.com/Events/Visual-Studio/Cross-platform-development/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Visual Studio 2013 Launch" "VSLaunch2013" "http://channel9.msdn.com/Events/Visual-Studio/Launch-2013/RSS/"
    $event.Editions += $edition
    $events += $event

    $event = New-Ch9Event "WinHEC"
    $edition = New-Ch9EventEdition "WinHEC Shenzhen March 18-19" "WinHEC2015" "http://channel9.msdn.com/Events/WinHEC/2015/RSS/"
    $event.Editions += $edition
    $events += $event
    
	Return $events
}
<#
.SYNOPSIS
.DESCRIPTION
.NOTES  
.LINK  
.EXAMPLE  
#>
function DownloadFile([string]$url, [string]$file)
{ 
    $fileName = split-path $file -leaf
    if (Test-Path $file -pathType leaf)
    {
        "'" + $fileName + "' already exists."
        return
	}
    $uri = New-Object "System.Uri" "$url" 
    $request = [System.Net.HttpWebRequest]::Create($uri) 
    $request.set_Timeout(10000)
    $response = $request.GetResponse() 
    $length = $response.get_ContentLength()
    $urlStream = $response.GetResponseStream()
    $temp = $file + ".temp" 
    $fileStream = New-Object -TypeName System.IO.FileStream -ArgumentList $temp, Create 
    $buffer = new-object byte[] 32768
    $count = $urlStream.Read($buffer, 0, $buffer.length) 
    $downloaded = $count 
    while ($count -gt 0)
    { 
        $progress = $downloaded / $length * 100
        Write-Progress -id 2 -parentid 1 -Activity "Downloading '$fileName' ($downloaded/$length)" -PercentComplete $progress
        $fileStream.Write($buffer, 0, $count)
        $count = $urlStream.Read($buffer, 0, $buffer.length) 
        $downloaded = $downloaded + $count 
    } 
    if ($fileStream)
    {
        $fileStream.Flush()
        $fileStream.Close()
        $fileStream.Dispose()
    } 
    if ($urlStream)
    {
        $urlStream.Dispose()
    }
    rename-item $temp -newname $file
    "'$fileName' done ($downloaded bytes)" 
}
<#
.SYNOPSIS
.DESCRIPTION
.NOTES  
.LINK  
.EXAMPLE  
#>
function Ch9Download([string]$RssLink, [string]$DestFolder, [string]$Extension)
{
    $folder = Join-Path $baseFolder $DestFolder
    [IO.Directory]::CreateDirectory($folder) | Out-Null
    $re = ':|\?|/|\\|\||\*|<|>|"|\.'
    "Retrieving the RSS Feed '" + $RssLink + "'"
    $wc = New-Object System.Net.WebClient
    $wc.Encoding = [System.Text.Encoding]::UTF8
    $rss = ([xml]$wc.downloadstring($RssLink))
    $total = $rss.rss.channel.item.length 
    foreach($item in $rss.rss.channel.item)
    {
	    $link = New-Object System.Uri($item.link)
	    $id = $link.Segments[$link.Segments.Length - 1].Replace($Extension, '')
        $title = $item.title -replace $pat, ''
	    $file = (($id + ' ' + $title) -replace $re, '') + $Extension
	    $fullFile = $folder + '\' + $file
        $current = $current + 1
        $progress = $current / $rss.rss.channel.item.length * 100
        Write-Progress -id 1 -Activity "Downloading Channel9 content ($current/$total)" -PercentComplete $progress
        DownloadFile $item.enclosure.url $fullFile
    }
}
if (!$baseFolder)
{
    $baseFolder = Join-Path ([environment]::GetFolderPath("UserProfile")) "Downloads\"
}
"Channel9 Content Downloader 2.7 by Alex Danvy @danvy http://danvy.tv"
"Source code available on http://github.com/danvy/channel9"

#Event
"Select the event on Channel9:"
$events = New-Ch9Events
for ($i=0; $i -lt $events.Count; $i++)
{
    "[" + ($i + 1) + "] " + $events[$i].Name
}
"[0] Exit"
Write-Output -NoNewLine ("[0-" + $events.Count + "]? ")
$eventNumber = Read-Host
$eventNumber -as [int] | Out-Null
if (($eventNumber  -gt 0) -and ($eventNumber -le $events.Count))
{
    $eventSelected = $events[$eventNumber -1]
    #Edition
    "Select the " + $eventSelected.Name + " edition:"
    for($i = 0; $i -lt $eventSelected.Editions.Count; $i++)
    {
        "[" + ($i + 1) + "] " + $eventSelected.Editions[$i].Name
    }
    "[0] Exit"
    Write-Output -NoNewLine ("[0-" + $eventSelected.Editions.Count + "]? ")
    $editionNumber = Read-Host
    $editionNumber -as [int] | Out-Null
    if (($editionNumber  -gt 0) -and ($editionNumber -le $eventSelected.Editions.Count))
    {
        $editionSelected = $eventSelected.Editions[$editionNumber -1]
        #Format
        "Select the file format to download for the " + $editionSelected.Name + ":"
        for($i = 0; $i -lt $editionSelected.Formats.Count; $i++)
        {
            "[" + ($i + 1) + "] " + $editionSelected.Formats[$i].Name
        }
        "[0] Exit"
        Write-Output -NoNewLine ("[0-" + $editionSelected.Formats.Count + "]? ")
        $formatNumber = Read-Host
        $formatNumber -as [int] | Out-Null
        if (($formatNumber  -gt 0) -and ($formatNumber -le $editionSelected.Formats.Count))
        {
            $formatSelected = $editionSelected.Formats[$formatNumber -1]
            Ch9Download ($editionSelected.Url + $formatSelected.Url) $editionSelected.Folder $formatSelected.Extension
        }
    }
}
