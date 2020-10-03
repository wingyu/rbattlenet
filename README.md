# RBattlenet

A Ruby gem that wraps Blizzard's Game Data and Profile APIs.

### Please note, this project is not actively maintained, but PRs are always welcome!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rbattlenet'
```

## Usage

#### Step 1. Setting your Battle.net API Key

Your private Battle.net API key must be present in order to get a valid Battle.net API response. Before any requests are made, your API key must be set like so:

```ruby
client_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
client_secret = "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"

RBattlenet.authenticate(client_id: client_id, client_secret: client_secret)
```

#### Step 2. Changing default options (Optional)

Your region and locale defaults to EU and en_GB respectively. However, these can be changed like so:

```ruby
RBattlenet.set_options(region: "us", locale: "en_US")
```

Singular requests will be returned as a `RBattlenet::Result` object. Requests with an array passed in will
be returned as a `RBattlenet::ResultCollection` object by default. If you want to simply receive the raw HTTP response
or the response as a Hash you can set that like so:

```ruby
RBattlenet.set_options(response_type: :struct) # Default
RBattlenet.set_options(response_type: :hash)
RBattlenet.set_options(response_type: :raw)
```

#### Step 3. Call the API methods to request data

```ruby
item = RBattlenet::Wow::Item.find(18803)

item.name # => "Finkle's Lava Dredger"
```

You can pass in an Array to every endpoint. Requests will be made in parallel automatically:

```ruby
collection = RBattlenet::Wow::Item.find([18803, 18804])

collection.results.map(&:name) # => ["Finkle's Lava Dredger", "Lord Grayson's Satchel"]
```

For some endpoints you can pass in fields to automatically (in parallel) retrieve resources that belong to them:

```ruby
character = RBattlenet::Wow::Character.find(realm: "stormrage", name: "sheday", fields: [:mounts, :titles])

character.name # => "Sheday"
character.titles.active_title.name # => "Famed Slayer of the Harbinger"
character.mounts.first.name # => "Black War Bear"
```

#### Step 4. Error handling

Each `RBattlenet::Result` object has a `status_code` property. When the code is not 200, the raw HTTP response is
included (`response` property) and it'll be a `RBattlenet::EmptyResult` object instead. `RBattlenet::ResultCollection`
objects can contain both `Result` and `EmptyResult` objects simultaneously. Exceptions are not raised for non-200 responses.

Client side exceptions will be raised if there are issues, for example:

```ruby
characters = RBattlenet::Wow::Character.all

# => RBattlenet::Errors::IndexNotSupported (Retrieving all entities of this endpoint is not supported)
```

## Testing
Test against the stored VCR cassettes
```ruby
bundle exec rspec spec/ # Execute all the tests
bundle exec rspec spec/lib/wow/character_spec.rb # Execute only the character_spec tests
```

If there is no VCR cassette for the test
```ruby
RECORD_CASSETTE=1 CLIENT_ID=<your_id> CLIENT_SECRET=<your_secret> bundle exec rspec
```

If you wish to test against the real API and bypass the :
```ruby
REAL_CONNECTIONS=1 CLIENT_ID=<your_id> CLIENT_SECRET=<your_secret> bundle exec rspec
```

## Documentation

Some of the most commonly used endpoints are listed here; you can find examples for every single endpoint in the `spec` files.

### [Hearthstone](#hearthstone)

* [Card](#hearthstone-card)
* [Deck](#hearthstone-deck)
* [Metadata](#hearthstone-metadata)

### [World of Warcraft](#wow)

* [Achievement](#wow-achievement)
* [Character](#wow-character)
* [Guild](#wow-guild)
* [Item](#wow-item)
* [Mount](#wow-mount)
* [Mythic Keystone Leaderboard](#wow-keystone-leaderboard)
* [Pet](#wow-pet)

### [World of Warcraft Classic](#wowclassic)

* [Creature](#wowclassic-creature)
* [Item](#wowclassic-item)

### [Starcraft 2](#sc2)

* [Profile](#sc2-profile)
* [Ladder](#sc2-ladder)

### [Diablo 3](#d3)

* [Hero](#d3-hero)
* [Item](#d3-item)

---
<a name="hearthstone"></a>
## Hearthstone
https://develop.battle.net/documentation/api-reference/hearthstone-game-data-api

<a name="hearthstone-card"></a>
### Cards

```ruby
RBattlenet::Hearthstone::Card.find("52119-arch-villain-rafaam")

