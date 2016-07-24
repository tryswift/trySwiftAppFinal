# trySwiftApp
try! Swift Conference App

## TODO
- [x] Create `data.json` template
- [x] Decode models from JSON
- [x] Get (Q&A) session for a specific day
- [x] Add UIImage assets
- [x] Add fallback with imageURL
- [x] Cleanup imageURL fallbacks
- [x] Periodically (or just every startup?) check if the json file's version is still up-to-date (now checking in `didFinishLaunching`)
- [x] If there is a new version of the JSON, download it and persist it; use that until it becomes outdated again
- [x] Add 1.2 version for the JSON / API including the new speakers
- [x] Add a fallback to the "hardcoded" JSON if neccesary.
- [x] Generate acknowledgements to include new libraries
- [x] Check how US-times (AM/PM) can be used in the API ~~and (as such) in the app~~
- [x] Show events on August 31
- [ ] ~~Make speaker images in Q&A tappable without 3D Touch (or was this intentional in any way?!)~~
- [ ] ~~Show speaker images in Q&A flexible; they should show as many speaker images as there are speakers (instead of a fixed 3). Now, tapping on an "empty" speaker image crashes the app~~
- [x] Temporarily remove Q&A from the app
- [ ] Add API / JSON to website (now hosted on my server)
- [ ] Immediately use newly downloaded JSON file. Now, a restart of the app is required
- [ ] Support talks with multiple speakers (End-to-end application development in Swift)
