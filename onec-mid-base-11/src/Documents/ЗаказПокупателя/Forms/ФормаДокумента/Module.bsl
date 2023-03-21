
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	// {{ Артемов А.В.:  Добавление группы на форму
	Группа = Элементы.Вставить("АВ_ГруппаПересчета", Тип("ГруппаФормы"), ЭтаФорма.Элементы.ГруппаКолонкиШапки.ПодчиненныеЭлементы.ГруппаШапкаЛево);
	Группа.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	Группа.ОтображатьЗаголовок = Ложь;
//}}

// {{ Артемов А.В.: Добавление реквезита объекта "АВ_СогласованнаяСкидка"
	ПолеВвода = Элементы.Вставить("АВ_СогласованнаяСкидка", Тип("ПолеФормы"), Группа);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.АВ_СогласованнаяСкидка";
    ПолеВвода.Заголовок = "Согласованная скидка в" + Формат(" %");
	ПолеВвода.Подсказка = "Введите скидку меньше или равной 100" + Формат(" %");
	ПолеВвода.УстановитьДействие("ПриИзменении","ПриИзмененииСогласованнаяСкидка");
// }} 
			
// {{ Артемов А.В.: Добавление команды на форму
	Команда = Команды.Добавить("АВ_Пересчитать");
	Команда.Заголовок = "Пересчитать";
	Команда.Действие = "КомандаАВ_Пересчитать";
		
	Кнопка = Элементы.Вставить("КнопкаАВ_Пересчитать", Тип("КнопкаФормы"), Группа);
	Кнопка.ИмяКоманды = "АВ_Пересчитать";
	Кнопка.Картинка= БиблиотекаКартинок.Обновить;
	Кнопка.Отображение = ОтображениеКнопки.КартинкаИТекст;
	Кнопка.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	//}}
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	
	РассчитатьСуммуДокумента();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
		
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);

КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	
	РассчитатьСуммуДокумента();

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
	КоэффициентСкидки = 1 - (ТекущиеДанные.Скидка+Объект.АВ_СогласованнаяСкидка)/ 100;
	ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

&НаКлиенте
Процедура КомандаАВ_Пересчитать(Команда)
	
	// {{ Артемов А.В.: Расчет скидки по команде
	РасчетСогласованнойСкидки()	
	//}}
	
КонецПроцедуры

&НаКлиенте
Процедура РасчетСогласованнойСкидки()
	
	// {{ Артемов А.В.: Расчет скидки
	Для Каждого ТекущиеДанные Из Объект.Товары Цикл
	КоэффициентСкидки = 1 - (ТекущиеДанные.Скидка+Объект.АВ_СогласованнаяСкидка)/ 100;
	ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;	
	КонецЦикла;
	
	Для Каждого ТекущиеДанные Из Объект.Услуги Цикл
	КоэффициентСкидки = 1 - (ТекущиеДанные.Скидка+Объект.АВ_СогласованнаяСкидка)/ 100;
	ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;	
	КонецЦикла; 
	
	//РассчитатьСуммуДокумента();
	//}}
	
КонецПроцедуры

&НаКлиенте
Процедура ПриИзмененииСогласованнаяСкидка(Элемент)
	
	// {{ Артемов А.В.:Изменение
	Если Объект.АВ_СогласованнаяСкидка <= 100 Тогда
	Оповещение = Новый ОписаниеОповещения("ПослеЗакрытияВопроса",ЭтотОбъект);	
	ПоказатьВопрос(Оповещение,"Пересчитать Сумму?",РежимДиалогаВопрос.ДаНет,0,КодВозвратаДиалога.Да,"Изменена согласованная скидка");
Иначе
	ПоказатьПредупреждение(,"Введена скидка больше 100" + Формат(" %") 
	+ Символы.ПС 
	+ "Скидка должна быть меньше 100" + Формат(" %"));
	Возврат;
	КонецЕсли;
	//}}	
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗакрытияВопроса(Результат, Параметры) Экспорт
	
	// {{ Артемов А.В.: Расчет	
	Если Результат = КодВозвратаДиалога.Да Тогда
		РасчетСогласованнойСкидки();
	КонецЕсли;	
	//}}
	
КонецПроцедуры 

#КонецОбласти
