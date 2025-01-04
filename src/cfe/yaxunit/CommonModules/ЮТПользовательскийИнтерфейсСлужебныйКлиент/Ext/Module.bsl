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

#Область СлужебныйПрограммныйИнтерфейс

Процедура ВыбратьСохраняемыйФайл(Фильтр, ИмяФайла, Оповещение) Экспорт
	
	ВыбратьФайл(РежимДиалогаВыбораФайла.Сохранение, Фильтр, ИмяФайла, Оповещение);
	
КонецПроцедуры

Процедура ВыбратьЗагружаемыйФайл(Фильтр, ИмяФайла, Оповещение) Экспорт
	
	ВыбратьФайл(РежимДиалогаВыбораФайла.Открытие, Фильтр, ИмяФайла, Оповещение);
	
КонецПроцедуры

Процедура ВыбратьКаталог(ИмяФайла, Оповещение) Экспорт
	
	ВыбратьФайл(РежимДиалогаВыбораФайла.ВыборКаталога, Неопределено, ИмяФайла, Оповещение);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ПослеВыбораФайла(ВыбранныеФайлы, ДополнительныеПараметры) Экспорт
	
	Если ВыбранныеФайлы <> Неопределено Тогда
		ВыполнитьОбработкуОповещения(ДополнительныеПараметры.Оповещение, ВыбранныеФайлы[0]);
	КонецЕсли;
	
КонецПроцедуры

Процедура ВыбратьФайл(Режим, Фильтр, ИмяФайла, Оповещение)
	
	ДиалогВыбораФайла = Новый ДиалогВыбораФайла(Режим);
	
	Если ЗначениеЗаполнено(Фильтр) Тогда
		ДиалогВыбораФайла.Фильтр = Фильтр;
	КонецЕсли;
	ДиалогВыбораФайла.МножественныйВыбор = Ложь;
	ДиалогВыбораФайла.ПолноеИмяФайла = ИмяФайла;
	
	ПараметрыОбработчика = Новый Структура("Оповещение", Оповещение);
	Обработчик = Новый ОписаниеОповещения("ПослеВыбораФайла", ЭтотОбъект, ПараметрыОбработчика);
	ДиалогВыбораФайла.Показать(Обработчик);
	
КонецПроцедуры

#КонецОбласти
