
Add-Type -Path "C:\codebuild\artifacts\_PublishedWebsites\WebApplication1\bin\Microsoft.Web.XmlTransform.dll"

try 
{
Write-Host 'applyConfigTransformation - Called'
Write-Host ".\Web-template.config"
$doc = New-Object Microsoft.Web.XmlTransform.XmlTransformableDocument
$doc.PreserveWhiteSpace = $true
Write-Host 'applyConfigTransformation - Load Called'
$doc.Load(".\Web-template.config")
Write-Host 'applyConfigTransformation - Load completed'

$trn = New-Object Microsoft.Web.XmlTransform.XmlTransformation(".\Web.AWS_CSP_NON_PRODUCTION_01.config")

if ($trn.Apply($doc))
{
Write-Host 'applyConfigTransformation - $trn.Apply called'
$doc.Save(".\Web.config")
Write-Output "Output file: $dst"
Write-Host 'applyConfigTransformation - $trn.Apply completed'
}
else
{
throw "Transformation terminated with status False"
}
}
catch
{
Write-Output $Error[0].Exception
} 
