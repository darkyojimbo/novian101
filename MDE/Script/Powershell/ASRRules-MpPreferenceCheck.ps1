# Check ASR Rules policy

(Get-MpPreference).AttackSurfaceReductionRules_Ids | ForEach-Object { 
    $actionValue = (Get-MpPreference).AttackSurfaceReductionRules_Actions[$((Get-MpPreference).AttackSurfaceReductionRules_Ids.IndexOf($_))]
    $action = switch ($actionValue) {
        0 { "Not Configured" }
        1 { "Block" }
        2 { "Audit" }
        6 { "Warn" }
        5 { "Not Configured" }
        default { "Unknown" }
    }
    [PSCustomObject]@{Id=$_; Action=$action} 
} | Format-Table -Property Id, Action -AutoSize
