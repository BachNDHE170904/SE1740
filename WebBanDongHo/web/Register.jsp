<html>
    <head>
        <title>Login page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form name="input" action="RegisterServlet" method="post">
            <table>
                <tr>
                    <td>User:</td><td><input type="text" name="user"/></td>
                </tr>
                <tr>
                    <td>Password:</td><td><input type="password" name="pass"/></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" value="Login"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>