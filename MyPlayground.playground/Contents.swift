//: Playground - noun: a place where people can play

let columns = 3
let rows = 4

func columnAndRowForIndex(index: Int) -> (column: Int, row: Int) {
    
    let row = index/columns
    let column = index % columns
    
    return (column: column, row: row)
}

func hasDotBetweenIndex(start: Int, end:Int) -> Bool {
    
    let startColRow = columnAndRowForIndex(index: start)
    let endColRow   = columnAndRowForIndex(index: end)
    
    return (startColRow.column == endColRow.column && startColRow.row != endColRow.row && abs(startColRow.row-endColRow.row)>1) ||
           (startColRow.row == endColRow.row && startColRow.column != endColRow.column && abs(startColRow.column-endColRow.column)>1) ||
           (abs(startColRow.row-endColRow.row) == abs(startColRow.column-endColRow.column) && abs(startColRow.row-endColRow.row) > 1)
}

func inBetweenDotIndexesForStart(start: Int, end: Int) -> [Int] {
    if hasDotBetweenIndex(start: start, end: end) {
        let startColRow = columnAndRowForIndex(index: start)
        let endColRow   = columnAndRowForIndex(index: end)
        
        let col : Int
        let row : Int
        if startColRow.column<endColRow.column {
            col = startColRow.column+1
        } else if startColRow.column>endColRow.column {
            col = startColRow.column-1
        } else {
            col = startColRow.column
        }
        
        if startColRow.row<endColRow.row {
            row = startColRow.row+1
        } else if startColRow.row>endColRow.row {
            row = startColRow.row-1
        } else {
            row = startColRow.row
        }
        
        let dotIndex = row*columns+col
        let colDots = inBetweenDotIndexesForStart(start: start, end: dotIndex)
        let rowDots = inBetweenDotIndexesForStart(start: end, end: dotIndex)
        return [ dotIndex ] + colDots + rowDots
    } else {
        return []
    }
}

columnAndRowForIndex(index: 0)
columnAndRowForIndex(index: 2)
columnAndRowForIndex(index: 3)
columnAndRowForIndex(index: 4)
columnAndRowForIndex(index: 8)

hasDotBetweenIndex(start: 0, end: 2)
hasDotBetweenIndex(start: 3, end: 5)
hasDotBetweenIndex(start: 0, end: 6)
hasDotBetweenIndex(start: 0, end: 8)
hasDotBetweenIndex(start: 6, end: 2)

hasDotBetweenIndex(start: 2, end: 4)
hasDotBetweenIndex(start: 0, end: 3)
hasDotBetweenIndex(start: 0, end: 0)
hasDotBetweenIndex(start: 0, end: 5)
hasDotBetweenIndex(start: 0, end: 7)


inBetweenDotIndexesForStart(start: 0, end: 2)
inBetweenDotIndexesForStart(start: 2, end: 2)
inBetweenDotIndexesForStart(start: 0, end: 6)
inBetweenDotIndexesForStart(start: 3, end: 9)
inBetweenDotIndexesForStart(start: 0, end: 9)
inBetweenDotIndexesForStart(start: 9, end: 0)
inBetweenDotIndexesForStart(start: 0, end: 3)
