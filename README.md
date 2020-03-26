# Next Chord 
An iOS app for musicians to find the next chord to aid in music writing/improvising or just for fun.

## Description
Next Chord is an iOS app intended for musicians to find the next suggested chord based on the parent chord. Suggested chords are based on common conventional chord progression patterns used in music. More information on chord progression: https://en.wikipedia.org/wiki/Chord_progression

### Features 
* Home Screen - displays major and minor key signatures as UICollectionview
* Chord Progression Pattern Screen - displays chord progression patterns of key signature as UITableview
* Sound Playback - sounds of chords can be heard when tapped in the Chord Progression Pattern Screen
* Reference Screen - list of chords and key signatures as UITableview
* New Chord Screen - displays the suggested next chord(s) based on the selected chord as UICollectionView

### Basic Usage
To get common chord progressions tap on a key signature from the home page and a list of chord patterns will appear.
Chord progression patterns need to be played sequentially, in this case from left to right.

To get the next suggested chords tap on the Next Chord tab bar icon and select the chord you would like to get all the next suggested chords. To get the following suggested chords after that, simply tap a chord in the suggested chord view. 

### App Walk-through
![](nextChordProjectWalk.gif)

### Run Locally

Project code can be viewed locally and run in Xcode's simulator by cloning/downloading or forking this repo.

## Built With
* [Xcode - 11.3.1](https://developer.apple.com/xcode/) - The IDE used
* [Swift - 5.1.4](https://developer.apple.com/swift/) - Programming Language

## Author
* Cao Mai - portfolio can be found at:
https://www.makeschool.com/portfolio/Cao-Mai

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Application Note
Is it known that chord progression works best when moving sequentially forward. In this app, however, the next chord functionality not only suggests chords that go sequentially forward but backwards too. As such, there are instances where suggested chords will not sound too pleasant. This method can be removed to exclusively moving sequentially forward but then populated suggested next chords would not be as broad and I feel they are there as only suggested chords and it's up to you to determine whether you like the chord or not. I hope to eventually create a button that lets the user select their preferences. Also, note that the next chord functionality does not take key signatures into account, meaning the suggested next chords may be of different key and so may sound particularly harsh. 

These quirks are intentionally implemented/kept because part of the fun of this app is discovering obscure chord patterns that's not completely random but at the same time not tied to chord progression patterns or key signatures too tightly.

## Developer's Note
Currently (as of March 2020), the project runs successfully without any error. However, this is a work in progress and not all key signatures/chords are yet added to the project. Most chords don't yet have sounds because they haven't been added. Only key signatures of C major and C minor have chord sounds.

I will try to add more key signatures and chord sounds when time permits. 
