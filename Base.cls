Class aoc2023.Base
{

Parameter Folder = "/irisrun/repo/src/aoc2023/Files/";

ClassMethod GetInput(fn) As %Stream.Object
{
   
    set fn=..#Folder_fn
    set stream = ##Class(%Stream.FileCharacter).%New()
    set sc=stream.LinkToFile(fn)
    return stream
}

}
