Class aoc2023.Day4 Extends aoc2023.Base
{

// https://adventofcode.com/2023/day/4

Parameter InputFile = "Day4Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""

    set answer = 0

    while 'stream.AtEnd{
        set line = stream.ReadLine()
        //set $LIST(inputList,*+1) = line
        //w line,!
        set line = ##class(Ens.Util.FunctionSet).ReplaceStr(line,"  "," ")
        set winningNumbers = $P(line,":",2,*)
        set winningNumbers = $P(winningNumbers,"|",1,1)
        set winningNumbers = $ZSTRIP(winningNumbers,"<>W")
        set winningNumbersList = $LISTFROMSTRING(winningNumbers," ")
        //w winningNumbers,!

        set myNumbers = $P(line,"|",2,2)
        set myNumbers = $ZSTRIP(myNumbers,"<>W")
        set myNumbersList = $LISTFROMSTRING(myNumbers," ")
        //w myNumbers,!


        set currentScore = 0

        set ptr = 0
        while $LISTNEXT(myNumbersList,ptr,currentNumber){
            //w currentNumber,!
            if $LISTFIND(winningNumbersList,currentNumber){
                //w "Found: ",currentNumber,!
                if currentScore = 0{
                    set currentScore = 1
                }else{
                    set currentScore = currentScore*2
                }
            }
        }

        set answer = answer + currentScore
        //w line,!
    }

    w "Answer: ",answer,!
    return $$$OK
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""

    set answer = 0

    set cardDeckKey = ##class(%ArrayOfDataTypes).%New()

    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line
        w line,!

        set line = ##class(Ens.Util.FunctionSet).ReplaceStr(line,"  "," ")

        set cardID = $P(line,":",1,1)
        set cardID = $P(cardID," ",2,2)
        w cardID,!

        set winningNumbers = $P(line,":",2,*)
        set winningNumbers = $P(winningNumbers,"|",1,1)
        set winningNumbers = $ZSTRIP(winningNumbers,"<>W")
        set winningNumbersList = $LISTFROMSTRING(winningNumbers," ")
        //w winningNumbers,!

        set myNumbers = $P(line,"|",2,2)
        set myNumbers = $ZSTRIP(myNumbers,"<>W")
        set myNumbersList = $LISTFROMSTRING(myNumbers," ")
        //w myNumbers,!


        set currentMatches = 0


        set ptr = 0
        while $LISTNEXT(myNumbersList,ptr,currentNumber){
            //w currentNumber,!
            if $LISTFIND(winningNumbersList,currentNumber){
                //w "Found: ",currentNumber,!
                set currentMatches = currentMatches + 1
            }
        }

        //set answer = answer + currentScore
        w "current Matches: "_currentMatches,!


        set matchesToAdd = ""
        for i=1:1:currentMatches{
            set cardToAdd = cardID + i
            if matchesToAdd = ""{
                set matchesToAdd = cardToAdd
            }else{
                set matchesToAdd = matchesToAdd_","_cardToAdd
            }
        }


        w "LIST: ",matchesToAdd,!


        if matchesToAdd = ""{
            set matchesToAdd = "NONE"
        }


        //do cardDeckKey.SetAt("1","1") 

        do cardDeckKey.SetAt(cardID,matchesToAdd) 
    }

    w "sample "_cardDeckKey.GetAt(1),!
    //w $LISTTOSTRING(cardDeckKey.GetAt("2")),!

    w "Answer: ",answer,!
    return $$$OK
}

}
