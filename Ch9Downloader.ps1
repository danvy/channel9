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
function New-Ch9EventEdition()
{
  param ([string]$Name, [string]$Folder, [string]$Url)
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
function New-Ch9Event()
{
  param ([string]$Name)
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

    $event = New-Ch9Event "Build"
    $edition = New-Ch9EventEdition "Build 2014" "Build2014" "http://s.ch9.ms/Events/Build/2014/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Build 2013" "Build2013" "http://s.ch9.ms/Events/Build/2013/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Build 2012" "Build2012" "http://s.ch9.ms/Events/Build/2012/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Build 2011" "Build2011" "http://s.ch9.ms/Events/Build/2011/RSS/"
    $event.Editions += $edition
    $events += $event

    $event = New-Ch9Event "TechEd"
    $edition = New-Ch9EventEdition "TechEd Europe 2014" "TechEdEurope2014" "http://channel9.msdn.com/Events/TechEd/Europe/2014/RSS"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "TechEd Australia 2014" "TechEdAustralia2014" "http://channel9.msdn.com/Events/TechEd/Australia/2014/RSS"
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
    
    $event = New-Ch9Event "Visual Studio"
    $edition = New-Ch9EventEdition "Connect(); Microsoft Visual Studio vNext & Azure" "Connect2014" "http://channel9.msdn.com/Events/Visual-Studio/Connect-event-2014/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Cross-platform development" "Cross-platform2014" "http://channel9.msdn.com/Events/Visual-Studio/Cross-platform-development/RSS/"
    $event.Editions += $edition
    $edition = New-Ch9EventEdition "Visual Studio 2013 Launch" "VSLaunch2013" "http://channel9.msdn.com/Events/Visual-Studio/Launch-2013/RSS/"
    $event.Editions += $edition
    $events += $event

$event = New-Ch9Event "WinHEC"
    $edition = New-Ch9EventEdition "WinHEC Shenzhen March 18-19" "WinHEC2015" "http://channel9.msdn.com/Events/WinHEC/2015/RSS"
    $event.Editions += $edition
    $events += $event
    $event = New-Ch9Event "Various"
    $edition = New-Ch9EventEdition "Developer's Guide to Windows 10 Preview" "DevGuideWin10Preview" "https://channel9.msdn.com/Series/Developers-Guide-to-Windows-10-Preview/RSS/"
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
function Ch9Download()
{
    param ([string]$RssLink, [string]$Folder, [string]$Extension)
    $dest = [environment]::GetFolderPath("UserProfile") + "\Downloads\" + $Folder
    [IO.Directory]::CreateDirectory($dest) | Out-Null
    $re = ':|\?|/|\\|\||\*|<|>|"|\.'
    "Retrieving the RSS Feed (" + $RssLink + ")"
    $rss = ([xml](new-object net.webclient).downloadstring($RssLink))
    "" + $rss.rss.channel.item.Count + " files to download."
    foreach($item in $rss.rss.channel.item)
    {
	    $link = New-Object System.Uri($item.link)
	    $id = $link.Segments[$link.Segments.Length - 1].Replace($Extension, '')
        $title = $item.title -replace $pat, ''
	    $file = (($id + ' ' + $title) -replace $re, '') + $Extension
	    $destFile = $dest + '\' + $file
	    if (Test-Path $destFile -pathType leaf)
        {
		    "File " + $file + " already exists. Skipped."
	    }
	    else
        {
		    "Downloading " + $file + "..."
		    $url = New-Object System.Uri($item.enclosure.url)
		    (New-Object System.Net.WebClient).DownloadFile($url, $destFile) 
	    }
    }
}
"Channel9 Content Downloader 1.1 by Alex Danvy @danvy"
#Event
"Select the event on Channel9:"
$events = New-Ch9Events
for ($i=0; $i -lt $events.Count; $i++)
{
    "[" + ($i + 1) + "] " + $events[$i].Name
}
"[0] Exit"
Write-Host -NoNewLine ("[0-" + $events.Count + "]? ")
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
    Write-Host -NoNewLine ("[0-" + $eventSelected.Editions.Count + "]? ")
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
        Write-Host -NoNewLine ("[0-" + $editionSelected.Formats.Count + "]? ")
        $formatNumber = Read-Host
        $formatNumber -as [int] | Out-Null
        if (($formatNumber  -gt 0) -and ($formatNumber -le $editionSelected.Formats.Count))
        {
            $formatSelected = $editionSelected.Formats[$formatNumber -1]
            Ch9Download ($editionSelected.Url + $formatSelected.Url) $editionSelected.Folder $formatSelected.Extension
        }
    }
}

