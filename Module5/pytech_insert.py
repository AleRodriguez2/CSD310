""" 
    Title: pytech_insert.py
    Author: Professor Krasso
    Modified By: Alejandro Rodriguez    
    Date: 10 July 2020
    Modified on: 16 June 2023
    Description: Test program for inserting new documents 
                 into the students collection 
"""

""" import statements """
from pymongo import MongoClient

# MongoDB connection string 
url = "mongodb+srv://admin:admin@cluster1.r5vioe7.mongodb.net/pytech?retryWrites=true&w=majority"

# connect to the MongoDB cluster 
client = MongoClient(url)

# connect pytech database
db = client.pytech

""" three student documents"""
# John Redcrow's data document 
Redcrow = {
    "student_id": "1007",
    "first_name": "John",
    "last_name": "Redcrow",
    "enrollments": [
        {
            "term": "Session 2",
            "gpa": "4.0",
            "start_date": "July 10, 2020",
            "end_date": "September 14, 2020",
            "courses": [
                {
                    "course_id": "CSD310",
                    "description": "Database Development and Use",
                    "instructor": "Professor Krasso",
                    "grade": "A+"
                },
                {
                    "course_id": "CSD320",
                    "description": "Programming with Java",
                    "instructor": "Professor Krasso",
                    "grade": "A+"
                }
            ]
        }
    ]

}

# Mark Wahlburg's data document 
Wahlburg = {
    "student_id": "1008",
    "first_name": "Mark",
    "last_name": "Wahlburg",
    "enrollments": [
        {
            "term": "Session 2",
            "gpa": "3.52",
            "start_date": "July 10, 2020",
            "end_date": "September 14, 2020",
            "courses": [
                {
                    "course_id": "CSD310",
                    "description": "Database Development and Use",
                    "instructor": "Professor Krasso",
                    "grade": "B+"
                },
                {
                    "course_id": "CSD320",
                    "description": "Programming with Java",
                    "instructor": "Professor Krasso",
                    "grade": "A-"
                }
            ]
        }
    ]
}

# Mc Hammer's data document
Hammer = {
    "student_id": "1009",
    "first_name": "Mc",
    "last_name": "Hammer",
    "enrollments": [
        {
            "term": "Session 2",
            "gpa": "1.5",
            "start_date": "July 10, 2020",
            "end_date": "September 14, 2020",
            "courses": [
                {
                    "course_id": "CSD310",
                    "description": "Database Development and Use",
                    "instructor": "Professor Krasso",
                    "grade": "C"
                },
                {
                    "course_id": "CSD 320",
                    "description": "Programming with Java",
                    "instructor": "Professor Krasso",
                    "grade": "B"
                }
            ]
        }
    ]
}

# get the students collection 
students = db.students

# insert statements with output 
print("\n  -- INSERT STATEMENTS --")
redcrow_student_id = students.insert_one(Redcrow).inserted_id
print("  Inserted student record John Redcrow into the students collection with document_id " + str(redcrow_student_id))

wahlburg_student_id = students.insert_one(Wahlburg).inserted_id
print("  Inserted student record Mark Wahlburg into the students collection with document_id " + str(wahlburg_student_id))

hammer_student_id = students.insert_one(Hammer).inserted_id
print("  Inserted student record Mc Hammer into the students collection with document_id " + str(hammer_student_id))

input("\n\n  End of program, press any key to exit... ")