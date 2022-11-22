# Final Project DiceRoll Iteration 1:

## First Party Assets

- Player jump and landing sound effects made using LMMS's sfxr port.

## Third Party Assets

- Obstacle sprites from [Robert Brooks' Physics Game Objects](https://www.gamedeveloperstudio.com/graphics/viewgraphic.php?page-name=Physics-game-objects&item=1c4p841t4d6u0y7f7a) and licensed under the [Game Developer Studio Standard License](https://www.gamedeveloperstudio.com/license.php)
- Obstacle sound effects from [Zapsplat.com](https://www.zapsplat.com/gold-member-home/) and licensed under the [Zapsplat Standard License](https://www.zapsplat.com/license-type/standard-license/) with a Gold Membership and no attribution required as described in the license.
- Wood sprite from [Robert Brooks' Wooden Physics Blocks](https://www.gamedeveloperstudio.com/graphics/viewgraphic.php?page-name=Wooden-physics-blocks&item=1d4m810z4w5d2e863c) and licensed under the [Game Developer Studio Standard License](https://www.gamedeveloperstudio.com/license.php)
- Background sprites from [acrock's Unique Pattern Background Asset Pack](https://acrock.itch.io/pattern-bg-asset-acrock), [acrock's Unique Pattern Background Asset Pack2](https://acrock.itch.io/pattern-bg2-asset-acrock), and [acrock's Sparkling Texture BG](https://acrock.itch.io/sparkinlg-bg-asset-acrock) all licensed as free as of October 30th, 2022.
- Die sprite from [Aeynit's Fantasy Dices Pack](https://aeynit.itch.io/fantasy-dices-pack) licensed as free for any project "commercial or not" as of October 30th, 2022.
- Siberian Herds music from [freesfx.co.uk](https://www.freesfx.co.uk/Category/Technological/231) page 2 and licensed under the [Free SFX / Free Music Tracks terms](https://www.freesfx.co.uk/Music.aspx)
- Micro Six Font from [GGBotNet on Fontspace.com](https://www.fontspace.com/micro-six-font-f84595) and licensed under the [SIL Open Font License](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=ofl)

## Project Report:

### Reflection



### Documented Features

I used different layers and masks to manage obstacle and player collisions with each other and the ground. For example, the player collides with the ground, but obstacles do not collide with either the player or the ground. Obstacle collisions are detected with a layer mask so that they can pass through the player without affecting its velocity values.

I included AI-controlled objects that fly at the player at a speed dependent on the speed modifier, each having different behaviors.

### Self-Assessment

- [x] D-1: The repository contains a <code>README.md</code> file in its top-level directory.
- [x] D-2: The project content is eligible for an <a href="https://www.esrb.org/ratings-guide/">ESRB Rating</a> of M or less.
- [x] C-1: Your repository is well-formed, in our course organization, with an appropriate <code>.gitignore</code> file, no unnecessary files tracked, and all commit messages following <a href="https://cbea.ms/git-commit/">our commit message style guide</a>.
- [x] C-2: Your release is tagged using <a href="https://semver.org/">semantic versioning</a> where the major version is zero, the minor version is the iteration number, the patch version is incremented as usual for each change made to the minor version, and the release name matches the release tag.
- [x] C-3: You have a clear legal right to use all incorporated assets, the licenses for all third-party assets are tracked in the <code>README.md</code> file, and you have satisfied all license requirements.
- [x] C-4: The <code>README.md</code> contains instructions for how to play the game or such instructions are incorporated into the game.
- [x] C-5: The release demonstrates the core gameplay loop: the player can take actions that move them toward a goal.
- [x] B-1: The project report is complete.
- [x] B-2: The game runs without errors or warnings.
- [x] B-3: The source code and project structure comply with our adopted style guides.
- [x] B-4: Clear progress has been made on the game with respect to the project plan.
- [x] A-1: The source code contains no warnings. All warnings are properly addressed, not just ignored.
- [x] A-2: The game includes the conventional player experience loop of title, gameplay, and ending.
- [x] A-3: Earn <em>N</em>*&lceil;<em>P</em>/2&rceil; stars, where <em>N</em> is the iteration number and <em>P</em> is the number of people on the team.
- [ ] ⭐ Include a dynamic (non-static) camera
- [x] ⭐ Incorporate parallax background scrolling
- [ ] ⭐ Use paper doll animations
- [ ] ⭐ Use an <code>AnimationTree</code> with either blend spaces (3D) or an animation state machine (2D)
- [ ] ⭐ Incorporate smooth transitions between title, game, and end states, rather than jumping between states via <code>change_scene</code>
- [ ] ⭐ Support two of the following: touch input, mouse/keyboard input, and gamepad input
- [ ] ⭐ Allow the user to control the volume of music and sound effects independently.
- [ ] ⭐ Incorporate juiciness and document it in the <code>README.md</code>
- [ ] ⭐ Use particle effects
- [x] ⭐ Use different layers and masks to manage collisions and document this in the <code>README.md</code>
- [ ] ⭐ Incorporate pop into your HUD or title screen using <code>Tween</code> or <code>AnimationPlayer</code>
- [x] ⭐ Include an AI-controlled character
- [ ] ⭐ Add a pause menu that includes, at minimum, the ability to resume or return to the main menu
- [ ] ⭐ The game is released publicly on <code>itch.io</code>, with all the recommended accompanying text, screenshots, gameplay videos, <i>etc.</i>

This work therefore merits an A.