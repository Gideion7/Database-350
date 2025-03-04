CREATE TABLE milestone3.USER
(
  UserID SERIAL NOT NULL,
  Username VARCHAR(30) UNIQUE NOT NULL,
  FirstName VARCHAR(30) NOT NULL,
  LastName VARCHAR(30)  NOT NULL,
  Role ENUM ('ADMIN', 'USER', 'STAFF') NOT NULL,
  PRIMARY KEY (UserID)
);

CREATE TABLE milestone3.BUILDING
(
  BuildingName VARCHAR(55) NOT NULL,
  FloorNumber INT NOT NULL,
  RoomNumber INT NOT NULL,
  BuildingID SERIAL NOT NULL,
  PRIMARY KEY (BuildingID),
  UNIQUE (BuildingName)
);

CREATE TABLE milestone3.SESSION
(
  SessionID INT NOT NULL,
  TimeStamp TIMESTAMP NOT NULL,
  UserID SERIAL NOT NULL,
  PRIMARY KEY (SessionID, UserID),
  FOREIGN KEY (UserID) REFERENCES USER(UserID)
);

CREATE TABLE milestone3.Admin_Edit_Building
(
  BuildingID SERIAL NOT NULL,
  UserID SERIAL NOT NULL,
  PRIMARY KEY (BuildingID, UserID),
  FOREIGN KEY (BuildingID) REFERENCES BUILDING(BuildingID),
  FOREIGN KEY (UserID) REFERENCES USER(UserID)
);

CREATE TABLE milestone3.RESTROOM
(
  Gender CHAR(1) NOT NULL,
  CleaningTimeStamp TIMESTAMP NOT NULL,
  RestroomID SERIAL NOT NULL,
  IsPrivate BOOLEAN NOT NULL,
  BuildingID SERIAL NOT NULL,
  PRIMARY KEY (RestroomID),
  FOREIGN KEY (BuildingID) REFERENCES BUILDING(BuildingID)
);

CREATE TABLE milestone3.RATING
(
  RatingID SERIAL NOT NULL,
  Rating VARCHAR(20) NOT NULL,
  UserID SERIAL NOT NULL,
  RestroomID SERIAL NOT NULL,
  PRIMARY KEY (RatingID),
  FOREIGN KEY (UserID) REFERENCES USER(UserID),
  FOREIGN KEY (RestroomID) REFERENCES RESTROOM(RestroomID)
);

CREATE TABLE milestone3.ISSUEREPORT
(
  IssueID SERIAL NOT NULL,
  Description VARCHAR(2000) NOT NULL,
  CompletionStatus BOOLEAN NOT NULL,
  ReportTimeStamp TIMESTAMP NOT NULL,
  RestroomID SERIAL NOT NULL,
  PRIMARY KEY (IssueID),
  FOREIGN KEY (RestroomID) REFERENCES RESTROOM(RestroomID)
);

CREATE TABLE milestone3.Admin_Edit_Restroom
(
  RestroomID SERIAL NOT NULL,
  UserID SERIAL NOT NULL,
  PRIMARY KEY (RestroomID, UserID),
  FOREIGN KEY (RestroomID) REFERENCES RESTROOM(RestroomID),
  FOREIGN KEY (UserID) REFERENCES USER(UserID)
);

CREATE TABLE milestone3.Manipulate
(
  IssueID SERIAL NOT NULL,
  UserID SERIAL NOT NULL,
  PRIMARY KEY (IssueID, UserID),
  FOREIGN KEY (IssueID) REFERENCES ISSUEREPORT(IssueID),
  FOREIGN KEY (UserID) REFERENCES USER(UserID)
);

CREATE TABLE milestone3.ISSUEREPORT_IssueType
(
  IssueType SERIAL NOT NULL,
  IssueID SERIAL NOT NULL,
  PRIMARY KEY (IssueType, IssueID),
  FOREIGN KEY (IssueID) REFERENCES ISSUEREPORT(IssueID)
);