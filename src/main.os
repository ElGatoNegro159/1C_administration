
#Использовать "model"

Процедура ПриНачалеРаботыСистемы()

      ИспользоватьСтатическиеФайлы();
      //ИспользоватьМаршруты();
      ИспользоватьМаршруты("ОпределениеМаршрутов");

КонецПроцедуры

Процедура ОпределениеМаршрутов(КоллекцияМаршрутов)

      // Умолчания = Новый Соответствие();
      // Умолчания.Вставить("action", "help");

      КоллекцияМаршрутов.Добавить("Основной", "{controller}/");
      // КоллекцияМаршрутов.Добавить("Основной", "{controller}/{action?}}", Умолчания);
      КоллекцияМаршрутов.Добавить("ОсновнойСПараметрами", "{controller}/{action}/{params?}");
      // КоллекцияМаршрутов.Добавить("Основной", "{controller}/{action?}}", ЗначенияПоУмолчанию);
      // КоллекцияМаршрутов.Добавить("Основной", "{controller}/{action?}}", ЗначенияПоУмолчанию);
      // КоллекцияМаршрутов.Добавить("Основной", "{controller}/{action?}}", ЗначенияПоУмолчанию);
      // КоллекцияМаршрутов.Добавить("Основной", "{controller}/{action?}}", ЗначенияПоУмолчанию);
      
КонецПроцедуры