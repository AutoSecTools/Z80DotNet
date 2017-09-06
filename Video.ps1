$lastVideo = ""
$offset = 0
$bufferSize = 1024
$lineSize = 64
$lines = $bufferSize / $lineSize
while(1) {
    $video = [IO.File]::ReadAllText("c:\temp\video.bin");
    if ($lastVideo -ne $video) {
        cls
        0..($lines - 1)|%{
            Write-Host $video.Substring($_*$lineSize, $lineSize) -ForegroundColor Green -BackgroundColor Black
        }
        $lastVideo = $video
    }
    Sleep -Milliseconds 100
}