**REPOSITORY TEMPLATE**

***Instruction*** for the simplified repository

*1. The documentation of the ***conceptual schema*** includes the ER diagram plus the entity type and attribute type descriptions in the repository.*
*2. The documentation of the ***physical schema*** includes the detailed table descriptions in the repository.*
*This time, to follow and document different steps in the design process, we allow a lot of redundancy in the documentation. See the sample repository entries below. Note: there are just a couple of random examples of each type of repository entries.*

***ENTITY TYPE DESCRIPTIONS***

| **ENTITY TYPE** | **Description** | **Synonyms, aliases** | **Occurrence** |
|---|---|---|---|
| Brevet | A non-competitive long-distance cycling event | event, ride, sportive, randonnee | Every year ca. 20-30 brevets are organised. |
| Rider | A cyclist whose hobby is randonneuring | randonneur, cyclist | New riders emerge all the year round. Possibly 20-30 new riders each year. |
| Club | A cycling club or team. | cycling club, team, randonneur club | HH Randonneurs add new clubs from time to time and update the information, but only very rarely delete the old ones |

***ATTRIBUTE TYPE DESCRIPTIONS***

***Brevet***
| **Attribute type** | **Description** | **Data type** | **Value required** | **Identity attribute or part of it** | **Special domain** |
|---|---|---|---|---|---|
| brevet name | Unique name of the brevet | Text | Yes | Yes | - |
| distance | The distance in kilometres to be cycled when completing the brevet | Integer | Yes | - | 200, 300, 400, 600, 1000, 1200 |
| brevet date | The date when the brevet takes place | Date | Yes | - | - |
| location | The location where the brevet starts | Text | Yes | - | - |
| climbing | The total (in meters) to be climbed when completing the brevet. | Integer | Yes | - | 0 - 99999 (meters) |

***Club***
| **Attribute type** | **Description** | **Data type** | **Value required** | **Identity attribute or part of it** | **Special domain** |
|---|---|---|---|---|---|
| club name | The name of the club | Text | Yes | Yes | - |
| city | The home place of the club | Text | Yes | - | - |
| email | The club's contact email | Text | No | - | valid email format |

***TABLE DESCRIPTIONS***

***Brevet***
| **Column** | **Description** | **Data type** | **Value required** | **Keys** | **Special domain** |
|---|---|---|---|---|---|
| brevetId | Unique brevet identifier | INTEGER | Yes | PRIMARY KEY (surrogate key) | Autonumber column |
| brevetName | Unique name of the brevet | VARCHAR(50) | Yes | ALTERNATE KEY (UNIQUE) | - |
| distance | The distance in kilometres to be cycled when completing the brevet | INTEGER | Yes | - | 200, 300, 400, 600, 1000, 1200 |
| brevetDate | The date when the brevet takes place | DATE | Yes | - | - |
| brevetTime | The time when the brevet starts | TIME | Yes | - | - |
| location | The location where the brevet starts | VARCHAR(50) | Yes | - | - |
| climbing | The total (in meters) to be climbed when completing the brevet. | INTEGER | Yes | - | 0 - 99999 |

***Brevet_Rider***
| **Column** | **Description** | **Data type** | **Value required** | **Keys** | **Special domain** |
|---|---|---|---|---|---|
| riderId | Unique rider identifier | INTEGER | Yes | IN PRIMARY KEY FOREIGN KEY 1 => Rider | - |
| brevetId | Unique brevet identifier | INTEGER | Yes | IN PRIMARY KEY FOREIGN KEY 2 => Brevet | - |
| isCompleted | Brevet completion status 'N' = registered only 'Y' = brevet completed | CHAR(1) | Yes | - | 'N', 'Y' |
| finishingTime | The rider's finishing time | CHAR(5) | Yes | - | Valid time format: hh:mm |