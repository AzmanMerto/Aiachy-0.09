# Server Data

## AiachyServerInfo
    - zodiacDataVersion

/-------/

## AiachyGalaxy
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

## Zodiac
    - date (String)
        - zodiac ([Int])
        - dailyComment ([String])
        - dailySpecialComment ([String])
        - compatibilityZodiacs ([Array])
            - Zodiac (Int)
            - Zodiac (Int)
        - zodiacStatus
            - overall
                - rate (Int)
                - statusComment (String)
            - love 
                - rate (Int)
                - statusComment (String)
            - businessLife 
                - rate (Int)
                - statusComment (String)
            - health 
                - rate (Int)
                - statusComment (String)
            - holiday
                - rate (Int)
                - statusComment (String)
            - diet
                - rate (Int)
                - statusComment (String)
        - ascendiant ([Array])
            - ascendiant (String)
            - dailyComment (Stirng)
/----------------------/

# Local Data

## CoreData
- ZodiacEntity
    - zodiac (Int)
    - date (Date)
    - dailyComment (String)
    - dailySpecialComment (String)
    - compatibilityZodiacs (Data)
    - zodiStatus (Data)
    
- AscendiantEntity
    - zodiac (Int)
    - date (Date)
    - dailyComment (String)

- AiachyGalaxyEntity
    - melody (Data)

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
