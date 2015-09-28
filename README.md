
# WIP
# RBattlenet

A Ruby wrapper for the Blizzard's Battle.net Community Platform API.
Currently RBattlenet only covers the World of Warcraft, Diablo 3 and StarCraft 2 APIs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rbattlenet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rbattlenet

## Usage

#### Step 1. Setting your Battle.net API Key

Your private Battle.net API key must be present in order to get a valid Battle.net API response. Before any requests are made, your API key must be set like so:

```ruby
api_key = "abcdefgh"

RBattlenet.authenticate(api_key)
```

#### Step 2. Setting your region and locale (Optional)

Your region and locale defaults to US and en_US respectively. However, these can be changed like so:

```ruby
RBattlenet.set_region("eu", "en_GB")
```

#### Step 3. Call the API methods to request data

```ruby
character = RBattlenet::Wow::Character.find("milhause", "saurfang")
```
<a name="overview"></a>
## Overview
### [World of Warcraft](#wow)

* [Achievement](#wow-achievement)
* [Auction](#wow-auction)
* [Battle Pet](#wow-battle-pet)
  * [Ability](#wow-battle-pet-ability)
  * [Species](#wow-battle-pet-species)
  * [Stats](#wow-battle-pet-stats)
* [Challenge](#wow-challenge)
  * [Realm Leaderboard](#wow-challenge-realm-leaderboard)
  * [Region Leaderboard](#wow-challenge-region-leaderboard)
* [Character](#wow-character)
  * [Profile](#wow-character-profile)
  * [Additional Fields](#wow-character-fields)
* [Data Resources](#wow-data)
  * [Battlegroups](#wow-data-battlegroups)
  * [Character Achievements](#wow-data-character-achievements)
  * [Character Classes](#wow-data-character-classes)
  * [Character Races](#wow-data-character-races)
  * [Guild Achievements](#wow-data-guild-achievements)
  * [Guild Perks](#wow-data-guild-perks)
  * [Guild Rewards](#wow-data-guild-rewards)
  * [Item Classes](#wow-data-item-classes)
  * [Pet Types](#wow-data-pet-types)
  * [Talents](#wow-data-talents)
* [Guild](#wow-guild)
  * [Profile](#wow-guild-profile)
  * [Profile](#wow-guild-fields)
* [Item](#wow-item)
  * [Item](#wow-item-item)
  * [Item Set](#wow-item-item-set)
* [PVP](#wow-pvp)
  * [Leaderboards](#wow-pvp-leaderboards)
* [Quest](#wow-quest)
* [Realm Status](#wow-realm-status)
* [Recipe](#wow-recipe)
* [Spell](#wow-spell)

### [Starcraft 2](#sc2)

* [Data Resources](#sc2-data)
  * [Achievements](#sc2-data-achievements)
  * [Rewards](#sc2-data-rewards)
* [Ladder](#sc2-ladder)
* [Profile](#sc2-profile)
  * [Ladders](#sc2-profile-ladders)
  * [Match History](#sc2-profile-match-history)

### [Diablo 3](#d3)

* [Data Resources](#d3-data)
  * [Artisan](#d3-data-artisan)
  * [Follower](#d3-data-follower)
  * [Item](#d3-data-item)
* [Profile](#d3-profile)
  * [Career](#d3-profile-career)
  * [Hero](#d3-profile-hero)

---

<a name="wow"></a>
## World of Warcraft

<a name="wow-achievement"></a>
### Achievement

*Parameters*

`id` the ID of the achievement.


```ruby
achievement = RBattlenet::Wow::Achievement.find("2144")
```

---


<a name="wow-auction"></a>
### Auction

*Parameters*

`realm` the realm name.


```ruby
RBattlenet::Wow::Auction.find("saurfang")
```

---

<a name="wow-battle-pet"></a>
### Battle Pet

<a name="wow-battle-pet-ability"></a>
#### Abilities

*Parameters*

`id` the ID of the battle pet ability.


```ruby
RBattlenet::Wow::Battlepet.find_abilities(640)
```

<a name="wow-battle-pet-species"></a>
#### Species

*Parameters*

`id` the ID of the battle pet species.


```ruby
RBattlenet::Wow::Battlepet.find_species(258)
```

<a name="wow-battle-pet-stats"></a>
#### Stats

*Parameters*

`id` the ID of the battle pet species.

`level` the level of the battle pet

`breedId` the breed id

`qualityId` the quality id


```ruby
RBattlenet::Wow::Battlepet.find_stats(258, 25, 5, 4)
```

---

<a name="wow-challenge"></a>
### Challenge

<a name="wow-challenge-realm-leaderboard"></a>
#### Realm Leaderboard

*Parameters*

`realm` the realm name.


```ruby
RBattlenet::Wow::Challenge.find_realm("saurfang")
```

<a name="wow-challenge-region-leaderboard"></a>
#### Region Leaderboard


```ruby
RBattlenet::Wow::Challenge.find_region
```

---

<a name="wow-character"></a>
### Character

<a name="wow-character-profile"></a>
#### Profile

Returns profile data about the character.


```ruby
RBattlenet::Wow::Character.find("milhause", "saurfang")
```

<a name="wow-character-fields"></a>
#### Additional Fields

Returns the additional data of the character. To see all possible fields visit: [https://dev.battle.net/](https://dev.battle.net)


```ruby
RBattlenet::Wow::Character.find("milhause", "saurfang", ["pet slots", "guild"])
```

<a name="wow-data"></a>
### Data Resources

<a name="wow-data-battlegroups"></a>
#### Battlegroups


```ruby
RBattlenet::Wow::DataResources.find_battlegroups
```

<a name="wow-data-character-achievements"></a>
#### Character Achievements


```ruby
RBattlenet::Wow::DataResources.find_character_achievements
```

<a name="wow-data-character-classes"></a>
#### Character Classes


```ruby
RBattlenet::Wow::DataResources.find_character_classes
```

<a name="wow-data-character-races"></a>
#### Character Races


```ruby
RBattlenet::Wow::DataResources.find_character_races
```

<a name="wow-data-guild-achievements"></a>
#### Guild Achievements


```ruby
RBattlenet::Wow::DataResources.find_guild_achievements
```

<a name="wow-data-guild-perks"></a>
#### Guild Perks


```ruby
RBattlenet::Wow::DataResources.find_guild_perks
```

<a name="wow-data-guild-rewards"></a>
#### Guild Rewards


```ruby
RBattlenet::Wow::DataResources.find_guild_rewards
```

<a name="wow-data-item-classes"></a>
#### Item Classes


```ruby
RBattlenet::Wow::DataResources.find_item_classes
```

<a name="wow-data-pet-types"></a>
#### Pet Types


```ruby
RBattlenet::Wow::DataResources.find_pet_types
```

<a name="wow-data-talents"></a>
#### Talents


```ruby
RBattlenet::Wow::DataResources.find_talents
```

---

<a name="wow-item"></a>
### Item

<a name="wow-item-item"></a>
#### Item

Returns the item data of the specified item ID.

*Parameters*

`id` the item ID.


```ruby
RBattlenet::Wow::Item.find(18803);
```

<a name="wow-item-item-set"></a>
#### Item Set

Returns the item set data of the specified set ID.

*Parameters*

`id` the item set ID.


```ruby
RBattlenet::Wow::Item.find_set(1060)
```

---

<a name="wow-guild"></a>
### Guild

<a name="wow-guild-profile"></a>
#### Profile

Returns basic data on a guild.

*Parameters*

`realm` the realm of the guild.

`name` the name of the guild.


```ruby
RBattlenet::Wow::Guild.find("razors edge", "saurfang")
```

<a name="wow-guild-fields"></a>
#### Additional data


```ruby
RBattlenet::Wow::Guild.find("razors edge", "saurfang", ["members", "news"])
```

---

<a name="wow-pvp"></a>
### PVP

<a name="wow-pvp-leaderboards"></a>
#### Leaderboards

*Parameters*

`bracket` [`2v2`, `3v3`, `5v5`, `rbg`]


```ruby
RBattlenet::Wow::Pvp.find_bracket("2v2")
```

---

<a name="wow-quest"></a>
### Quest

*Parameters*

`id` the quest ID.


```ruby
RBattlenet::Wow::Quest.find(13146)
```

---

<a name="wow-realm-status"></a>
### Realm Status


All realms

```ruby
RBattlenet::Wow::Realm.find
```

---

<a name="wow-recipe"></a>
### Recipe

*Parameters*

`id` the recipe ID.


```ruby
RBattlenet::Wow::Recipe.find(33994)
```

---

<a name="wow-spell"></a>
### Spell

*Parameters*

`id` the spell ID.


```ruby
RBattlenet::Wow::Spell.find(8056)
```

---
<a name="sc2"></a>
## Starcraft 2

<a name="sc2-profile"></a>
### Profile

*Parameters*

`id` the unique player ID.

`region` the player's region ID.

`name` the player's profile name.

```ruby
RBattlenet::Sc2::Profile.find(2137104, 1, 'skt')
```

<a name="sc2-profile-ladders"></a>
#### Ladders

Returns ladder data for the specified player.


```ruby
RBattlenet::Sc2::Profile.find_ladders(2137104, 1, 'skt')
```

<a name="sc2-profile-match-history"></a>
#### Match history

Returns match history data for the specified player.


```ruby
RBattlenet::Sc2::Profile.find_match_history(2137104, 1, 'skt')
```

---

<a name="sc2-ladder"></a>
### Ladder

*Parameters*

`id` the unique ladder ID.


```ruby
RBattlenet::Sc2::Ladder.find(2200)
```

---

<a name="sc2-data"></a>
### Data Resources

<a name="sc2-data-achievements"></a>
#### Achievements


```ruby
RBattlenet::Sc2::DataResources.find_achievements
```

<a name="sc2-data-rewards"></a>
#### Rewards


```ruby
RBattlenet::Sc2::DataResources.find_rewards
```

---

<a name="d3"></a>
## Diablo 3

<a name="d3-data"></a>
### Data Resources

<a name="d3-data-artisan"></a>
#### Artisan

*Parameters*

`artisan` the name of the artisan (eg. `blacksmith`, `jeweller`, `mystic`)

```ruby
RBattlenet::D3::DataResources.find_artisan('blacksmith')
```

<a name="d3-data-follower"></a>
#### Follower

*Parameters*

`follower` the name of the follower (eg. `templar`, `enchantress`, `scoundrel`)

```ruby
RBattlenet::D3::DataResources.find_follower('templar')
```

<a name="d3-data-item"></a>
#### Item

*Parameters*

`item` the item data string.

```ruby
data = "CrABCL-oudQGEgcIBBWZWjYNHWU61OAdyg3pEx07J28kHevi5AUd8dNq1TCLAjj_AkAAUBJYBGD_AmorCgwIABDX3bKmiICA4DESGwi5u5abChIHCAQVIpaumDCPAjgAQAFYBJABAGorCgwIABCl3rKmiICA4DESGwiR9M-gAhIHCAQVIpaumDCLAjgAQAFYBJABAIABRqUBOydvJK0Bj5DKULUBAXBvArgB9aCdsg7AAQEYsuqy0wFQAFgC"

RBattlenet::D3::DataResources.find_item(data)
```

---

<a name="d3-profile"></a>
### Profile

<a name="d3-profile-career"></a>
#### Career

*Parameters*

`tag` the player's battle tag.

```ruby
RBattlenet::D3::Profile.find_career("FaYe-2543")
```

<a name="d3-profile-hero"></a>
#### Hero

*Parameters*

`tag` the player battle tag.

`hero` the hero ID.

```ruby
RBattlenet::D3::.find_hero("FaYe-2543", 58290259)
```

---
## Contributing

1. Fork it ( https://github.com/[my-github-username]/rbattlenet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
