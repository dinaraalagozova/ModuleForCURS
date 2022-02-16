//
//  Model.swift
//  ModuleForCURS
//
//  Created by Dinara Alagozova on 16.02.2022.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let IUPSid, Title, DocumentURL, AcademicYearId: String?
    let AcademicYear: String?
    let Semesters: [Semester]
}

// MARK: - Semester
struct Semester: Codable {
    let Number: String?
    let Disciplines: [Discipline]
}

// MARK: - Discipline
struct Discipline: Codable {
    let DisciplineId: String?
    let DisciplineName: DisciplineName
    let Lesson: [Lesson]
}

// MARK: - DisciplineName
struct DisciplineName: Codable {
    let nameKk, nameRu, nameEn: String?
}

// MARK: - Lesson
struct Lesson: Codable {
    let LessonTypeId, Hours: String?
    let RealHours: String?
}
