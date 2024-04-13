//Use this code to try to understand 2D Arrays
var innerArray = ["⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️"]

var outerArray = [[String]]()

var outerIndex = 0
var innerIndex = 0
var outerIndexCorn = 0
var innerIndexCorn = 0

func createWorld() {
    for _ in 0...6 {
        outerArray.append([])
    }
    for i in 0...6 {
        outerArray[i] = innerArray
    }
}


func start() {
    createWorld();
    outerArray[0][0] = "🦊"
    outerArray[2][3] = "🌽"
    for i in 0...6 {
        print(outerArray[i])
    }
}

func locateFox(){
    var found = false
    for i in 0..<outerArray.count{
      for j in 0..<outerArray[i].count{
        if outerArray[i][j] == "🦊"{
          outerIndex = i
          innerIndex = j
          found = true
          break
        }
      }
      if found{
        break 
      }
    }
  print("Fox found at position (\(outerIndex), \(innerIndex))")
}

func locateCorn(){
    var found = false
    for a in 0..<outerArray.count {
        for b in 0..<outerArray[a].count {
            if outerArray[a][b] == "🌽" {
                outerIndexCorn = a
                innerIndexCorn = b
                found = true
                break
            }
        }
        if found {
            break
        }
    }
    print("corn found at position (\(outerIndexCorn), \(innerIndexCorn))")
}


func leftFox() {
    locateFox()
    if innerIndex > 0 {
      outerArray[outerIndex][innerIndex] = "⬜️"
      outerArray[outerIndex][innerIndex - 1] = "🦊"
    } else {
      print("Can't go further left.")
    }
}

func rightFox() {
    locateFox()
    if (innerIndex < innerArray.count) {
      outerArray[outerIndex][innerIndex] = "⬜️"
      outerArray[outerIndex][innerIndex + 1] = "🦊"
    } else {
      print("Can't go further right.")
    }
}

func upFox() {
    locateFox()
    if outerIndex > 0 {
      outerArray[outerIndex][innerIndex] = "⬜️"
      outerArray[outerIndex - 1][innerIndex] = "🦊"
    } else {
      print("Can't go further up.")
    }
}


func downFox() {
    locateFox()
    if outerIndex < outerArray.count {
      outerArray[outerIndex][innerIndex] = "⬜️"
      outerArray[outerIndex + 1][innerIndex] = "🦊"
    } else {
      print("Can't go further down.")
    }
}
func leftCorn() {
    locateCorn()
    if innerIndexCorn > 0 {
      outerArray[outerIndexCorn][innerIndexCorn] = "⬜️"
      outerArray[outerIndexCorn][innerIndexCorn - 1] = "🌽"
    } else {
      print("Can't go further left.")
    }
}

func rightCorn() {
    locateCorn()
    if (innerIndexCorn < innerArray.count) {
      outerArray[outerIndexCorn][innerIndexCorn] = "⬜️"
      outerArray[outerIndexCorn][innerIndexCorn + 1] = "🌽"
    } else {
      print("Can't go further right.")
    }
}

func upCorn() {
    locateCorn()
    if outerIndexCorn > 0 {
      outerArray[outerIndexCorn][innerIndexCorn] = "⬜️"
      outerArray[outerIndexCorn - 1][innerIndexCorn] = "🌽"
    } else {
      print("Can't go further up.")
    }
}


func downCorn() {
    locateCorn()
    if outerIndexCorn < outerArray.count {
      outerArray[outerIndexCorn][innerIndexCorn] = "⬜️"
      outerArray[outerIndexCorn + 1][innerIndexCorn] = "🌽"
    } else {
      print("Can't go further down.")
    }
}

func visualise() {
    for i in 0...6 {
        print(outerArray[i])
    }
}


//Call start() function to display the "fox" and "corn" on the the 2D Array
//Move the "Fox" and "Corn" using the functions created (e.g: "upFox()" , "upCorn()")
//Call the visualise() function to display their new positions on the array
