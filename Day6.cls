Class aoc2023.Day6 Extends aoc2023.Base
{

// https://adventofcode.com/2023/day/6

Parameter InputFile = "Day6Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line
        w line,!
    }

    set timeLine = $LIST(inputList,1)    
    set timeLine = $P(timeLine,":",2,2)
    set timeLine = $ZSTRIP(timeLine,"<>W")
    for i=1:1:10{
        set timeLine = ##class(Ens.Util.FunctionSet).ReplaceStr(timeLine,"  "," ")
    }
    set timeList = $LISTFROMSTRING(timeLine," ")
    w $LISTTOSTRING(timeList),!

    set distanceLine = $LIST(inputList,2)    
    set distanceLine = $P(distanceLine,":",2,2)
    set distanceLine = $ZSTRIP(distanceLine,"<>W")
    for i=1:1:10{
        set distanceLine = ##class(Ens.Util.FunctionSet).ReplaceStr(distanceLine,"  "," ")
    }
    set distanceList = $LISTFROMSTRING(distanceLine," ")
    w $LISTTOSTRING(distanceList),!

    set waysToWinCountsList = ""

    w "ListLength: ",$LISTLENGTH(timeList),!

    for i=1:1:$LISTLENGTH(timeList){
        //w "iteration: ",i,!
        set inputTime = $LIST(timeList,i)
        set inputDistance = $LIST(distanceList,i)

        w "inputTime: ",inputTime,!
        w "inputDistance: ",inputDistance,!
    
        set currentTimeDistanceList = ""
        for j=1:1:inputTime{
            set $LIST(currentTimeDistanceList,*+1) = ..calculateDistance(inputTime,j)
        }


        //w "Distances: ",$LISTTOSTRING(currentTimeDistanceList),!

        set winCount = 0
        set ptr = 0
        while $LISTNEXT(currentTimeDistanceList,ptr,currentDistance){
            if currentDistance > inputDistance{
                set winCount = winCount + 1
            }
        }

        set $LIST(waysToWinCountsList,*+1) = winCount

    }
    //w "Ways To Win: ",$LISTTOSTRING(waysToWinCountsList),!

    set answer = 1
    set ptr = 0
    while $LISTNEXT(waysToWinCountsList,ptr,currentWinCount){
        set answer = answer * currentWinCount
    }

    w "Answer: ",answer,!

    return $$$OK
}

ClassMethod calculateDistance(inputTime, waitTime) As %String
{
    set runTime = inputTime - waitTime
    set distance = runTime * waitTime

    return distance
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line
        w line,!
    }

    set timeLine = $LIST(inputList,1)    
    set inputTime = $ZSTRIP(timeLine,"*W")
    set inputTime = $P(inputTime,":",2,2)
    w inputTime,!

    set distanceLine = $LIST(inputList,2)    
    set inputDistance = $ZSTRIP(distanceLine,"*W")
    set inputDistance = $P(inputDistance,":",2,2)
    w inputDistance,!

    set waysToWinCountsList = ""


    w "inputTime: ",inputTime,!
    w "inputDistance: ",inputDistance,!
   
    set currentTimeDistanceList = ""

    set winCount = 0
    for j=1:1:inputTime{
        if inputDistance < ..calculateDistance(inputTime,j){
            set winCount = winCount + 1
        }

    }


        //w "Distances: ",$LISTTOSTRING(currentTimeDistanceList),!

    #; set winCount = 0
    #; set ptr = 0
    #; while $LISTNEXT(currentTimeDistanceList,ptr,currentDistance){
    #;     if currentDistance > inputDistance{
    #;         set winCount = winCount + 1
    #;     }
    #; }
    set answer = winCount




    w "Answer: ",answer,!

    return $$$OK
}

}
