DROP TABLE IF EXISTS StudentExercise;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Instructor;
DROP TABLE IF EXISTS Exercise;
DROP TABLE IF EXISTS Cohort;

CREATE TABLE Exercise (
	Id INT Not Null PRIMARY KEY IDENTITY,
	[Name] VARCHAR(30) Not Null, 
	[Language] VARCHAR(30) Not Null
	
);
CREATE TABLE Cohort (
	Id INT Not Null PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50) Not Null
);
CREATE TABLE Student (
	Id INT Not Null PRIMARY KEY IDENTITY, 
	FirstName VARCHAR(50) Not Null, 
	LastName VARCHAR(50) Not Null, 
	SlackHandle VARCHAR(50) Not Null,
	CohortId INT Not Null,
	CONSTRAINT FK_StudentCohort FOREIGN KEY(CohortId) REFERENCES Cohort(Id)
);
CREATE TABLE StudentExercise (
	Id INT Not Null PRIMARY KEY IDENTITY,
	StudentId INT Not Null,
	ExerciseId INT Not Null, 
	CONSTRAINT FK_Student FOREIGN KEY(StudentId) REFERENCES Student(Id),
	CONSTRAINT FK_Exercise FOREIGN KEY(ExerciseId) REFERENCES Exercise(Id) ON DELETE CASCADE
);
CREATE TABLE Instructor (
	Id Int Not Null PRIMARY KEY IDENTITY,
	FirstName VARCHAR(50) Not Null, 
	LastName VARCHAR(50) Not Null, 
	SlackHandle VARCHAR(50) Not Null, 
	CohortId INT Not Null,
	CONSTRAINT FK_InstructorCohort FOREIGN KEY(CohortId) REFERENCES Cohort(Id)
);


INSERT INTO Cohort ([Name])
VALUES ('Cohort 28');
INSERT INTO Cohort ([Name])
VALUES ('Cohort 29');
INSERT INTO Cohort ([Name])
VALUES ('Cohort 30');

INSERT INTO Student ([FirstName],[LastName],[SlackHandle], [CohortId])
VALUES ('Hunter', 'Metts', '@endlessSummerHD', 2);
INSERT INTO Student (FirstName,LastName,SlackHandle, CohortId)
VALUES ('Robby', 'Hect', '@music4life', 1);
INSERT INTO Student (FirstName,LastName,SlackHandle, CohortId)
VALUES ('Megan', 'Cruzen', '@supergirl99', 3);
INSERT INTO Student (FirstName,LastName,SlackHandle, CohortId)
VALUES ('Jordan', 'Rosas', '@polyglotcello', 1);
INSERT INTO Student (FirstName,LastName,SlackHandle, CohortId)
VALUES ('Brittany', 'Ramos-Janeway', '@itsbrittanyb', 2);
INSERT INTO Student (FirstName,LastName,SlackHandle, CohortId)
VALUES ('Cole', 'Bryant', '@theonlycoleslaw', 3);
INSERT INTO Student (FirstName,LastName, SlackHandle, CohortId)
VALUES ('Nick', 'Hansen', '@gummybearking', 1);

INSERT INTO Instructor (FirstName, LastName, SlackHandle, CohortId)
VALUES ('Jisie', 'David', '@therealjisie', 3);
INSERT INTO Instructor (FirstName, LastName, SlackHandle, CohortId)
VALUES ('Leah', 'Gwin', '@leahgwin22', 3);
INSERT INTO Instructor (FirstName, LastName, SlackHandle, CohortId)
VALUES ('Andy', 'Collins', '@askingalot', 2);
INSERT INTO Instructor (FirstName, LastName, SlackHandle, CohortId)
VALUES ('Steve', 'Brownlee', '@steviebrown', 1);

INSERT INTO Exercise([Name], [Language])
VALUES ('Planets Exercise', 'C#' );
INSERT INTO Exercise([Name], [Language])
VALUES ('CarLot Exercise', 'React' );
INSERT INTO Exercise([Name], [Language])
VALUES ('Daily Journal Exercise', 'JavaScript' );
INSERT INTO Exercise([Name], [Language])
VALUES ('Departments Exercise', 'SQL' );

INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (1, 1);
INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (1, 2);

INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (2, 2);
INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (2, 3);

INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (3, 3);
INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (3, 5);

INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (4, 5);
INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (4, 1);

INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (5, 1);
INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (5, 2);

INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (6, 2);
INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (6, 3);

INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (7, 3);
INSERT INTO StudentExercise(StudentId, ExerciseId)
VALUES (7, 5);

SELECT * FROM Student
SELECT * FROM Exercise
SELECT * FROM StudentExercise

INSERT INTO StudentExercise(StudentId, ExerciseId)
Values(4, 2);

SELECT se.Id as StudentExerciseId, StudentId, ExerciseId, s.FirstName, s.LastName, s.SlackHandle, s.CohortId,
e.Name as ExerciseName, e.Language
FROM StudentExercise  as se
 LEFT JOIN Student as s ON se.StudentId = s.Id
 JOIN Exercise as e  ON se.ExerciseId = e.Id;

 SELECT * FROM Student as s
 LEFT JOIN StudentExercise as se ON s.Id = se.StudentId
 LEFT JOIN Exercise as e ON se.ExerciseId = e.Id

 SELECT * FROM Exercise; 
 DELETE FROM Exercise WHERE Id=1;

