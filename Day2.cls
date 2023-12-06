Class aoc2023.Day2 Extends aoc2023.Base
{

// https://adventofcode.com/2023/day/2

Parameter InputFile = "Day2Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""

    set answer = 0
    
    set REDLIMIT = 12
    set GREENLIMIT = 13
    set BLUELIMIT = 14

    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line
        //w line,!

        set currentGameID = $P($P(line," ",2,2),":",1,1)
        //w currentGameID,!

        set setlist = $LISTFROMSTRING(line,";")

        set ptr = 0

        set gameIsValid = 1
        while $LISTNEXT(setlist,ptr,currentSet){
            //w currentSet,!

            set boxList = $LISTFROMSTRING(currentSet,",")

            set ptr2 = 0
            While $LISTNEXT(boxList,ptr2,currentBox){
                //w currentBox,!

                set currentNum = $ZSTRIP(currentBox,"*AW")
                set currentColor = $ZSTRIP(currentBox,"*NW")

                if currentColor = "red"{
                    if currentNum > REDLIMIT{
                        set gameIsValid = 0
                    }
                }

                if currentColor = "green"{
                    if currentNum > GREENLIMIT{
                        set gameIsValid = 0
                    }
                }

                if currentColor = "blue"{
                    if currentNum > BLUELIMIT{
                        set gameIsValid = 0
                    }
                }

            }
        }

        if gameIsValid{
            w line,!
            //w "Game is Valid",!
 
            set answer = answer + currentGameID
        }else{
            //w "Game is Invalid",!
        }

    }

    w "Answer: ",answer,!
    return $$$OK
}

}
