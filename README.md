# RBattlenet
[![Code Climate](https://codeclimate.com/github/wingyu/rbattlenet/badges/gpa.svg)](https://codeclimate.com/github/wingyu/rbattlenet)

A Ruby gem that wraps Blizzard's Battle.net Community Platform API.
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

RBattlenet.authenticate(api_key: api_key)
```

#### Step 2. Setting your region and locale (Optional)

Your region and locale defaults to US and en_US respectively. However, these can be changed like so:

```ruby
RBattlenet.set_region(region: "eu", locale: "en_GB")
```

#### Step 3. Call the API methods to request data

```ruby
character = RBattlenet::Wow::Character.find(name: "milhause", realm: "saurfang")
#character["name"] will give you "Milhause"
```
## Documentation
### [World of Warcraft](#wow)

* [Achievement](#wow-achievement)
* [Auction](#wow-auction)
* [Battle Pet](#wow-battle-pet)
* [Challenge](#wow-challenge)
* [Character](#wow-character)
* [Data Resources](#wow-data)
* [Guild](#wow-guild)
* [Item](#wow-item)
* [PVP](#wow-pvp)
* [Quest](#wow-quest)
* [Realm Status](#wow-realm-status)
* [Recipe](#wow-recipe)
* [Spell](#wow-spell)

### [Starcraft 2](#sc2)

* [Data Resources](#sc2-data)
* [Ladder](#sc2-ladder)
* [Profile](#sc2-profile)

### [Diablo 3](#d3)

* [Data Resources](#d3-data)
* [Profile](#d3-profile)

---

<a name="wow"></a>
## World of Warcraft

<a name="wow-achievement"></a>
### Achievement

```ruby
achievement = RBattlenet::Wow::Achievement.find(id: 2144)
```

---


<a name="wow-auction"></a>
### Auction

```ruby
RBattlenet::Wow::Auction.find(realm: "saurfang")
```

---

<a name="wow-battle-pet"></a>
### Battle Pet

#### Abilities

```ruby
RBattlenet::Wow::Battlepet.find_abilities(id: 640)
```

#### Species

```ruby
RBattlenet::Wow::Battlepet.find_species(species_id: 258)
```

#### Stats

```ruby
RBattlenet::Wow::Battlepet.find_stats(species_id: 258,
  level: 25,
  breed_id: 5,
  quality_id: 4)
```

---

<a name="wow-challenge"></a>
### Challenge

#### Realm Leaderboard

```ruby
RBattlenet::Wow::Challenge.find_realm(realm: "saurfang")
```

#### Region Leaderboard


```ruby
RBattlenet::Wow::Challenge.find_region
```

---

<a name="wow-character"></a>
### Character

#### Profile


```ruby
RBattlenet::Wow::Character.find(name: "milhause", realm: "saurfang")
```

#### Additional Fields

To see all possible fields visit: [https://dev.battle.net/](https://dev.battle.net)


```ruby
RBattlenet::Wow::Character.find(name: "milhause",
  realm: "saurfang",
  fields: ["pet slots", "guild"])
```
---

<a name="wow-data"></a>
### Data Resources

#### Battlegroups


```ruby
RBattlenet::Wow::DataResources.find_battlegroups
```

#### Character Achievements


```ruby
RBattlenet::Wow::DataResources.find_character_achievements
```

#### Character Classes


```ruby
RBattlenet::Wow::DataResources.find_character_classes
```

#### Character Races


```ruby
RBattlenet::Wow::DataResources.find_character_races
```

#### Guild Achievements


```ruby
RBattlenet::Wow::DataResources.find_guild_achievements
```

#### Guild Perks


```ruby
RBattlenet::Wow::DataResources.find_guild_perks
```

<a name="wow-data-guild-rewards"></a>
#### Guild Rewards


```ruby
RBattlenet::Wow::DataResources.find_guild_rewards
```

#### Item Classes


```ruby
RBattlenet::Wow::DataResources.find_item_classes
```

#### Pet Types


```ruby
RBattlenet::Wow::DataResources.find_pet_types
```

#### Talents


```ruby
RBattlenet::Wow::DataResources.find_talents
```

---

<a name="wow-item"></a>
### Item

#### Item

```ruby
RBattlenet::Wow::Item.find(id: 18803);
```

#### Item Set


```ruby
RBattlenet::Wow::Item.find_set(id: 1060)
```

---

<a name="wow-guild"></a>
### Guild

#### Profile

```ruby
RBattlenet::Wow::Guild.find(name: "razors edge", realm:"saurfang")
```

#### Additional data


```ruby
RBattlenet::Wow::Guild.find(name: "razors edge",
  realm: "saurfang",
  fields: ["members", "news"])
```

---

<a name="wow-pvp"></a>
### PVP

#### Leaderboards

```ruby
RBattlenet::Wow::Pvp.find_bracket(bracket: "2v2")
```

---

<a name="wow-quest"></a>
### Quest

```ruby
RBattlenet::Wow::Quest.find(id: 13146)
```

---

<a name="wow-realm-status"></a>
### Realm Status

```ruby
RBattlenet::Wow::Realm.find
```

---

<a name="wow-recipe"></a>
### Recipe

```ruby
RBattlenet::Wow::Recipe.find(id: 33994)
```

---

<a name="wow-spell"></a>
### Spell

```ruby
RBattlenet::Wow::Spell.find(id: 8056)
```

---
<a name="sc2"></a>
## Starcraft 2

<a name="sc2-profile"></a>
### Profile

```ruby
RBattlenet::Sc2::Profile.find(id: 2137104, region: 1, name: 'skt')
```

#### Ladders

```ruby
RBattlenet::Sc2::Profile.find_ladders(id: 2137104, region: 1, name: 'skt')
```

#### Match history


```ruby
RBattlenet::Sc2::Profile.find_match_history(id: 2137104, region: 1, name: 'skt')
```

---

<a name="sc2-ladder"></a>
### Ladder

```ruby
RBattlenet::Sc2::Ladder.find(id: 2200)
```

---

<a name="sc2-data"></a>
### Data Resources

#### Achievements


```ruby
RBattlenet::Sc2::DataResources.find_achievements
```

#### Rewards


```ruby
RBattlenet::Sc2::DataResources.find_rewards
```

---

<a name="d3"></a>
## Diablo 3

<a name="d3-data"></a>
### Data Resources

#### Artisan

```ruby
RBattlenet::D3::DataResources.find_artisan(artisan: 'blacksmith')
```

#### Follower

```ruby
RBattlenet::D3::DataResources.find_follower(follower: 'templar')
```

#### Item

```ruby
data = "CrABCL-oudQGEgcIBBWZWjYNHWU61OAdyg3pEx07J28kHevi5AUd8dNq1TCLAjj_AkAAUBJYBGD_AmorCgwIABDX3bKmiICA4DESGwi5u5abChIHCAQVIpaumDCPAjgAQAFYBJABAGorCgwIABCl3rKmiICA4DESGwiR9M-gAhIHCAQVIpaumDCLAjgAQAFYBJABAIABRqUBOydvJK0Bj5DKULUBAXBvArgB9aCdsg7AAQEYsuqy0wFQAFgC"

RBattlenet::D3::DataResources.find_item(data: data)
```

---

<a name="d3-profile"></a>
### Profile

#### Career

```ruby
RBattlenet::D3::Profile.find_career(battletag: "FaYe-2543")
```

#### Hero

```ruby
RBattlenet::D3::.find_hero(battletag: "FaYe-2543", id: 58290259)
```

---
## Contributing

1. Fork it ( https://github.com/[my-github-username]/rbattlenet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
