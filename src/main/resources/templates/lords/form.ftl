<#import "/layout.ftl" as l>
<@l.layout (landlord.id??)?then("Редактирование арендодателя", "Новый арендодатель")>
    <h1><#if landlord.id??>Редактирование арендодателя<#else>Новый арендодатель</#if></h1>

    <form action="<#if landlord.id??>/lords/${landlord.id}<#else>/lords</#if>" method="post">
        <div>
            <label>Имя:</label>
            <input type="text" name="name" value="${landlord.name!''}" required>
        </div>
        <br>
        <div>
            <label>Телефон:</label>
            <input type="text" name="phone" value="${landlord.phone!''}" required>
        </div>
        <br>
        <button type="submit" class="btn btn-success">Сохранить</button>
        <a href="/lords" class="btn btn-primary">Отмена</a>
    </form>
</@l.layout>