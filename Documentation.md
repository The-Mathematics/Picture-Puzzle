# Picture Puzzle

## Goal

The goal of this project is to delve into complex use of 2D Arrays in Swift - 

1. Making a basic puzzle app that lets you move the tiles in 4 directions (North,South,East,West) to get all the pieces or tiles in the the right position

2. Using Swipe Gesture Recognizer on UIImageViews to recognize swipe gestures and then call the function to move the puzzle piece,

3. Usinf the AVFoundation library and the AVAudioPlayer method to add a scroll sound to every swipe gesture 

4. Using the ".shuffled()" and ".removeFirst()" methods to ensure there are no repitions of puzzle pieces when the reset button is pressed


## What the App does

Just like every other puzzle that challenges you to think beyond what you can see on the canvas and yet requires you to paint a defined picture.This one takes no less than 2-3minutes to get you hyped.IQ REQUIREMENT - 12O


## How i did it (step by step)

* Start a new Xcode project and add image assets for the App Icon,LaunchScreen, UIImages

* import UIKit and AVFoundation

* Create UIImageViews for the puzzle pieces and add a label and a button to beautify the UI 
* Place them in Views and StackViews, Then place all views inside a stackView named gridView - Then add constraints

* Link the UIImageViews to the viewController as IBOutlets and name them image views for each number of image view (imageViewOne...)

* create variables for empty arrays of UIIMageView type for your outer Array and inner Array and then initialze outer index and inner index as 0 

* create a variable for the player with type AVAudioPlayer to play the scroll sound

* Create the function playSound() to play the sound

* Inside the viewDidLoad() function - Create a variable to store the image assets for the puzzle pieces in an array,Create a variable shuffledPuzzlePieces to store the method to shuffle images in the puzzle pieces array using the ".shuffled()" method

* Inside the viewDidLoad() function - Assign a shuffledPuzzlePieces.removeFirst() to every imageView to ensure there are no repititions 

* Create a function to create the 2D array to fit the number of rows and columns you want

* Create another function to assign the imageViews to their corresponding index on the 2D Array created - Remember to call the function to create the 2D Array inside this function before assigning the imageViews

* Add a Swipe Gesture Recognizer to add gesture recognizers to every imageView in the 2D Array by first creating a gridView assigned the value "outerArray[i][j]", Then declare the gesture for left,right,up and down and declare them in the grid view (like this: "gridView.addGestureRecognizer(leftSwipeGesture)")

* Create the function handleSwipe(_gesture: UISwipeGestureRecognizer) with instructions for every swipe gesture - Remember to call the playSound() function to ensure the sound plays when the swipe occurs and Loop through the 2D Array to locate all outerIndex and innerIndex in the 2D Array

*  Create the functions (left(), right(), up(), down()) called in every "switch gesture.direction" case

## Prerequisites for project

* Knowledge on how to make 2D Arrays and how to move the elements in the Array

* Knowledge on how to play sounds using AVFoundation

* Knowledge on to how add Gesture Recognizers to an app (tap,touch or swipe)

* Knowledge on how to use the ".shuffled()" method to shuffle the first or last element in the Array so no repetition occurs when you reset the puzzle pieces

