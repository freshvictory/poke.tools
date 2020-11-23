module Api exposing (..)
import Dict exposing (Dict)


cache : Dict String Pokemon
cache = Dict.fromList []

test =
    { bulbasaur =
        { id = 1
        , slug = "bulbasaur"
        , name = "Bulbasaur"
        , category = "Seed Pokémon"
        , description =
            [ { text = "A strange seed was planted on its back at birth.The plant sprouts and grows with this POKéMON."
              , version = "Red"
              }
            , { text = "BULBASAUR can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger."
              , version = "Emerald"
              }
            ]

        , types = [Grass, Poison]
        , images =
            { hero = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"
            }
        , evolution =[ [ "bulbasaur", "ivysaur", "venusaur"] ]
        }
    , ivysaur =
        { id = 2
        , slug = "ivysaur"
        , name = "Ivysaur"
        , category = "Seed Pokémon"
        , description =
            [ { text = "When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs."
              , version = "Red"
              }
            , { text = "To support its bulb, IVYSAUR’s legs grow sturdy. If it spends more time lying in the sunlight, the bud will soon bloom into a large flower."
              , version = "Emerald"
              }
            ]

        , types = [Grass, Poison]
        , images =
            { hero = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png"
            }
        , evolution =[ [ "bulbasaur", "ivysaur", "venusaur"] ]
        }
    , venusaur =
        { id = 3
        , slug = "venusaur"
        , name = "Venusaur"
        , category = "Seed Pokémon"
        , description =
            [ { text = "When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs."
              , version = "Red"
              }
            , { text = "To support its bulb, IVYSAUR’s legs grow sturdy. If it spends more time lying in the sunlight, the bud will soon bloom into a large flower."
              , version = "Emerald"
              }
            ]

        , types = [Grass, Poison]
        , images =
            { hero = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png"
            }
        , evolution =[ [ "bulbasaur", "ivysaur", "venusaur"] ]
        }
    , minccino =
        { id = 572
        , slug = "minccino"
        , name = "Minccino"
        , category = "Chincilla Pokémon"
        , description =
            [ { text = "Minccino greet each other by grooming one another thoroughly with their tails."
              , version = "Omega Ruby"
              }
            , { text = "They greet one another by rubbing each other with their tails, which are always kept well groomed and clean."
              , version = "Black"
              }
            ]
        , types = [Normal]
        , images =
            { hero = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/572.png"
            }
        , evolution = [ [ "minccino", "cinccino" ] ]
        }
    , cinccino =
        { id = 573
        , slug = "cinccino"
        , name = "Cinccino"
        , category = "Scarf Pokémon"
        , description =
            [ { text = "Their white fur is coated in a special oil that makes it easy for them to deflect attacks."
              , version = "Black"
              }
            , { text = "Their white fur feels amazing to touch. Their fur repels dust and prevents static electricity from building up."
              , version = "White"
              }
            ]
        , types = [Normal]
        , images =
            { hero = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/573.png"
            }
        , evolution = [ [ "minccino", "cinccino" ] ]
        }
    , ralts =
        { id = 280
        , slug = "ralts"
        , name = "Ralts"
        , category = "Feeling Pokémon"
        , description =
            [ { text = "RALTS senses the emotions of people using the horns on its head. This POKéMON rarely appears before people. But when it does, it draws closer if it senses that the person has a positive disposition."
              , version = "Black"
              }
            ]
        , types = [Psychic, Fairy]
        , images =
            { hero = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/280.png"
            }
        , evolution = [ [ "ralts", "kirlia", "gardevoir" ], [ "ralts", "kirlia", "gallade" ] ]
        }
    , kirlia =
        { id = 281
        , slug = "kirlia"
        , name = "Kirlia"
        , category = "Feeling Pokémon"
        , description =
            [ { text = "RALTS senses the emotions of people using the horns on its head. This POKéMON rarely appears before people. But when it does, it draws closer if it senses that the person has a positive disposition."
              , version = "Black"
              }
            ]
        , types = [Psychic, Fairy]
        , images =
            { hero = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/281.png"
            }
        , evolution = [ [ "ralts", "kirlia", "gardevoir" ], [ "ralts", "kirlia", "gallade" ] ]
        }
    , gardevoir =
        { id = 282
        , slug = "gardevoir"
        , name = "Gardevoir"
        , category = "Feeling Pokémon"
        , description =
            [ { text = "RALTS senses the emotions of people using the horns on its head. This POKéMON rarely appears before people. But when it does, it draws closer if it senses that the person has a positive disposition."
              , version = "Black"
              }
            ]
        , types = [Psychic, Fairy]
        , images =
            { hero = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/282.png"
            }
        , evolution = [ [ "ralts", "kirlia", "gardevoir" ], [ "ralts", "kirlia", "gallade" ] ]
        }
    , gallade =
        { id = 475
        , slug = "gallade"
        , name = "Gallade"
        , category = "Feeling Pokémon"
        , description =
            [ { text = "RALTS senses the emotions of people using the horns on its head. This POKéMON rarely appears before people. But when it does, it draws closer if it senses that the person has a positive disposition."
              , version = "Black"
              }
            ]
        , types = [Psychic, Fairy]
        , images =
            { hero = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/475.png"
            }
        , evolution = [ [ "ralts", "kirlia", "gardevoir" ], [ "ralts", "kirlia", "gallade" ] ]
        }
    }



type alias Pokemon =
    { id : Int
    , slug : String
    , name : String
    , category : String
    , description : List { text : String, version : String }
    , types : List Type
    , images : { hero: String }
    , evolution : List (List String)
    }


type Type
    = Normal
    | Fighting
    | Flying
    | Poison
    | Ground
    | Rock
    | Bug
    | Ghost
    | Steel
    | Fire
    | Water
    | Grass
    | Electric
    | Psychic
    | Ice
    | Dragon
    | Fairy
    | Dark

typeString : Type -> String
typeString t =
    case t of
        Normal -> "normal"
        Fighting -> "fighting"
        Flying -> "flying"
        Poison -> "poison"
        Ground -> "ground"
        Rock -> "rock"
        Bug -> "bug"
        Ghost -> "ghost"
        Steel -> "steel"
        Fire -> "fire"
        Water -> "water"
        Grass -> "grass"
        Electric -> "electric"
        Psychic -> "psychic"
        Ice -> "ice"
        Dragon -> "dragon"
        Fairy -> "fairy"
        Dark -> "dark"
