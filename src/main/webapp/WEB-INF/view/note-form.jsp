<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title><c:out value="${note.id != null ? 'Edit' : 'New'}"/> Note</title>
  <style>
    body { font-family: Arial, sans-serif; margin:20px; background:#f8f9fa; color:black; }
    .container { max-width:600px; margin:0 auto; background:white; padding:18px; border-radius:6px;}
    label { display:block; margin-top:10px; }
    input[type=text], textarea { width:100%; padding:8px; margin-top:6px; border:1px solid #ccc; border-radius:4px; }
    button { margin-top:12px; padding:8px 12px; background:#007bff; color:white; border:none; border-radius:4px; }
  </style>
</head>
<body>
  <div class="container">
    <h1><c:out value="${note.id != null ? 'Edit' : 'New'}"/> Note</h1>
    <form action="${pageContext.request.contextPath}/notes/save" method="post">
      <input type="hidden" name="id" value="${note.id}"/>
      <label for="title">Title</label>
      <input id="title" name="title" type="text" value="${note.title}" required/>
      <label for="content">Content</label>
      <textarea id="content" name="content" rows="4">${note.content}</textarea>
      <button type="submit">Save</button>
    </form>
    <p><a href="${pageContext.request.contextPath}/notes">Back to list</a></p>
  </div>
</body>
</html>
