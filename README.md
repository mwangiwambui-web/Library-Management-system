# 📚 Library Management System (LMS)

## 📝 Project Description

This project is a fully-featured **Library Management System** implemented using **MySQL**. It is designed to manage books, authors, categories, library members, staff, loans, and fines. The database schema includes proper normalization, relationships (1-1, 1-M, M-M), and constraints to ensure data integrity.

---
### Tables Included:
- `Authors`
- `Categories`
- `Books`
- `Book_Authors` (Many-to-Many relation between books and authors)
- `Members`
- `Staff`
- `Loans`
- `Fines`

---

## 🛠️ Features

- Manage books, categories, and authors
- Track member registration and activity
- Staff-managed loan transactions
- Record fines for overdue returns
- Uses normalized relational design with PK, FK, NOT NULL, and UNIQUE constraints

---

## 💾 How to Set Up and Run the Project

1. **Clone the repository**:
   ```bash
   git clone https://github.com/mwangiwambui-web/Library-Management-system.git
   cd library

---
## ERD 
https://dbdiagram.io/d/erd-png-681f8f765b2fc4582f08eea2