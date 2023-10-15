# DataFlows

## Executive

### aiachyInfo 
    - aiachyInfo (String)
    - isAiachyReady (Bool)

### aiachyDataInfo
    - zodiacDataVersion (String)
    - tuneDataVersion (String)

/-------/

# Galaxy

## tune
    - Data (Data)

/-------/

## User
    - userLoginInfo
        - email (String)
        - password (String)
        - number
            - countryCode (Int)
            - phoneNumber (Int)
        - verification (Bool)
    - userInfo
        - id (Int)
        - fullname
            - firstName (String)
            - lastName (String)
        - birthDay
            - year (Int)
            - month (Int)
            - day (Int)
            - clock 
                - hour (Int)
                - minute (Int)
        - location
            - cordinates 
                - longitude (Double)
                - latitude (Double)
            - country (String)
            - province (String)
            - district (String)
    - userZodiac
        - zodiac (Int)
        - ascendant (Int)
    - userSubscription
        - isSubscriped (Bool)
        - subscipedMethod (Int)
        - subscripedType (Int)
    - aiachyInfo
        - version
        - zodiacDataVersion
        - theme
    - aiachyLove
        -
    - aiachyMystic
        -
    - aiachyGalaxy
        -
    - deviceInfo
        - phoneWidth (Double)
        - phoneHeight (Double)
        - phoneModel (String)
        - phoneSystem (String)
        - phoneVersion (String)
    - userCompletion
        -

/-------/

# Zodiac

- SerialNumber: Date + Version + Zodiac 
- Example: 20000101 001 01 -> 2000010100101

- Date - 2000 01 01
- Version - 001  
- Zodiac - 01

- Zodiac DocumantCode 2000010100101 

## Zodiac
    - serialNumber (Int)
    - date (String)
    - zodiac ([Int])
    - dailyComment ([String])
    - dailySpecialComment ([String])
    - zodiacDataVersion (String)
    
- Ascendiant DocumantCode 2000010100101 + (determinedZodiac)

## ascendiant
    - serialNumber (Int)
    - determinedZodiac (Int)
    - comment (Stirng)

- Compatibility DocumantCode 2000010100101 + (0 or 1)

## Compatibility
    - serialNumber (Int)
    - Zodiac (Int)

- Status DocumantCode 2000010100101 + (tier)

## Status
    - serialNumber (Int)
    - serialNumber: (String)        
    - tier: (Int)
    - rate: (Double)
    - comment: (String)
/----------------------/

# Local Data

## CoreData (Zodiac)
- ZodiacEntity
    - comment (String)
    - date (String)
    - serialNumber (Int16)
    - zodiac (Int16)
    - zodiacDataVersion (String)
    
- AscendiantEntity
    - zodiac (Int16)
    - determinedZodiac (Int16)
    - dailyComment (String)

- StatusEntity
    - comment (String)
    - rate (Double)
    - serialNumber (Int16)
    - tier (Int16)
    
- CompatibilityEntity
    - serialNumber (Int16)
    - zodiac (Int16) 
    
## CoreData (Galaxy)

- TuneEntity
    - determinedZodiac (Int16)
    - duration (Int16)
    - isPremium (Bool)
    - name (String)
    - statement (String)
    - tuneDataVersion (String)
    - tuneId (String)
    - url (String)
/----------------------/

# DATA TYPE

## Zodiac with numbered names

AriesZodiac = 0
TaurusZodiac = 1
GeminiZodiac = 2
CancerZodiac = 3
LeoZodiac = 4
VirgoZodiac = 5
LibraZodiac = 6
ScorpioZodiac = 7
SagittariusZodiac = 8
CapricornZodiac = 9
AquariusZodiac = 10
PiscesZodiac = 11

## Status with tier number

UniverseStatus - Tier 0
EnlightenmentStatus - Tier 1
TouchStatus - Tier 2
LoveStatus - Tier 3
StrengthStatus - Tier 4
CreativeStatus - Tier 5
FoundationStatus - Tier 6

/----------------------/

# EXAMPLE DATA

{
  "date": "2000.01.01",
  "zodiac": 1,
  "serialNumber": 2023010100101,
  "comment": "Comment",
  "zodiacDataVersion": "0.0.1",
  "ascendiant": {
    "serialNumber": 2023010100101,
    "comment": "Ascendiant Comment"
  },
  "compatibility": [
    {
      "serialNumber": 2023010100101,
      "zodiac": 0
    }
  ],
  "status": [
    {
      "serialNumber": 2023010100101,
      "tier": 0,
      "rate": 0.3,
      "comment": "Status Comment"
    }
  ]
}
