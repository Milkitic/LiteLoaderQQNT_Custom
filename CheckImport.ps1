# 定义文件路径和声明
$loaderPath = (Get-Location).Path
$filePath = Join-Path $loaderPath ".." "QQNT/resources/app/app_launcher/index.js" -Resolve
$declaration = "require(String.raw``$loaderPath``);"

# 读取文件内容
$fileContent = Get-Content -Path $filePath

# 检查第一行是否包含声明
if ($fileContent[0] -notmatch [regex]::Escape($declaration)) {
    # 插入声明到文件的第一行
    $newContent = @($declaration) + $fileContent
    # 写入新的内容到文件
    $newContent | Set-Content -Path $filePath
    Write-Output "声明已插入到文件的第一行。"
}
else {
    Write-Output "文件的第一行已经包含声明，无需插入。"
}