<%--
  Created by IntelliJ IDEA.
  User: Maiccol
  Date: 10/5/2025
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%
    @SuppressWarnings("unchecked")
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Usuario</title>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/estilos.css"/>
</head>
<body>
<h3>Formulario de Usuario</h3>

<form action="<%= request.getContextPath() %>/registro" method="post">

    <!-- Usuario -->
    <div class="form-group">
        <label for="username">Usuario:</label>
        <input type="text" name="username" id="username"
               value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>" />
        <% if (errores != null && errores.containsKey("username")) { %>
        <div style="color:red;"class="error-message"><%= errores.get("username") %></div>
        <% } %>
    </div>

    <!-- Contraseña -->
    <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" />
        <% if (errores != null && errores.containsKey("password")) { %>
        <div style="color:red;"class="error-message"><%= errores.get("password") %></div>
        <% } %>
    </div>

    <!-- Email -->
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" name="email" id="email"
               value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" />
        <% if (errores != null && errores.containsKey("email")) { %>
        <div style="color:red;"class="error-message"><%= errores.get("email") %></div>
        <% } %>
    </div>

    <!-- País -->
    <div class="form-group">
        <label for="pais">País:</label>
        <select name="pais" id="pais">
            <option value="">----- Seleccionar -----</option>
            <option value="ES" <%= "ES".equals(request.getParameter("pais"))?"selected":"" %>>España</option>
            <option value="EC" <%= "EC".equals(request.getParameter("pais"))?"selected":"" %>>Ecuador</option>
            <option value="PE" <%= "PE".equals(request.getParameter("pais"))?"selected":"" %>>Perú</option>
            <option value="CO" <%= "CO".equals(request.getParameter("pais"))?"selected":"" %>>Colombia</option>
            <option value="BR" <%= "BR".equals(request.getParameter("pais"))?"selected":"" %>>Brasil</option>
            <option value="AR" <%= "AR".equals(request.getParameter("pais"))?"selected":"" %>>Argentina</option>
            <option value="VE" <%= "VE".equals(request.getParameter("pais"))?"selected":"" %>>Venezuela</option>
        </select>
        <% if (errores != null && errores.containsKey("pais")) { %>
        <div style="color:red;"class="error-message"><%= errores.get("pais") %></div>
        <% } %>
    </div>

    <!-- Lenguajes -->
    <div class="form-group">
        <label for="lenguajes">Lenguajes:</label>
        <select name="lenguajes" id="lenguajes">
            <option value="">-- Seleccionar --</option>
            <option value="Java" <%= "Java".equals(request.getParameter("lenguajes"))?"selected":"" %>>Java</option>
            <option value="Python" <%= "Python".equals(request.getParameter("lenguajes"))?"selected":"" %>>Python</option>
            <option value="C#" <%= "C#".equals(request.getParameter("lenguajes"))?"selected":"" %>>C#</option>
            <option value="C++" <%= "C++".equals(request.getParameter("lenguajes"))?"selected":"" %>>C++</option>
            <option value="Angular" <%= "Angular".equals(request.getParameter("lenguajes"))?"selected":"" %>>Angular</option>
        </select>
        <% if (errores != null && errores.containsKey("lenguajes")) { %>
        <div style="color:red;"class="error-message"><%= errores.get("lenguajes") %></div>
        <% } %>
    </div>

    <!-- Roles -->
    <div class="form-group roles">
        <label>Roles:</label>
        <label><input type="checkbox" name="roles" value="ROLE_ADMIN"
                <%= request.getParameterValues("roles")!=null && java.util.Arrays.asList(request.getParameterValues("roles")).contains("ROLE_ADMIN") ? "checked" : "" %> /> Administrador</label>
        <label><input type="checkbox" name="roles" value="ROLE_USER"
                <%= request.getParameterValues("roles")!=null && java.util.Arrays.asList(request.getParameterValues("roles")).contains("ROLE_USER") ? "checked" : "" %> /> Usuario</label>
        <label><input type="checkbox" name="roles" value="ROLE_MODERADOR"
                <%= request.getParameterValues("roles")!=null && java.util.Arrays.asList(request.getParameterValues("roles")).contains("ROLE_MODERADOR") ? "checked" : "" %> /> Moderador</label>
    </div>

    <!-- Idiomas -->
    <div class="form-group idiomas">
        <label>Idiomas:</label>
        <label><input type="radio" name="idioma" value="es" <%= "es".equals(request.getParameter("idioma"))?"checked":"" %> /> Español</label>
        <label><input type="radio" name="idioma" value="en" <%= "en".equals(request.getParameter("idioma"))?"checked":"" %> /> Inglés</label>
        <label><input type="radio" name="idioma" value="ru" <%= "ru".equals(request.getParameter("idioma"))?"checked":"" %> /> Ruso</label>
    </div>

    <!-- Habilitar -->
    <div class="form-group">
        <label><input type="checkbox" name="habilitar" id="habilitar"
                <%= request.getParameter("habilitar") != null ? "checked" : "" %> /> Habilitar</label>
    </div>

    <!-- Campo oculto -->
    <input type="hidden" name="secreto" value="123456" />

    <!-- Botón -->
    <div class="form-group submit">
        <button type="submit">Enviar</button>
    </div>
</form>
</body>
</html>
