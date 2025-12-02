## Notes:


A simple Notes application built using Spring Boot, Spring MVC, JPA, and JSP.
This project supports creating, updating, viewing, and deleting notes.
## Features:
- Add a new Note
- Edit/Update a Note
- Delete a Note
- View all Notes
- Clean and simple UI
- MVC architecture (Controller → Service → Repository → View).

## Technologies Used:
- Java
- Spring Boot
- Spring MVC
- Spring Data JPA
- Hibernate
- JSP / HTML / CSS
- MySQL
## How to Run?
### Clone the repository
``` bash
git clone https://github.com/VArchana456/Notes.git
cd Notes
```

## Build the project

``` bash
mvn clean install
```

## Run the application
```bash
mvn spring-boot:run
```
## Database Configuration:
``` bash
spring.datasource.url=jdbc:mysql://localhost:3306/notesdb
spring.datasource.username=root
spring.datasource.password=yourpassword
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
```
## Project Structure
``` bash
src/
 ├── main/
 │    ├── java/com/codegnan/
 │    │       ├── Controller
 │    │       ├── Service
 │    │       ├── Repository
 │    │       └── Model
 │    └── resources/
 │         ├── application.properties
 │         └── webapp/ (JSPs)
```
## How to Use:
 1.Start the application:
``` bash
http://localhost:8080/notes
```
2.Add, edit, delete, and view notes from the UI

