Class aoc2023.Day5 Extends aoc2023.Base
{

// https://adventofcode.com/2023/day/5

Parameter InputFile = "Day5Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line
        //w line,!
        
        if ##class(Ens.Util.FunctionSet).StartsWith(line,"seeds:"){
            set seeds = $P(line,": ",2,2)
            set seedList = $LISTFROMSTRING(seeds," ")
        }
    
        
    }

    set answer = ""
    w $LISTTOSTRING(seedList),!

    set locationList = ""

    set ptr = 0
    while $LISTNEXT(seedList,ptr,currentSeed){
        set nextValue = ""
        set ptr2=0
        while $LISTNEXT(inputList,ptr2,currentLine){
            w currentLine,!
            if $ISVALIDNUM($E(currentLine,1,1)){
                set num1 = $P(currentLine," ",1,1)
                set num2 = $P(currentLine," ",2,2)
                set num3 = $P(currentLine," ",3,3)

                if currentSeed '= ..RangeCheck(currentSeed,num1,num2,num3){
                    set nextValue = ..RangeCheck(currentSeed,num1,num2,num3)
                }
                w "Current Value: ",currentSeed,!
                w "Next Value: ",nextValue,!

            }

            if currentLine = ""{
                if nextValue '= ""{
                    set currentSeed = nextValue 
                }
                set nextValue = ""
            }

        }

        if nextValue '= ""{
            set currentSeed = nextValue 
        }

        set $LIST(locationList,*+1) = currentSeed
        w "Locations :",$LISTTOSTRING(locationList),!
    }

    set answer = ""

    set ptr = 0
    while $LISTNEXT(locationList,ptr,currentLoc){
        if answer = ""{
            set answer = currentLoc
        }elseif currentLoc < answer{
            set answer = currentLoc
        }
    }

    w "Answer: ",answer,!

    return $$$OK
}

ClassMethod RangeCheck(input, dest, source, range) As %String
{
    set returnValue = input
    set diff = source - dest

    //w "Diff: ",diff,!

    set sourceMin = source
    set sourceMax = source+range-1

    //w "Source Min:",sourceMin,!
    //w "Source Max:",sourceMax,!

    if input >= sourceMin{
        if input <= sourceMax{
            set returnValue = input - diff
        }
    }


    return returnValue
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line
        //w line,!
        
        if ##class(Ens.Util.FunctionSet).StartsWith(line,"seeds:"){
            set seeds = $P(line,": ",2,2)
            set seedRangeList = $LISTFROMSTRING(seeds," ")
        }
    
        
    }

    set seedList = ""

    w "SeedRangeList: ",$LISTTOSTRING(seedRangeList),!

    for i=1:1:$LISTLENGTH(seedRangeList){
        //w "i: ",i,!
        //w "current Value: ",$LIST(seedRangeList,i),!
        set even = i # 2

        if even = 0{
            //w "Even",!
            set range = $LIST(seedRangeList,i)

            for j=0:1:range-1{
                //w j+startingValue,!
                set $LIST(seedList,*+1) = j+startingValue
            }

        }else{
            set startingValue = $LIST(seedRangeList,i)
        }


    }

    //w "Final Seed List: ",$LISTTOSTRING(seedList)

    w $LISTTOSTRING(seedList),!

    set locationList = ""

    set ptr = 0
    while $LISTNEXT(seedList,ptr,currentSeed){
        set nextValue = ""
        set ptr2=0
        while $LISTNEXT(inputList,ptr2,currentLine){
            //w currentLine,!
            if $ISVALIDNUM($E(currentLine,1,1)){
                set num1 = $P(currentLine," ",1,1)
                set num2 = $P(currentLine," ",2,2)
                set num3 = $P(currentLine," ",3,3)

                if currentSeed '= ..RangeCheck(currentSeed,num1,num2,num3){
                    set nextValue = ..RangeCheck(currentSeed,num1,num2,num3)
                }
                //w "Current Value: ",currentSeed,!
                //w "Next Value: ",nextValue,!

            }

            if currentLine = ""{
                if nextValue '= ""{
                    set currentSeed = nextValue 
                }
                set nextValue = ""
            }

        }

        if nextValue '= ""{
            set currentSeed = nextValue 
        }

        set $LIST(locationList,*+1) = currentSeed
        //w "Locations :",$LISTTOSTRING(locationList),!
    }

    set answer = ""

    set ptr = 0
    while $LISTNEXT(locationList,ptr,currentLoc){
        if answer = ""{
            set answer = currentLoc
        }elseif currentLoc < answer{
            set answer = currentLoc
        }
    }

    w "Answer: ",answer,!

    return $$$OK
}

}
