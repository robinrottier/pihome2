
$image="pihome2"
$name="pihome2"
$df="Dockerfile-buster"

function build()
{
    if (test-path $df)
    {
        $ct = "."
    }
    else
    {
        throw "Cant find dockerfile? Run either from project directory or project/docker folder"
    }
    
    docker build -t $image -f $df $ct
    if ($LASTEXITCODE -ne 0) { write-host -ForegroundColor Red "build failed ($LASTEXITCODE)"; return }
}

function killRunning()
{
    docker kill $name 2>&1 | out-null
}

function run_it()
{
    killRunning

    docker run --rm --name $name -h $name -p 7802:80 -p 7803:3306 -it $image
}

function buildAndRun()
{
    build 
    #&& run_it
}

function shell()
{
    docker exec -it $image ash
}

for ($a=0; $a -lt 10; $a++)
{
    $c = $args[$a]
    if (!$c) { return }
    "$c..."
    & $c
    if ($LASTEXITCODE -ne 0) { write-host -ForegroundColor Red "...failed ($LASTEXITCODE)"; return }
}
