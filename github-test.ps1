$token = "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"
Invoke-RestMethod -Uri "https://api.github.com/user" -Headers @{Authorization = "Bearer $token"}