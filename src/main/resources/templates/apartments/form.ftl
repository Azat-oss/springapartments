<#import "/layout.ftl" as l>
<#if apartment.id??>
    <#assign page_title="Редактирование квартиры">
<#else>
    <#assign page_title="Новая квартира">
</#if>

<@l.layout title=page_title>
    <h1>${page_title}</h1>

    <form action="<#if apartment.id??>/apartments/all/${apartment.id}<#else>/apartments/all</#if>" method="post">

        <div>
            <label>Арендодатель:</label>
            <select name="landlord.id" required>
                <option value="">-- Выберите арендодателя --</option>
                <#list landlords as lord>
                    <option value="${lord.id}" <#if apartment.landlord?? && apartment.landlord.id == lord.id>selected</#if>>
                        ${lord.name} (${lord.phone})
                    </option>
                </#list>
            </select>
        </div>
        <br>

        <div>
            <label>Количество комнат:</label>
            <input type="number" name="roomCount" value="${apartment.roomCount!''}" required>
        </div>
        <br>

        <div>
            <label>Цена (₽):</label>
            <input type="number" name="price" value="${apartment.price!''}" required>
        </div>
        <br>

        <div>
            <label>Адрес:</label>
            <input type="text" name="address" value="${apartment.address!''}">
        </div>
        <br>

        <div>
            <label>Описание:</label>
            <textarea name="description" rows="4" cols="50">${apartment.description!''}</textarea>
        </div>
        <br>

        <button type="submit" class="btn btn-success">Сохранить</button>
        <a href="/apartments/all" class="btn btn-primary">Отмена</a>
    </form>
</@l.layout>