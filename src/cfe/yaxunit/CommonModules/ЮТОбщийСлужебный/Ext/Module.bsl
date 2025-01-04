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

// Вычисляет хеш по алгоритму md5.
//
// Параметры:
//  Данные - Строка, ДвоичныеДанные - Данные, для которых необходимо вычислить хеш
//
// Возвращаемое значение:
//  Строка
Функция ХешMD5(Данные) Экспорт
	
	Возврат ЮТОбщийСлужебныйВызовСервера.ХешMD5(Данные);
	
КонецФункции

// Создает массив с переданными значениями
// 
// Параметры:
//  ЗначениеПоУмолчанию - Произвольный - Значение, подставляемое для пропущенных параметров
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
//  Массив из Произвольный - Массив переданных значений
//@skip-check method-too-many-params
// BSLLS:NumberOfOptionalParams-off
// BSLLS:NumberOfParams-off
// BSLLS:DuplicateStringLiteral-off
Функция ЗначениеВМассивеПоУмолчанию(ЗначениеПоУмолчанию,
									Значение1,
									Значение2 = "_!%*",
									Значение3 = "_!%*",
									Значение4 = "_!%*",
									Значение5 = "_!%*",
									Значение6 = "_!%*",
									Значение7 = "_!%*",
									Значение8 = "_!%*",
									Значение9 = "_!%*",
									Значение10 = "_!%*") Экспорт
	
	ФлагПустогоЗначения = "_!%*";
	
	Значения = Новый Массив(10);
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
	
	Для Инд = -9 По 0 Цикл
		Если Значения[-Инд] <> ФлагПустогоЗначения Тогда
			Результат = Новый Массив(1 - Инд);
			Прервать;
		КонецЕсли;
	КонецЦикла;
	
	Для Инд = 0 По Результат.ВГраница() Цикл
		Если Значения[Инд] <> ФлагПустогоЗначения Тогда
			Результат[Инд] = Значения[Инд];
		Иначе
			Результат[Инд] = ЗначениеПоУмолчанию;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции
// BSLLS:DuplicateStringLiteral-on
// BSLLS:NumberOfParams-on
// BSLLS:NumberOfOptionalParams-on

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#КонецОбласти
