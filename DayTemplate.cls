Class aoc2023.DayTemplate Extends aoc2023.Base
{

// https://adventofcode.com/2023/day/1

Parameter InputFile = "Day1Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line
        w line,!
    }
    return $$$OK
}

}
