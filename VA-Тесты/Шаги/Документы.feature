﻿#language: ru

@tree
@ExportScenarios

Функциональность: Проверка Документов

Сценарий: Открытие формы списка документа "ИмяДокумента"
	Дано я закрыл все окна клиентского приложения

	Если нет права "Просмотр" к объекту "Документ.[ИмяДокумента]" тогда
		Тогда я останавливаю выполнение сценария "Skipped"

	Дано я открываю основную форму списка документа "ИмяДокумента"
	Если появилось предупреждение тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка документа [ИмяДокумента]"
	И я закрыл все окна клиентского приложения

Сценарий: Открытие формы существующего документа "ИмяДокумента"
	Дано я закрыл все окна клиентского приложения

	Если нет права "Просмотр" к объекту "Документ.[ИмяДокумента]" тогда
		Тогда я останавливаю выполнение сценария "Skipped"

	Дано я ищу последние 5 документов "ИмяДокумента" по каждой организации в переменную "СписокДокументов"
	Если '$СписокДокументов$.Количество() = 0' Тогда
		Тогда я останавливаю выполнение сценария "Skipped"
	И для каждого значения "СсылкаДокумента" из массива "$СписокДокументов$"
		Тогда я запоминаю значение выражения 'ПолучитьНавигационнуюСсылку($СсылкаДокумента$)' в переменную "НавигационнаяСсылкаДокумента"
		Затем я открываю навигационную ссылку "$НавигационнаяСсылкаДокумента$"
		Если появилось предупреждение тогда
			Тогда я вызываю исключение "Не удалось открыть навигационную ссылку $НавигационнаяСсылкаДокумента$"
		И я закрыл все окна клиентского приложения

Сценарий: Открытие формы нового документа "ИмяДокумента"
	Дано я закрыл все окна клиентского приложения

	Если нет права "ИнтерактивноеДобавление" к объекту "Документ.[ИмяДокумента]" тогда
		Тогда я останавливаю выполнение сценария "Skipped"

	Дано я открываю основную форму документа "ИмяДокумента"
	Если появилось предупреждение тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму документа [ИмяДокумента]"
	И я закрыл все окна клиентского приложения

Сценарий: Перепроведение существующего документа "ИмяДокумента"
	Дано я закрыл все окна клиентского приложения

	Если нет права "ИнтерактивноеПроведение" к объекту "Документ.[ИмяДокумента]" тогда
		Тогда я останавливаю выполнение сценария "Skipped"

	Дано я ищу последние 5 документов "ИмяДокумента" по каждой организации в переменную "СписокДокументов"
	Если '$СписокДокументов$.Количество() = 0' Тогда
		Тогда я останавливаю выполнение сценария "Skipped"
	И для каждого значения "СсылкаДокумента" из массива "$СписокДокументов$"
		Тогда я запоминаю значение выражения 'ПолучитьНавигационнуюСсылку($СсылкаДокумента$)' в переменную "НавигационнаяСсылкаДокумента"
		Затем я открываю навигационную ссылку "$НавигационнаяСсылкаДокумента$"
		Если появилось предупреждение тогда
			Тогда я вызываю исключение "Не удалось открыть навигационную ссылку $НавигационнаяСсылкаДокумента$"
		И я нажимаю на кнопку "Провести и закрыть"
		Если появилось предупреждение тогда
			Тогда я вызываю исключение "Не удалось перепровести документ $НавигационнаяСсылкаДокумента$"
		Если в текущем окне есть сообщения пользователю Тогда
			Тогда я вызываю исключение с текстом сообщения
		И я закрыл все окна клиентского приложения
	
Сценарий: Исправление существующего документа "ИмяДокумента"
	Дано я закрыл все окна клиентского приложения

	Если нет права "ИнтерактивноеДобавление" к объекту "Документ.[ИмяДокумента]" тогда
		Тогда я останавливаю выполнение сценария "Skipped"

	Дано я ищу последние 5 документов "ИмяДокумента" по каждой организации в переменную "СписокДокументов"
	Если '$СписокДокументов$.Количество() = 0' Тогда
		Тогда я останавливаю выполнение сценария "Skipped"
	И для каждого значения "СсылкаДокумента" из массива "$СписокДокументов$"
		Тогда я запоминаю значение выражения 'ПолучитьНавигационнуюСсылку($СсылкаДокумента$)' в переменную "НавигационнаяСсылкаДокумента"
		Затем я открываю навигационную ссылку "$НавигационнаяСсылкаДокумента$"
		Если появилось предупреждение тогда
			Тогда я вызываю исключение "Не удалось открыть навигационную ссылку $НавигационнаяСсылкаДокумента$"
		И я нажимаю на гиперссылку с именем "Исправить"
		Если появилось предупреждение тогда
			Тогда я вызываю исключение "Не удалось исправить документ $НавигационнаяСсылкаДокумента$"
		Тогда открылось окно "*(создание)"
		Если появилось предупреждение тогда
			Тогда я вызываю исключение "Не удалось дождаться создания исправленного документа $НавигационнаяСсылкаДокумента$"
		И я нажимаю на кнопку "Провести"
		Если появилось предупреждение тогда
			Тогда я вызываю исключение "Не удалось записать и провести документ-исправление"
		Если в текущем окне есть сообщения пользователю Тогда
			Тогда я вызываю исключение с текстом сообщения
		И я нажимаю на кнопку "Пометить на удаление / Снять пометку"
		Затем Если появилось окно диалога я нажимаю на кнопку "Да"
		И я закрыл все окна клиентского приложения
		
Сценарий: Печать существующего документа "ИмяДокумента"
	Дано я закрыл все окна клиентского приложения

	Если нет права "Просмотр" к объекту "Документ.[ИмяДокумента]" тогда
		Тогда я останавливаю выполнение сценария "Skipped"

	Дано я получаю список команд печати для объекта метаданных "Документ.[ИмяДокумента]" в переменную "СписокПечатныхФорм"
	Если '$СписокПечатныхФорм$.Количество() = 0' Тогда
		Тогда я останавливаю выполнение сценария "Skipped"
	И я ищу последние 5 документов "ИмяДокумента" по каждой организации в переменную "СписокДокументов"
	Если '$СписокДокументов$.Количество() = 0' Тогда
		Тогда я останавливаю выполнение сценария "Skipped"
	И для каждого значения "СсылкаДокумента" из массива "$СписокДокументов$"
		Тогда я запоминаю значение выражения 'ПолучитьНавигационнуюСсылку($СсылкаДокумента$)' в переменную "НавигационнаяСсылкаДокумента"
		Затем я открываю навигационную ссылку "$НавигационнаяСсылкаДокумента$"
		Если появилось предупреждение тогда
			Тогда я вызываю исключение "Не удалось открыть навигационную ссылку $НавигационнаяСсылкаДокумента$"
		И для каждого значения "ПечатнаяФормаОбъекта" из массива "$СписокПечатныхФорм$"
			Тогда я запоминаю значение выражения '$ПечатнаяФормаОбъекта$.Представление' в переменную "НаименованиеПечатнойФормы"
			Если элемент с заголовком "$НаименованиеПечатнойФормы$" присутствует на форме тогда
				Тогда я нажимаю на кнопку "$НаименованиеПечатнойФормы$"
				Если появилось предупреждение тогда
					Тогда я вызываю исключение "Не удалось напечатать форму $НаименованиеПечатнойФормы$ для документа $НавигационнаяСсылкаДокумента$"
				И я закрываю текущее окно
		И я закрыл все окна клиентского приложения
