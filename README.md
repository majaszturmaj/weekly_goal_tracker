# Weekly Goal Tracker
A multi-platform application that involves making weekly notes - summaries of "what I am proud of this week" and comparing them to one, the most important, on which you have your long-term goals recorded. This gives insight into whether you are heading in the right direction with your actions.
The idea for the application came from the fact that most of the available applications that help in achieving goals, motivation, and planning, are either too complex and therefore, in my opinion, distracting, or force the user to use it daily - that's why I often saw empty fields in the "statistics" which made me a bit sad and demotivated. In this way, I thought I would do something similar but not requiring daily activity, with a simple interface and minimal functionalities.

This is my first Flutter project btw.

## Project
Mobile applications are applications, let's call it, of first contact with the user. Everything starts at the visual layer, behind which hides the logical layer. Especially in the case of this particular application.

This is my UI protoptype made with Figma:
![image](https://github.com/majaszturmaj/weekly_goal_tracker/assets/63556516/3981b9e8-249c-4632-bda1-84a29b01e44b)

The idea was simple: a navigation bar and two screens—one with the date and a note describing the successes of the week, and another with the same note attached to a description of long-term goals being pursued. Initially, I thought that the weekly note would only be editable on the first screen, "Notepad," while "Milestones" would be a locked twin copy of the entered text. Later, I realized that it didn't make sense and was inconvenient—editing the weekly note should be possible wherever the note is visible.

*On the design, both screens have a cogwheel icon in the top right corner. Application settings and other interesting features that could be added in the future will be described in the "Ideas for Further Development" section.*

## Classes and Project Functionality
Here, I listed several important classes and included the rest without descriptions.
The first important set of classes, including widgets, is responsible for managing what appears on the screen.
![image](https://github.com/majaszturmaj/weekly_goal_tracker/assets/63556516/4459f765-e0e1-4520-a275-0636ae6401b7)
The entire application starts with the instantiation of the MyApp class, preceded by "WidgetsFlutterBinding.ensureInitialized();"—that's because at some point during the application build, I had an error caused by the absence of this element.
MyApp is a stateless widget whose task is to call MyHomePage with the appropriate MaterialApp settings. The _MyHomePageState, which is built, represents one of the selected pages (based on the index) along with the navigation bar. Let's move on to the navigation bar.

![image](https://github.com/majaszturmaj/weekly_goal_tracker/assets/63556516/675f436a-a424-458b-9b7e-0fc8eda0365d)
NavigatorContainer is another stateless widget. It has been moved to a separate dart file (MyApp and MyHomePage were in the main file).

Here is the structure of all the files in the lib folder:
![image](https://github.com/majaszturmaj/weekly_goal_tracker/assets/63556516/110a69af-e45c-4abf-9595-7d159d29e475)

The navigation bar has three icon buttons that change depending on the current page, and they pass the corresponding page number to OnIndexChanged. Additionally, they are contained in a gray-blue Container.

Then we have three pages. Let's start with the first one, which contains a notepad with the current date highlighted, indicating the current week of the year. 
![image](https://github.com/majaszturmaj/weekly_goal_tracker/assets/63556516/b264b8a0-2a51-4fc9-b2b4-a4150e546490)
Everything is located in the notepad_widgets.dart file.
Firstly, we have the stateful widget, NotepadPage. In the build method, two other widgets are used, stacked on top of each other using Column, among others: DateDisplay and TextInputBox.
DateDisplay is a stateful widget that uses initState() to retrieve a formatted string with the date from date_manager.dart.
TextInputBox represents the area where the user enters their note.

The rest of the classes are depicted below:
![image](https://github.com/majaszturmaj/weekly_goal_tracker/assets/63556516/52e4e571-436b-4c4a-8973-c72b2c8ffe98)
![image](https://github.com/majaszturmaj/weekly_goal_tracker/assets/63556516/706cfccb-93a4-447a-99e0-ddb4602eedf6)

# Challenges
During the project development, I encountered many challenges, actually MUCH more than listed here, but I simply didn't document them. Below are the problems from one day, noted in bullet points.

What I managed to handle:

* Understanding the responsibilities of different components. Using widgets generated with the help of the Figma plugin for Flutter, I already had nicely designed objects. However, sometimes I didn't know which parameter to change (or where to add it) to achieve the desired effect. I only found out through trial and error, which was made easier by the hot reload feature.
* No windows desktop project configured. After initializing the repository in the project folder, I added certain folders (including windows/) to .gitignore because I didn't want to upload them to GitHub. Unfortunately, this resulted in not being able to run the project on a system other than Android. I had to execute the command "flutter create --platforms=windows,macos,linux" to resolve the situation.
* The number of challenges I managed to overcome was much larger, but I didn't document them at that time, and now I can't remember everything.

What overwhelmed me:

* Creating the history feature - the page with the history was not part of my initial plan, but my inner voice urged me to include it. It was the element I worked on the longest because:
1. I had to bring my own concept of speech bubbles moving along an invisible track into reality.
2. Initially, there was only one speech bubble, the one with the current editable note, just like on the other two screens. The rest were supposed to be added from a prepared template.
3. When the WEEK changes (the one visible on screen 0, based on the date), which means the start of a new Monday, the weekly note is cleared, and its content is added to a list of Strings called historyNotes. After this happens, the widget in the HistoryPage is notified, and a speech bubble with the note from the previous week appears above the current one, pushing the previous bubbles upward if they exist.
*Issue with the MilestonesPage - At some point, during one of the many tests, I noticed that if I am on the Milestones page and click on the icon in the Navigator again, taking me to that page, the text from the weekly note is replaced (fortunately, only visually, unless it is edited) with the hint text... As I mentioned in parentheses, it's fine as long as you don't touch it, but if you click and start typing, the entire meticulously crafted weekly note is overwritten with a new one.
*Simply never having done anything like this before - Since I didn't understand the more complex aspects, I did many things blindly, through trial and error, and often relying on the sometimes unreliable Chat GPT. In the end, this simple project took me much more time than I expected (4 days of work) and didn't fulfill all of my initial goals (at least it met the initial assumptions).
