﻿//©///////////////////////////////////////////////////////////////////////////©//
//
//  Copyright 2021-2024 BIA-Technologies Limited Liability Company
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//©///////////////////////////////////////////////////////////////////////////©//

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Тогда

#Область ОписаниеПеременных

//@skip-check object-module-export-variable
Перем Fields Экспорт; // BSLLS:ExportVariables-off

// ТаблицаЗначений - Хранит данные эмулируемого объекта
Перем Данные;

#КонецОбласти

#Область ПрограммныйИнтерфейс

// BSLLS:NumberOfParams-off
// BSLLS:NumberOfOptionalParams-off

// Добавляет запись в набор данных. Это данные, которые могут быть прочитаны через интерфейс RecordSet
// 
// Параметры:
//  Значение1 - Произвольный
//  Значение2 - Произвольный
//  Значение3 - Произвольный
//  Значение4 - Произвольный
//  Значение5 - Произвольный
//  Значение6 - Произвольный
//  Значение7 - Произвольный
//  Значение8 - Произвольный
//  Значение9 - Произвольный
//  Значение10 - Произвольный
// 
// Возвращаемое значение:
//  ОбработкаОбъект.ЮТRecordSet - Эмулятор
//@skip-check method-too-many-params
Функция Добавить(Значение1,
				 Значение2 = Неопределено,
				 Значение3 = Неопределено,
				 Значение4 = Неопределено,
				 Значение5 = Неопределено,
				 Значение6 = Неопределено,
				 Значение7 = Неопределено,
				 Значение8 = Неопределено,
				 Значение9 = Неопределено,
				 Значение10 = Неопределено) Экспорт
	
	КоличествоПараметров = 10;
	Значения = Новый Массив(КоличествоПараметров);
	Значения[0] = Значение1;
	Значения[1] = Значение2;
	Значения[2] = Значение3;
	Значения[3] = Значение4;
	Значения[4] = Значение5;
	Значения[5] = Значение6;
	Значения[6] = Значение7;
	Значения[7] = Значение8;
	Значения[8] = Значение9;
	Значения[9] = Значение10;
		
	Строка = Данные.Добавить();
	
	Для Инд = 0 По Данные.Колонки.Количество() - 1 Цикл
		Строка[Инд] = Значения[Инд];
	КонецЦикла;
	
	УстановитьФлаги();
	
	Возврат ЭтотОбъект;
	
КонецФункции
// BSLLS:NumberOfParams-on
// BSLLS:NumberOfOptionalParams-on

// Переход к первой строке набора
Процедура MoveFirst() Экспорт
	
	AbsolutePosition = 0;
	УстановитьФлаги();
	
КонецПроцедуры

// Переход к следующей строке набора
Процедура MoveNext() Экспорт
	
	AbsolutePosition = AbsolutePosition + 1;
	УстановитьФлаги();
	
КонецПроцедуры

// Закрытие набора и очистка данных
Процедура Close() Экспорт
	
	Данные = Неопределено;
	УстановитьФлаги();
	ОбновитьFields();
	
КонецПроцедуры

// Возвращает информацию о колонке набора
// 
// Параметры:
//  ИндексПоля - Число - Индекс колонки
// 
// Возвращаемое значение:
//  Структура - Fields:
// * Name - Строка - Имя колонки
// * Value - Произвольный - Значения колонки для текущей строки набора
Функция Fields(ИндексПоля) Экспорт
	
	Если Данные <> Неопределено И Данные.Количество() <> 0 Тогда
		Значение = Данные[AbsolutePosition][ИндексПоля];
	Иначе
		Значение = Неопределено;
	КонецЕсли;
	
	//@skip-check constructor-function-return-section
	Возврат Новый Структура("Name, Value", Данные.Колонки[ИндексПоля].Имя, Значение);
	
КонецФункции

// Возвращает признак, что все записи набора прочитаны
// 
// Возвращаемое значение:
//  Булево
Функция EOF() Экспорт
	
	Возврат EOF;
	
КонецФункции

// Возвращает признак, который показывает, находится ли текущее положение записи курсора перед первой записью
// 
// Возвращаемое значение:
//  Булево
Функция BOF() Экспорт
	
	Возврат BOF;
	
КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс
// Инициализирует эмулятор RecordSet. Устанавливает информацию о колонках и служебные данные. 
// Параметры:
//  Колонки - Строка - Имена колонок, разделенные запятой
// 
// Возвращаемое значение:
//  ОбработкаОбъект.ЮТRecordSet - Эмулятор
Функция Инициализировать(Знач Колонки) Экспорт
	
	Данные = Новый ТаблицаЗначений();
	
	Колонки = ЮТСтроки.РазделитьСтроку(Колонки, ",");
	
	Для Каждого Колонка Из Колонки Цикл
		Данные.Колонки.Добавить(Колонка);
	КонецЦикла;
	
	ОбновитьFields();
	MoveFirst();
	
	Возврат ЭтотОбъект;
	
КонецФункции
#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура УстановитьФлаги()
	
	EOF = Данные = Неопределено ИЛИ Данные.Количество() <= AbsolutePosition;
	BOF = Данные = Неопределено ИЛИ Данные.Количество() = 0 ИЛИ AbsolutePosition < 0;
	RecordCount = ?(Данные = Неопределено, 0, Данные.Количество());
	
КонецПроцедуры

Процедура ОбновитьFields()
	
	Количество = ?(Данные = Неопределено, 0, Данные.Колонки.Количество());
	Fields = Новый Структура("Count", Количество);
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли
