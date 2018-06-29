#A B C D E F の数値を格納するためのメモリーとして配列を用意
$myMemory = @(0,0,0,0,0,0)
#エラーフラグ
$myErrarFlag = 0
function CheckSize($cmdLine,$Index){
    $st = 0
    if(($cmdLine[$Index] -eq "a") -Or ($cmdLine[$Index] -eq "A")){
        $cmdLine[$Index] = "0";
        $st = 1
    }elseif(($cmdLine[$Index] -eq "b") -Or ($cmdLine[$Index] -eq "B")){
        $cmdLine[$Index] = "1";
        $st = 1
    }elseif(($cmdLine[$Index] -eq "c") -Or ($cmdLine[$Index] -eq "C")){
        $cmdLine[$Index] = "2";
        $st = 1
    }elseif(($cmdLine[$Index] -eq "d") -Or ($cmdLine[$Index] -eq "D")){
        $cmdLine[$Index] = "3";
        $st = 1
    }elseif(($cmdLine[$Index] -eq "e") -Or ($cmdLine[$Index] -eq "E")){
        $cmdLine[$Index] = "4";
        $st = 1
    }elseif(($cmdLine[$Index] -eq "f") -Or ($cmdLine[$Index] -eq "F")){
        $cmdLine[$Index] = "5";
        $st = 1
    }else{ if($Index -eq 1){ $myErrarFlag = 1 } }

    if(($Index -eq 2) -And ($st -eq 1)){$cmdLine[$Index] = $myMemory[$cmdLine[$Index]]}

    return $cmdLine 
}

function Set-Value($cmdline) {
    # TODO メモリに値をセットする
   $myMemory[[int]$cmdLine[1]] = [int]$cmdLine[2]
}

function Add-Value($cmdline) {
    # TODO メモリに値を加算する
    $myMemory[[int]$cmdLine[1]] = $myMemory[[int]$cmdLine[1]] + [int]$cmdLine[2]
}

function Sub-Value($cmdline) {
    # TODO メモリに値を減産する
    $myMemory[[int]$cmdLine[1]] = $myMemory[[int]$cmdLine[1]] - [int]$cmdLine[2]
}

function Mul-Value($cmdline) {
    # TODO メモリに値を除算する
    $myMemory[[int]$cmdLine[1]] = $myMemory[[int]$cmdLine[1]] * [int]$cmdLine[2]
}

function Div-Value($cmdline) {
    # TODO メモリに値を乗算する
    $myMemory[[int]$cmdLine[1]] = $myMemory[[int]$cmdLine[1]] / [int]$cmdLine[2]
}

function Get-Value($cmdline) {
    # TODO メモリの値を取得する
    Write-Host $myMemory[[int]$cmdLine[1]]
}

[bool] $loop = $TRUE
while ($loop) {
    $cmdLine = Read-Host "Input Command"
    $cmdLine = $cmdLine.Split(" ")

    # TODO コマンドに応じた処理を記述
    switch ($myErrarFlag) {
        0 {  
            if(($cmdLine[0] -eq "SET") -Or ($cmdLine[0] -eq "set")){
                $cmdline = CheckSize $cmdline  1
                $cmdline = CheckSize $cmdline  2
                if($myErrarFlag -ne 1){
                    Set-Value $cmdline
                }else{
                    $myErrarFlag = 1
                }
            }elseif(($cmdLine[0] -eq "GET" ) -Or ($cmdLine[0] -eq "get")){
                $cmdline = CheckSize $cmdline  1
                if($myErrarFlag -ne 1){
                    Get-Value $cmdline 
                }else{
                    $myErrarFlag = 1
                }
            }elseif(($cmdLine[0] -eq "ADD" ) -Or ($cmdLine[0] -eq "add")){
                $cmdline = CheckSize $cmdline  1
                $cmdline = CheckSize $cmdline  2
                if($myErrarFlag -ne 1){
                    Add-Value  $cmdline  
                }else{
                    $myErrarFlag = 1
                }
            }elseif(($cmdLine[0] -eq "SUB" ) -Or ($cmdLine[0] -eq "sub")){
                $cmdline = CheckSize $cmdline  1
                $cmdline = CheckSize $cmdline  2
                if($myErrarFlag -ne 1){
                    Sub-Value  $cmdline  
                }else{
                    $myErrarFlag = 1
                }  
            }elseif(($cmdLine[0] -eq "DIV" ) -Or ($cmdLine[0] -eq "div")){
                $cmdline = CheckSize $cmdline  1
                $cmdline = CheckSize $cmdline  2
                if($myErrarFlag -ne 1){
                    Div-Value  $cmdline  
                }else{
                    $myErrarFlag = 1
                }
            }elseif(($cmdLine[0] -eq "MUL" ) -Or ($cmdLine[0] -eq "mul")){
                $cmdline = CheckSize $cmdline  1
                $cmdline = CheckSize $cmdline  2
                if($myErrarFlag -ne 1){
                    Mul-Value  $cmdline  
                }else{
                    $myErrarFlag = 1
                }
            }elseif(($cmdLine[0] -eq "RET" ) -Or ($cmdLine[0] -eq "ret")){
                $loop = $FALSE
                break
            }elseif($cmdLine[0] -eq "a"){
                CheckSize $cmdLine 1
            }
            else{
                Write-Host "Input Error!"
                $myErrarFlag = 0
            }
        }
        default { 
            Write-Host "Input Error!"
            $myErrarFlag = 0
        }
    }
}
