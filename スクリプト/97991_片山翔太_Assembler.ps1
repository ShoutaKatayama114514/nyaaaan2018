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
    }else{
        if($Index -eq 1){ $cmdline[0] = "1" }
    }

    if(($Index -eq 2) -And ($st -eq 1)){
        $cmdLine[$Index] = $myMemory[$cmdLine[$Index]]
    }elseif(!(([int]$cmdline[2] -ge 0) -And ([int]$cmdline[2] -lt 128))){
        $cmdline[0] = "1"
    }
    return $cmdLine 
}

function Set-Value($cmdline) {
    # TODO メモリに値をセットする
    switch ($cmdLine[0]) {
        "1" { return 1 }
        Default {    
            $myMemory[[int]$cmdLine[1]] = [int]$cmdLine[2]
            return 0
        }
    }
}

function Add-Value($cmdline) {
    # TODO メモリに値を加算する
    switch ($cmdLine[0]) {
        "1" {  }
        Default {
            $calc = $myMemory[[int]$cmdLine[1]] + [int]$cmdLine[2]
            $myMemory[[int]$cmdLine[1]] = $calc%128        
        }
    }
}

function Sub-Value($cmdline) {
    # TODO メモリに値を減産する
    switch ($cmdLine[0]) {
        "0" { return 1 }
        Default {
            $calc = $myMemory[[int]$cmdLine[1]] - [int]$cmdLine[2]
            if($calc -lt 0){
                return 1 
            }else{
                $myMemory[[int]$cmdLine[1]] = $calc
                return 0
            }
        }
    }
}

function Mul-Value($cmdline) {
    # TODO メモリに値を除算する
    switch ($cmdLine[0]) {
        condition { return 1 }
        Default {
            $calc = [Math]::Floor([int]($myMemory[[int]$cmdLine[1]] / [int]$cmdLine[2]))
            $myMemory[[int]$cmdLine[1]] = $calc
            return 0
        }
    }
}

function Div-Value($cmdline) {
    # TODO メモリに値を乗算する
    switch ($cmdline[0]) {
        condition { return 1 }
        Default {
            $calc = $myMemory[[int]$cmdLine[1]] * [int]$cmdLine[2]
            if($calc -gt 128){
                return 1
            }else{
                $myMemory[[int]$cmdLine[1]] = $calc
                return 0
            }
        }
    }
}

function Get-Value($cmdline) {
    # TODO メモリの値を取得する
    switch ($cmdline[0]) {
        condition { return 1 }
        Default {
            Write-Host $myMemory[[int]$cmdLine[1]]
            return 0
        }
    }
}

[bool] $loop = $TRUE
while ($loop) {
    $cmdLine = Read-Host "Input Command"
    $myErrarFlag = 1
    $cmdLine = $cmdLine.Split(" ")
    
    $seting = 0
    
    if(($cmdLine[0] -eq "SET") -Or ($cmdLine[0] -eq "set")){
        $cmdline = CheckSize $cmdline  1
        $cmdline = CheckSize $cmdline  2
        $seting = Set-Value $cmdline
       
    }elseif(($cmdLine[0] -eq "GET" ) -Or ($cmdLine[0] -eq "get")){
        $cmdline = CheckSize $cmdline  1
        $seting = Get-Value $cmdline 

    }elseif(($cmdLine[0] -eq "ADD" ) -Or ($cmdLine[0] -eq "add")){
        $cmdline = CheckSize $cmdline  1
        $cmdline = CheckSize $cmdline  2
        $seting = Add-Value  $cmdline  

    }elseif(($cmdLine[0] -eq "SUB" ) -Or ($cmdLine[0] -eq "sub")){
        $cmdline = CheckSize $cmdline  1
        $cmdline = CheckSize $cmdline  2
        $seting = Sub-Value  $cmdline  
          
    }elseif(($cmdLine[0] -eq "DIV" ) -Or ($cmdLine[0] -eq "div")){
        $cmdline = CheckSize $cmdline  1
        $cmdline = CheckSize $cmdline  2
        $seting = Div-Value  $cmdline  
        
    }elseif(($cmdLine[0] -eq "MUL" ) -Or ($cmdLine[0] -eq "mul")){
        $cmdline = CheckSize $cmdline  1            
        $cmdline = CheckSize $cmdline  2
        $seting = Mul-Value  $cmdline  
        
    }elseif(($cmdLine[0] -eq "RET" ) -Or ($cmdLine[0] -eq "ret")){
        $loop = $FALSE
        break
    }elseif($cmdLine[0] -eq "a"){
        CheckSize $cmdLine 1
    }else{
        $seting = 1
    }

    # TODO コマンドに応じた処理を記述
    switch ($seting) {
        1 {  
            Write-Host "Input Error"
            break
        }
        default { 
            
        }
    }
}
