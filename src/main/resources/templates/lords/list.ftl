<#import "/layout.ftl" as l>
<@l.layout "Список арендодателей">
    <h1>Арендодатели</h1>
    <a href="/lords/new" class="btn btn-success">Добавить арендодателя</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Имя</th>
                <th>Телефон</th>
                <th>Действия</th>
            </tr>
        </thead>
        <tbody>
            <#list landlords as landlord>
            <tr>
                <td>${landlord.id}</td>
                <td>${landlord.name}</td>
                <td>${landlord.phone}</td>
                <td>
                    <a href="/lords/${landlord.id}/edit" class="btn btn-warning">Редактировать</a>
                    <form action="/lords/${landlord.id}/delete" method="post" style="display:inline">
                        <button type="submit" class="btn btn-danger" onclick="return confirm('Вы уверены?')">Удалить</button>
                    </form>
                </td>
            </tr>
            </#list>
        </tbody>
    </table>
</@l.layout>