#sample api test script

$url = "https://qa-dashboard.monitorsolutions.net/Home/AgencywiseSupervisorwiseOfficers?supervisorOrgId=7500155"

try {
    $response = Invoke-WebRequest -Uri $url -Method Get -Headers $header
    
    if ($response.StatusCode -lt 1) {
        Write-Host "API test passed!"
        Write-Host "Status Code: $($response.StatusCode)"
        # Optionally, output the content of the response
        # Write-Host "Response Content: $($response.Content)"
    } else {
        Write-Host "API test failed!"
        Write-Host "Status Code: $($response.StatusCode)"
    }
} catch {
    Write-Host "Error occurred during API call:"
    Write-Host $_.Exception.Message
}



