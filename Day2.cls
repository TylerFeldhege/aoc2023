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

        set gamePossible = 1

        set gameID = $P(line,":",1,1)
        set gameID = $P(gameID," ",2,2)
        //w "gameID: ",gameID,!

        set gameValues = $P(line,":",2,2)
        set gameValues = $ZSTRIP(gameValues,"<>W")
        //w "gameValues: ",gameValues,!

        set gameList = $LISTFROMSTRING(gameValues,";")
        //w "gameList: ",$LISTTOSTRING(gameList,"|")

        //list over each game
        set ptr = 0
        while $LISTNEXT(gameList,ptr,currentGame){
            //w "current Game: ",currentGame,!
            set boxList = $LISTFROMSTRING(currentGame,",")
            //w "boxList: ",$LISTTOSTRING(boxList,"|"),!

            set ptr2 = 0
            while $LISTNEXT(boxList,ptr2,currentBox){
                set currentBox = $ZSTRIP(currentBox,"<>W")
                //w "current box: ",currentBox,!

                set currentBoxAmount = $P(currentBox," ",1,1)
                set currentBoxColor = $P(currentBox," ",2,2)

                //w "currentBoxAmount: ",currentBoxAmount,!
                //w "currentBoxColor: ",currentBoxColor,!

                if currentBoxColor = "red"{
                    if currentBoxAmount > REDLIMIT{
                        set gamePossible = 0
                    }
                }
                if currentBoxColor = "green"{
                    if currentBoxAmount > GREENLIMIT{
                        set gamePossible = 0
                    }
                }
                if currentBoxColor = "blue"{
                    if currentBoxAmount > BLUELIMIT{
                        set gamePossible = 0
                    }
                }

            }
        }

        if gamePossible = 1{
            set answer = answer + gameID
        }
    }




    w "Answer: ",answer,!


    return $$$OK
}

ClassMethod Run2(verbose = 0) As %Integer
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
        w line,!

        set gamePossible = 1

        set gameID = $P(line,":",1,1)
        set gameID = $P(gameID," ",2,2)
        //w "gameID: ",gameID,!

        set gameValues = $P(line,":",2,2)
        set gameValues = $ZSTRIP(gameValues,"<>W")
        //w "gameValues: ",gameValues,!

        set highestRed = 0
        set highestGreen = 0
        set highestBlue = 0

        set gameList = $LISTFROMSTRING(gameValues,";")
        //w "gameList: ",$LISTTOSTRING(gameList,"|")

        //list over each game
        set ptr = 0
        while $LISTNEXT(gameList,ptr,currentGame){
            //w "current Game: ",currentGame,!
            set boxList = $LISTFROMSTRING(currentGame,",")
            //w "boxList: ",$LISTTOSTRING(boxList,"|"),!

            set ptr2 = 0
            while $LISTNEXT(boxList,ptr2,currentBox){
                set currentBox = $ZSTRIP(currentBox,"<>W")
                //w "current box: ",currentBox,!

                set currentBoxAmount = $P(currentBox," ",1,1)
                set currentBoxColor = $P(currentBox," ",2,2)

                //w "currentBoxAmount: ",currentBoxAmount,!
                //w "currentBoxColor: ",currentBoxColor,!

                if currentBoxColor = "red"{
                    if currentBoxAmount > highestRed{
                        set highestRed = currentBoxAmount
                    }
                }
                if currentBoxColor = "green"{
                    if currentBoxAmount > highestGreen{
                        set highestGreen = currentBoxAmount
                    }
                }
                if currentBoxColor = "blue"{
                    if currentBoxAmount > highestBlue{
                        set highestBlue = currentBoxAmount
                    }
                }


                #; if currentBoxColor = "red"{
                #;     if currentBoxAmount > REDLIMIT{
                #;         set gamePossible = 0
                #;     }
                #; }
                #; if currentBoxColor = "green"{
                #;     if currentBoxAmount > GREENLIMIT{
                #;         set gamePossible = 0
                #;     }
                #; }
                #; if currentBoxColor = "blue"{
                #;     if currentBoxAmount > BLUELIMIT{
                #;         set gamePossible = 0
                #;     }
                #; }

            }


        }

        w "Highest Red: ",highestRed,!
        w "Highest Green: ",highestGreen,!
        w "Highest Blue: ",highestBlue,!

        set power = highestRed*highestGreen*highestBlue
        w "Power: ",power,!


        set answer = answer + power
    }




    w "Answer: ",answer,!


    return $$$OK
}

// ClassMethod Run1(verbose = 0) As %Integer

// {

//     set stream=..GetInput(..#InputFile)

//     set inputList = ""

//     set answer = 0

//     set REDLIMIT = 12

//     set GREENLIMIT = 13

//     set BLUELIMIT = 14

//     while 'stream.AtEnd{

//         set line = stream.ReadLine()

//         set $LIST(inputList,*+1) = line

//         //w line,!

//         set currentGameID = $P($P(line," ",2,2),":",1,1)

//         //w currentGameID,!

//         set setlist = $LISTFROMSTRING(line,";")

//         set ptr = 0

//         set gameIsValid = 1

//         while $LISTNEXT(setlist,ptr,currentSet){

//             //w currentSet,!

//             set boxList = $LISTFROMSTRING(currentSet,",")

//             set ptr2 = 0

//             While $LISTNEXT(boxList,ptr2,currentBox){

//                 //w currentBox,!

//                 set currentNum = $ZSTRIP(currentBox,"*AW")

//                 set currentColor = $ZSTRIP(currentBox,"*NW")

//                 if currentColor = "red"{

//                     if currentNum > REDLIMIT{

//                         set gameIsValid = 0

//                     }

//                 }

//                 if currentColor = "green"{

//                     if currentNum > GREENLIMIT{

//                         set gameIsValid = 0

//                     }

//                 }

//                 if currentColor = "blue"{

//                     if currentNum > BLUELIMIT{

//                         set gameIsValid = 0

//                     }

//                 }

//             }

//         }

//         if gameIsValid{

//             w line,!

//             //w "Game is Valid",!

//             set answer = answer + currentGameID

//         }else{

//             //w "Game is Invalid",!

//         }

//     }

//     w "Answer: ",answer,!

//     return $$$OK

// }

}
