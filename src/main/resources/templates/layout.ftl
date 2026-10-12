<#macro layout title>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title!"Аренда квартир"}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f9; }
        nav { background-color: #333; color: #fff; padding: 10px 20px; display: flex; gap: 15px; }
        nav a { color: #fff; text-decoration: none; font-weight: bold; }
        nav a:hover { text-decoration: underline; }
        .container { padding: 20px; max-width: 1000px; margin: 0 auto; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background: #fff; box-shadow: 0 0 5px rgba(0,0,0,0.1); }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #f8f8f8; }
        .btn { padding: 5px 10px; text-decoration: none; color: #fff; border-radius: 3px; border: none; cursor: pointer; }
        .btn-primary { background-color: #007bff; }
        .btn-warning { background-color: #ffc107; color: #333; }
        .btn-danger { background-color: #dc3545; }
        .btn-success { background-color: #28a745; }
        form { display: inline; }
        h1, h2 { color: #333; }
    </style>
</head>
<body>
    <nav>
        <a href="/apartments/all">Квартиры</a>
        <a href="/lords">Арендодатели</a>
    </nav>
    <div class="container">
        <#nested>
    </div>
</body>
</html>
</#macro>