Функция Index() Экспорт
	
	ТаблицаАгентов = ЦентральныеСерверы.ПолучитьСписок();
	Возврат Представление(ТаблицаАгентов);

КонецФункции

Функция Add() Экспорт

	Если ЗапросHttp.Метод = "POST" Тогда
		ТЗ = ЦентральныеСерверы.ПолучитьСписок();
		Элемент = ТЗ.Добавить();
		ЗаполнитьДанные(Элемент);
		ЦентральныеСерверы.Записать(ТЗ);
		Возврат Перенаправление("/servers/index");
	КонецЕсли;
	
	Возврат Представление("Item");

КонецФункции

Функция Edit() Экспорт

	Идентификатор = ЗначенияМаршрута["id"];
	Если Идентификатор = Неопределено Тогда
		Возврат Перенаправление("/servers/index");
	КонецЕсли;

	ТЗ      = ЦентральныеСерверы.ПолучитьСписок();
	Элемент = ТЗ.Найти(Идентификатор, "ХешИдентификатора");

	Если Элемент = Неопределено Тогда
		Возврат КодСостояния(404);
	КонецЕсли;

	Если ЗапросHttp.Метод = "POST" Тогда
		
		ЗаполнитьДанные(Элемент);
		ЦентральныеСерверы.Записать(ТЗ);
		
		Возврат Перенаправление("/servers/index");
	Иначе
		// Передаем в представление "модель" - Элемент
		Возврат Представление("Item", Элемент);
	КонецЕсли;
	
КонецФункции

Процедура ЗаполнитьДанные(Знач Элемент)
	
	ДанныеФормы = ЗапросHttp.ДанныеФормы;
	
	ПустойУИД = "00000000-0000-0000-0000-000000000000";
	
	Попытка
		Элемент.Идентификатор = ДанныеФормы["Идентификатор"];
		Если Не ЗначениеЗаполнено(Элемент.Идентификатор) Тогда
			Элемент.Идентификатор = ПустойУИД;
		КонецЕсли;
	Исключение
		Элемент.Идентификатор = ПустойУИД;
	КонецПопытки;

	Элемент.ХешИдентификатора = Хеширование.ПолучитьХешMD5(Элемент.Идентификатор);
	Элемент.СетевоеИмя = ДанныеФормы["СетевоеИмя"];
	Элемент.Порт = ДанныеФормы["Порт"];
	Элемент.Режим = "RAS";

КонецПроцедуры