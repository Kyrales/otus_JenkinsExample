﻿#Область ПрограммныйИнтерфейс

Процедура ИсполняемыеСценарии() Экспорт
    
    ЮТТесты.ДобавитьТестовыйНабор("API ОписанияТоваров: Получить товар по артикулу")
		.ДобавитьТест("ПолучитьОписаниеТоваровПоАртикулуПозитив", "Получение описания товаров: получение по артикулу Bos0009","Позитив") 
		.ДобавитьТест("ПолучитьОписаниеТоваровПоАртикулуНегатив", "Получение описания товаров: с некорректным артикулом","Негатив") 
		.ДобавитьТест("ПолучитьОписаниеТоваровПоАртикулуПозитивСоздание", "Получение описания товаров: получение по новому сгенерированному товару","Позитив").ВТранзакции()
		;

КонецПроцедуры

Процедура ПолучитьОписаниеТоваровПоАртикулуПозитив() Экспорт
	
	Артикул = "Bos0009";
	
    Товар = API_ОписанияТоваров.ПолучитьТоварПоАртикулу(Артикул);
	
	ЮТест.ОжидаетЧто(Товар)
		.ИмеетТип("СправочникОбъект.Товары")
		.Свойство("Артикул").Равно(Артикул)
		.Свойство("Наименование").Равно("Босоножки")
		;

КонецПроцедуры

Процедура ПолучитьОписаниеТоваровПоАртикулуНегатив() Экспорт
	
	Артикул = "11111111222222222222";
	
    Товар = API_ОписанияТоваров.ПолучитьТоварПоАртикулу(Артикул);
	
	ЮТест.ОжидаетЧто(Товар)
		.ИмеетТип("Неопределено")
		;

КонецПроцедуры

Процедура ПолучитьОписаниеТоваровПоАртикулуПозитивСоздание() Экспорт
	
	// Описание программного создания: https://bia-technologies.github.io/yaxunit/docs/features/test-data/data-generation/
	
	Артикул = "Test1234";
	Наименование = "Test_Хлеб";
	
	// Создание товара
	КонструкторТовара = ЮТест.Данные().КонструкторОбъекта("Справочники.Товары")
		.ФикцияОбязательныхПолей()
		.Установить("Артикул", Артикул) // проверочный артикул
		.Установить("Наименование", Наименование) // проверочное наименование
		
		.ФикцияРеквизитов("Поставщик, Вид, Штрихкод, Описание");
		
	НовыйТовар = КонструкторТовара.Записать();
	
    Товар = API_ОписанияТоваров.ПолучитьТоварПоАртикулу(Артикул);
	
	ЮТест.ОжидаетЧто(Товар)
		.ИмеетТип("СправочникОбъект.Товары")
		.Свойство("Артикул").Равно(Артикул)
		.Свойство("Наименование").Равно(Наименование)
		;

КонецПроцедуры

#КонецОбласти
