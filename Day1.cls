Class aoc2023.Day1 Extends aoc2023.Base
{

// https://adventofcode.com/2023/day/1

Parameter InputFile = "Day1Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set answer = 0

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line
        //w line,!

        set line = $ZSTRIP(line,"<>APC")
        //w line,!

        set num = $E(line,1,1)_$E(line,*,*)
        //w num,!

        set answer = answer + num
    
    }

    
    w answer,!

    return $$$OK
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set answer = 0

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line
        //w line,!

        set lowest = ""
        set highest = ""

        set numList = $LFS("zero,one,two,three,four,five,six,seven,eight,nine")

        set lineLength = $L(line)
        for i=-3:1:lineLength{
            if lowest = ""{
                if $ISVALIDNUM($E(line,i,i)){
                    set lowest = $E(line,i,i)
                }
                set firstFive = $E(line,i,i+4)
                //w "first five",firstFive,!
                if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"one"){
                    set lowest = "1"
                }
                if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"two"){
                    set lowest = "2"
                }
                if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"three"){
                    set lowest = "3"
                }
                if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"four"){
                    set lowest = "4"
                }
                if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"five"){
                    set lowest = "5"
                }
                if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"six"){
                    set lowest = "6"
                }
                if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"seven"){
                    set lowest = "7"
                }
                if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"eight"){
                    set lowest = "8"
                }
                if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"nine"){
                    set lowest = "9"
                }
                if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"zero"){
                    set lowest = "0"
                }

            }
        }

        for i=lineLength+3:-1:0{
            set singleChar = $E(line,i-3,i-3)
            set firstFive = $E(line,i-4,i)

            //w "single: ",singleChar,!
            //w "five: ",firstFive,!
            //w "highest: ", highest,!
            if highest = ""{
                if $ISVALIDNUM(singleChar){
                    //w "HIT VALID NUM",!
                    set highest = singleChar
                }
                if highest = ""{
                    if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"one"){
                        set highest = "1"
                    }
                    if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"two"){
                        set highest = "2"
                    }
                    if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"three"){
                        set highest = "3"
                    }
                    if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"four"){
                        set highest = "4"
                    }
                    if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"five"){
                        set highest = "5"
                    }
                    if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"six"){
                        set highest = "6"
                    }
                    if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"seven"){
                        set highest = "7"
                    }
                    if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"eight"){
                        set highest = "8"
                    }
                    if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"nine"){
                        set highest = "9"
                    }
                    if ##class(Ens.Util.FunctionSet).StartsWith(firstFive,"zero"){
                        set highest = "0"
                    }
                }
            }
        }

        set lineNum = lowest_highest
        //w lineNum,!
        set answer = answer + lineNum
    }

    
    w answer,!

    return $$$OK
}

}
