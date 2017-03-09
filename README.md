# dgtipcalculator
Tip Calculator - Pre Work for Codepath iOS Bootcamp 2017


# Pre-work - TipCalculator

TipCalculator is a tip calculator application for iOS.

Submitted by: Danny Glover

Time spent: 7 hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [X] UPDATE 2: Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Autolayout constraints used to ensure proper display in portrait and landscape modes
  - UPDATE 1: limited app to portrait mode to ensure best user experience
- [X] UPDATE 1: Display amount for splitting the total between 1-4 people (lions). Implemented using stack views and auto layout for alignment
- [X] UPDATE 1: Use a UISlider to allow the user to adjust the tip amount (as well as default tip amount)
- [X] UPDATE 2: Add a dark mode setting, this is remembered across app restarts


## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/DdqFuSX.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Had some troubles with the amount displaying properly if I removed the border on the input textfield. I'm not sure if this was an issue with the code or just a display issue with the simulator. I will test further with a real device in the future.

## License

    Copyright 2017 Danny Glover

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