Battlenet::Hearthstone::Card.find(manaCost: 1, attack: 1, health: 1)
```

---

<a name="hearthstone-deck"></a>
### Decks

```ruby
RBattlenet::Hearthstone::Deck.find("AAECAQcG+wyd8AKS+AKggAOblAPanQMMS6IE/web8wLR9QKD+wKe+wKz/AL1gAOXlAOalAOSnwMA")
```

---

<a name="hearthstone-metadata"></a>
### Metadata

```ruby
RBattlenet::Hearthstone::Metadata.all

RBattlenet::Hearthstone::Metadata.find(:sets)
```
---

<a name="wow"></a>
## World of Warcraft

<a name="wow-achievement"></a>
### Achievement

```ruby
achievement = RBattlenet::Wow::Achievement.find(2144)
```

---

<a name="wow-character"></a>
### Character

```ruby
RBattlenet::Wow::Character.find(realm: "stormrage", name: "sheday")

RBattlenet::Wow::Character.find(realm: "stormrage", name: "sheday", fields: [:achievements, :mounts])
```

Supported fields:
`achievements`, `appearance`, `equipment`, `hunter_pets`, `keystones`, `media`, `mounts`, `pets`, `pvp_summary`, `reputations`, `specializations`, `statistics`, `status`, `titles`

---

<a name="wow-guild"></a>
### Guild

```ruby
RBattlenet::Wow::Guild.find(realm: "stormrage", name: "avalerion")

RBattlenet::Wow::Guild.find(realm: "stormrage", name: "avalerion", fields: [:roster])
```

Supported fields:
`roster`, `achievements`

---

<a name="wow-item"></a>
### Item

```ruby
RBattlenet::Wow::Item.find(11081)
```

---

<a name="wow-mount"></a>
### Mount

```ruby
RBattlenet::Wow::Mount.find(304)

RBattlenet::Wow::Mount.all
```

---

<a name="wow-pet"></a>
### Pet

```ruby
RBattlenet::Wow::Pet.find(405)

RBattlenet::Wow::Pet.all
```

<a name="wow-keystone-leaderboard"></a>
### Mythic Keystone Leaderboard

```ruby
RBattlenet::Wow::MythicKeystoneLeaderboard.find(connected_realm_id: 509, dungeon_id: 244, period: 682)
```

---

<a name="wowclassic"></a>
## World of Warcraft Classic

<a name="wowclassic-creature"></a>
### Creature

```ruby
RBattlenet::Wow::Classic::Creature.find(30)
```

---

<a name="wowclassic-item"></a>
### Item

```ruby
RBattlenet::Wow::Classic::Item.find(19019)
```

---
<a name="sc2"></a>
## Starcraft 2

<a name="sc2-profile"></a>
### Profile

```ruby
RBattlenet::Sc2::Profile.find(region_id: 2, realm_id: 1, id: 2137104)

RBattlenet::Sc2::Legacy::Profile.find(region_id: 2, realm_id: 1, id: 2137104)
```

#### Ladders

```ruby
RBattlenet::Sc2::Legacy::ProfileLadders.find(region_id: 2, realm_id: 1, id: 2137104)
```

#### Match history

```ruby
RBattlenet::Sc2::Legacy::ProfileMatchHistory.find(region_id: 2, realm_id: 1, id: 2137104)
```

---

<a name="sc2-ladder"></a>
### Ladder

```ruby
RBattlenet::Sc2::Legacy::Ladder.find(region_id: 2, id: 2200)
```

---

<a name="d3"></a>
## Diablo 3

<a name="d3-hero"></a>
### Hero

```ruby
RBattlenet::D3::Hero.find(battletag: "Battle#tag", id: 104729462)
```

---

<a name="d3-item"></a>
### Item

```ruby
RBattlenet::D3::Item.find("corrupted-ashbringer-Unique_Sword_2H_104_x1")
```

---
## Contributing

1. Fork it ( https://github.com/[my-github-username]/rbattlenet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
