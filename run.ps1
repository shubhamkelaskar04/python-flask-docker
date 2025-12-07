# run.ps1 - build and run the Docker container for the Flask app

param(
    [string]$ImageName = "my-flask-app",
    [string]$ContainerName = "flask-docker-example-container",
    [int]$Port = 5000
)

# Build image
Write-Host "Building image $ImageName..."
docker build -t $ImageName .

# Remove existing container if exists
$existing = docker ps -a --filter "name=$ContainerName" --format "{{.ID}}"
if ($existing) {
    Write-Host "Removing existing container $ContainerName..."
    docker rm -f $ContainerName | Out-Null
}

# Run container (quote the port mapping to avoid PowerShell token splitting)
Write-Host "Starting container $ContainerName mapping host port $Port -> container port 5000..."
$portMapping = "$Port`:5000"
docker run --name $ContainerName -p $portMapping -d $ImageName

Write-Host "Done. Use 'docker ps' to inspect the running container."