<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Notes</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: whitesmoke;
      padding: 20px;
    }

    .container {
      max-width: 500px;
      margin: auto;
    }

    h1 {
      text-align: center;
      margin-bottom: 20px;
    }

    .add-btn {
      display: block;
      background-color: green;
      color: white;
      padding: 10px;
      text-align: center;
      margin-bottom: 20px;
      text-decoration: none;
      border-radius: 5px;
      font-weight: bold;
    }

    /* Note card */
    .note-card {
      background-color: white;
      padding: 14px;
      margin-bottom: 12px;
      border-radius: 6px;
      border: 1px solid lightgray;
      box-shadow: 0px 1px 3px gray;
    }

    .note-title {
      font-size: 1.1em;
      font-weight: bold;
      margin-bottom: 6px;
    }

    .description {
      margin-bottom: 8px;
      color: black;
    }

    .completed-section {
      margin-bottom: 10px;
      font-size: 14px;
    }

    .completed-section input {
      transform: scale(1.2);
      margin-right: 6px;
    }

    .buttons {
      margin-top: 8px;
    }

    .edit-btn {
      background-color: blue;
      color: white;
      padding: 6px 10px;
      text-decoration: none;
      border-radius: 4px;
      margin-right: 6px;
    }

    .delete-btn {
      background-color: red;
      color: white;
      padding: 6px 10px;
      text-decoration: none;
      border-radius: 4px;
    }
  </style>
</head>

<body>

<div class="container">

  <h1>Notes</h1>

  <a class="add-btn" href="${pageContext.request.contextPath}/notes/new">+ Add Note</a>

  <c:forEach var="note" items="${notes}">
    <div class="note-card">

      <!-- Title -->
      <div class="note-title">${note.title}</div>

      <!-- Description -->
      <div class="description">${note.content}</div>

      <!-- Completed checkbox (user can tick) -->
      <div class="completed-section">
        <label>
          <input 
                type="checkbox" 
                name="completed"
                <c:if test="${note.completed}">checked</c:if>
          />
          Completed
        </label>
      </div>

      <!-- Buttons -->
      <div class="buttons">
        <a class="edit-btn" href="${pageContext.request.contextPath}/notes/edit/${note.id}">Edit</a>
        <a class="delete-btn" href="${pageContext.request.contextPath}/notes/delete/${note.id}">Delete</a>
      </div>

    </div>
  </c:forEach>

  <c:if test="${empty notes}">
    <p>No notes available — add one!</p>
  </c:if>

</div>

</body>
</html>
