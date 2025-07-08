$filePath = "e:\Hoc tap\1.Udemy\Backend\Java Spring MVC\SpringMVC\src\main\webapp\WEB-INF\view\client\product\detail.jsp"
$content = Get-Content $filePath -Raw
$content = $content -replace 'src="client/', 'src="/client/'
Set-Content -Path $filePath -Value $content
