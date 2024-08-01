# Do DNS query and record them

$domains = @("microsoft.com","google.com")
$recordType = "A"
$okCount = 0
$nokCount = 0
$okDomains = @()
$nokDomains = @()

foreach ($domain in $domains) {
    try {
        $result = Resolve-DnsName -Name $domain -Type $recordType -ErrorAction Stop
        $okCount++
        $okDomains += $domain
        Write-Host "OK: $domain" -ForegroundColor Green
    }
    catch {
        $nokCount++
        $nokDomains += $domain
        Write-Host "NOK: $domain" -ForegroundColor Red
    }
}

Write-Host "`nTotal OK: $okCount"
Write-Host "Total NOK: $nokCount"

$okDomains | Out-File -FilePath "OK.txt"
$nokDomains | Out-File -FilePath "NOK.txt"
