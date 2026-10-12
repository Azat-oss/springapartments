<#import "/layout.ftl" as l>
<@l.layout title="Список квартир">
    <h1>Квартиры</h1>
    <a href="/apartments/all/new" class="btn btn-success">Добавить квартиру</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Арендодатель</th>
                <th>Кол-во комнат</th>
                <th>Цена</th>
                <th>Адрес</th>
                <th>Описание</th>
                <th>Действия</th>
            </tr>
        </thead>
        <tbody>
            <#list apartments as apt>
            <tr>
                <td>${apt.id}</td>
                <td>${apt.landlord.name} (${apt.landlord.phone})</td>
                <td>${apt.roomCount}</td>
                <td>${apt.price} ₽</td>
                <td>${apt.address!''}</td>
                <td>${apt.description!''}</td>
                <td>
                    <a href="/apartments/all/${apt.id}/edit" class="btn btn-warning">Редактировать</a>
                    <form action="/apartments/all/${apt.id}/delete" method="post" style="display:inline">
                        <button type="submit" class="btn btn-danger" onclick="return confirm('Вы уверены?')">Удалить</button>
                    </form>
                </td>
            </tr>
            </#list>
        </tbody>
    </table>
</@l.layout>