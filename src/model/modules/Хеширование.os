
Функция ПолучитьХешMD5(Текст) Экспорт

	ОбъектХеш = Новый ХешированиеДанных(ХешФункция.MD5);
	ОбъектХеш.Добавить(Текст);

	Возврат ОбъектХеш.ХешСумма;

КонецФункции