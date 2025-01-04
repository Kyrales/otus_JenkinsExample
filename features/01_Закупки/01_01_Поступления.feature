﻿#language: ru

@tree

Функционал: 01.01 Проверка документа Поступления

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: 0100 Создание и проведение документа
	* Создание документа Поступление товаров
		И В командном интерфейсе я выбираю "Закупки" "Поступления товаров"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Поступление товара (создание)"
		И из выпадающего списка с именем 'Организация' я выбираю по строке "ООО \"1000 мелочей\""
		И из выпадающего списка с именем 'Склад' я выбираю по строке "Малый"
		И из выпадающего списка с именем 'Поставщик' я выбираю по строке "Магазин \"Бытовая техника\""

		Когда открылось окно "Поступление товара (создание) *"
		И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю по строке "Тапочки"
		И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "500,00"
		И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "10,00"
		И в таблице 'Товары' я завершаю редактирование строки
	* Запись документа
		И я нажимаю на кнопку с именем 'ФормаЗаписать'

	* Проверка табличной части
		Тогда таблица 'Товары' стала равной:
			| 'N' | 'Товар'   | 'Артикул' | 'Цена'   | 'Количество' | 'Сумма'    |
			| '1' | 'Тапочки' | 'ОБ-008'  | '500,00' | '10,00'      | '5 000,00' |

	* Проведение документа
		И я нажимаю на кнопку с именем 'ФормаПровести'


Сценарий: 1000 Закрыть клиент тестирования
	И я закрываю сеанс текущего клиента тестирования
					
				
				


