// jquery.daterangepicker.lang.js
// author : Chunlong Liu, Zhenyu Wu
// license : MIT
// https://adam5wu.github.io/DateRange-Picker-Ex/
(function (factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(['jquery'], factory);
    } else if (typeof exports === 'object' && typeof module !== 'undefined') {
        // CommonJS. Register as a module
        module.exports = factory(require('jquery'));
    } else {
        // Browser globals
        factory(jQuery);
    }
}
(function ($) {
    'use strict';
    $.DRPExLang = $.extend({
        'id' : {
            'selected' : 'Terpilih:',
            'day' : 'Hari',
            'days' : 'Hari',
            'apply-disabled' : 'Tutup',
            'apply-enabled' : 'Tutup',
            'week-1' : 'sen',
            'week-2' : 'sel',
            'week-3' : 'rab',
            'week-4' : 'kam',
            'week-5' : 'jum',
            'week-6' : 'sab',
            'week-7' : 'min',
            'week-number' : 'W',
            'shortcuts' : 'Pintas',
            'custom-values' : 'Nilai yang ditentukan',
            'past' : 'Yang Lalu',
            'following' : 'Mengikuti',
            'previous' : 'Sebelumnya',
            'prev-week' : 'Minggu',
            'prev-month' : 'Bulan',
            'prev-year' : 'Tahun',
            'next' : 'Selanjutnya',
            'next-week' : 'Minggu',
            'next-month' : 'Bulan',
            'next-year' : 'Tahun',
            'less-than' : 'Tanggal harus lebih dari %d hari',
            'more-than' : 'Tanggal harus kurang dari %d hari',
            'default-more' : 'Jarak tanggal harus lebih lama dari %d hari',
            'default-single' : 'Silakan pilih tanggal',
            'default-less' : 'Jarak rentang tanggal tidak boleh lebih lama dari %d hari',
            'default-range' : 'Rentang tanggal harus antara {minDays} dan {maxDays} hari',
            'default-default' : 'Silakan pilih rentang tanggal'
        },
        'az' : {
            'selected' : 'Seçildi:',
            'day' : ' gün',
            'days' : ' gün',
            'apply-disabled' : 'tətbiq',
            'apply-enabled' : 'tətbiq',
            'week-1' : '1',
            'week-2' : '2',
            'week-3' : '3',
            'week-4' : '4',
            'week-5' : '5',
            'week-6' : '6',
            'week-7' : '7',
            'shortcuts' : 'Qısayollar',
            'past' : 'Keçmiş',
            'following' : 'Növbəti',
            'previous' : '&nbsp;&nbsp;&nbsp;',
            'prev-week' : 'Öncəki həftə',
            'prev-month' : 'Öncəki ay',
            'prev-year' : 'Öncəki il',
            'next' : '&nbsp;&nbsp;&nbsp;',
            'next-week' : 'Növbəti həftə',
            'next-month' : 'Növbəti ay',
            'next-year' : 'Növbəti il',
            'less-than' : 'Tarix aralığı %d gündən çox olmamalıdır',
            'more-than' : 'Tarix aralığı %d gündən az olmamalıdır',
            'default-more' : '%d gündən çox bir tarix seçin',
            'default-single' : 'Tarix seçin',
            'default-less' : '%d gündən az bir tarix seçin',
            'default-range' : '{minDays} və {maxDays} gün aralığında tarixlər seçin',
            'default-default' : 'Tarix aralığı seçin'
        },
        'cn' : 'zh-cn',
        'zh-cn' : //simplified chinese
            {
                'selected' : '已选择:',
                'day' : '天',
                'days' : '天',
                'apply-disabled' : '关闭',
                'apply-enabled' : '确定',
                'week-1' : '一',
                'week-2' : '二',
                'week-3' : '三',
                'week-4' : '四',
                'week-5' : '五',
                'week-6' : '六',
                'week-7' : '日',
                'week-number' : '周',
                'shortcuts' : '快捷选择',
                'past' : '之前',
                'following' : '之后',
                'previous' : '过去',
                'prev-week' : '一周',
                'prev-month' : '一月',
                'prev-year' : '一年',
                'next' : '未来',
                'next-week' : '一周',
                'next-month' : '一月',
                'next-year' : '一年',
                'batch-week' : '整周',
                'batch-weekdays' : '工作日',
                'batch-weekends' : '周末',
                'batch-month' : '整月',
                'less-than' : '所选日期范围不能大于%d天',
                'more-than' : '所选日期范围不能小于%d天',
                'range-start-bound' : '日期范围开始于允许范围之外',
                'range-end-bound' : '日期范围结束于允许范围之外',
                'batch-invalid' : '日期范围未满足整选条件 (%s)',
                'disabled-range' : '日期范围跨越了无法选定的日期',
                'default-more' : '请选择大于%d天的日期范围',
                'default-less' : '请选择小于%d天的日期范围',
                'default-range' : '请选择{minDays}到{maxDays}天的日期范围',
                'default-single' : '请选择一个日期',
                'default-default' : '请选择一个日期范围'
            },
        'cz' : {
            'selected' : 'Vybráno:',
            'day' : 'Den',
            'days' : 'Dny',
            'apply-disabled' : 'Zavřít',
            'apply-enabled' : 'Zavřít',
            'week-1' : 'po',
            'week-2' : 'út',
            'week-3' : 'st',
            'week-4' : 'čt',
            'week-5' : 'pá',
            'week-6' : 'so',
            'week-7' : 'ne',
            'shortcuts' : 'Zkratky',
            'past' : 'po',
            'following' : 'následující',
            'previous' : 'předchozí',
            'prev-week' : 'týden',
            'prev-month' : 'měsíc',
            'prev-year' : 'rok',
            'next' : 'další',
            'next-week' : 'týden',
            'next-month' : 'měsíc',
            'next-year' : 'rok',
            'less-than' : 'Rozsah data by neměl být větší než %d dnů',
            'more-than' : 'Rozsah data by neměl být menší než %d dnů',
            'default-more' : 'Prosím zvolte rozsah data větší než %d dnů',
            'default-single' : 'Prosím zvolte datum',
            'default-less' : 'Prosím zvolte rozsah data menší než %d dnů',
            'default-range' : 'Prosím zvolte rozsah data mezi {minDays} a {maxDays} dny',
            'default-default' : 'Prosím zvolte rozsah data'
        },
        'de' : {
            'selected' : 'Auswahl:',
            'day' : 'Tag',
            'days' : 'Tage',
            'apply-disabled' : 'Schließen',
            'apply-enabled' : 'Schließen',
            'week-1' : 'mo',
            'week-2' : 'di',
            'week-3' : 'mi',
            'week-4' : 'do',
            'week-5' : 'fr',
            'week-6' : 'sa',
            'week-7' : 'so',
            'shortcuts' : 'Schnellwahl',
            'past' : 'Vorherige',
            'following' : 'Folgende',
            'previous' : 'Vorherige',
            'prev-week' : 'Woche',
            'prev-month' : 'Monat',
            'prev-year' : 'Jahr',
            'next' : 'Nächste',
            'next-week' : 'Woche',
            'next-month' : 'Monat',
            'next-year' : 'Jahr',
            'less-than' : 'Datumsbereich darf nicht größer sein als %d Tage',
            'more-than' : 'Datumsbereich darf nicht kleiner sein als %d Tage',
            'default-more' : 'Bitte mindestens %d Tage auswählen',
            'default-single' : 'Bitte ein Datum auswählen',
            'default-less' : 'Bitte weniger als %d Tage auswählen',
            'default-range' : 'Bitte einen Datumsbereich zwischen {minDays} und {maxDays} Tagen auswählen',
            'default-default' : 'Bitte ein Start- und Enddatum auswählen'
        },
        'es' : {
            'selected' : 'Seleccionado:',
            'day' : 'Día',
            'days' : 'Días',
            'apply-disabled' : 'Cerrar',
            'apply-enabled' : 'Cerrar',
            'week-1' : 'lu',
            'week-2' : 'ma',
            'week-3' : 'mi',
            'week-4' : 'ju',
            'week-5' : 'vi',
            'week-6' : 'sa',
            'week-7' : 'do',
            'shortcuts' : 'Accesos directos',
            'past' : 'Pasado',
            'following' : 'Siguiente',
            'previous' : 'Anterior',
            'prev-week' : 'Semana',
            'prev-month' : 'Mes',
            'prev-year' : 'Año',
            'next' : 'Siguiente',
            'next-week' : 'Semana',
            'next-month' : 'Mes',
            'next-year' : 'Año',
            'less-than' : 'El rango no debería ser mayor de %d días',
            'more-than' : 'El rango no debería ser menor de %d días',
            'default-more' : 'Por favor selecciona un rango mayor a %d días',
            'default-single' : 'Por favor selecciona un día',
            'default-less' : 'Por favor selecciona un rango menor a %d días',
            'default-range' : 'Por favor selecciona un rango entre {minDays} y {maxDays} días',
            'default-default' : 'Por favor selecciona un rango de fechas.'
        },
        'fr' : {
            'selected' : 'Sélection:',
            'day' : 'Jour',
            'days' : 'Jours',
            'apply-disabled' : 'Fermer',
            'apply-enabled' : 'Fermer',
            'week-1' : 'lu',
            'week-2' : 'ma',
            'week-3' : 'me',
            'week-4' : 'je',
            'week-5' : 've',
            'week-6' : 'sa',
            'week-7' : 'di',
            'shortcuts' : 'Raccourcis',
            'past' : 'Passé',
            'following' : 'Suivant',
            'previous' : 'Précédent',
            'prev-week' : 'Semaine',
            'prev-month' : 'Mois',
            'prev-year' : 'Année',
            'next' : 'Suivant',
            'next-week' : 'Semaine',
            'next-month' : 'Mois',
            'next-year' : 'Année',
            'less-than' : 'L\'intervalle ne doit pas être supérieure à %d jours',
            'more-than' : 'L\'intervalle ne doit pas être inférieure à %d jours',
            'default-more' : 'Merci de choisir une intervalle supérieure à %d jours',
            'default-single' : 'Merci de choisir une date',
            'default-less' : 'Merci de choisir une intervalle inférieure %d jours',
            'default-range' : 'Merci de choisir une intervalle comprise entre {minDays} et {maxDays} jours',
            'default-default' : 'Merci de choisir une date'
        },
        'hu' : {
            'selected' : 'Kiválasztva:',
            'day' : 'Nap',
            'days' : 'Nap',
            'apply-disabled' : 'Ok',
            'apply-enabled' : 'Ok',
            'week-1' : 'h',
            'week-2' : 'k',
            'week-3' : 'sz',
            'week-4' : 'cs',
            'week-5' : 'p',
            'week-6' : 'sz',
            'week-7' : 'v',
            'shortcuts' : 'Gyorsválasztó',
            'past' : 'Múlt',
            'following' : 'Következő',
            'previous' : 'Előző',
            'prev-week' : 'Hét',
            'prev-month' : 'Hónap',
            'prev-year' : 'Év',
            'next' : 'Következő',
            'next-week' : 'Hét',
            'next-month' : 'Hónap',
            'next-year' : 'Év',
            'less-than' : 'A kiválasztás nem lehet több %d napnál',
            'more-than' : 'A kiválasztás nem lehet több %d napnál',
            'default-more' : 'Válassz ki egy időszakot ami hosszabb mint %d nap',
            'default-single' : 'Válassz egy napot',
            'default-less' : 'Válassz ki egy időszakot ami rövidebb mint %d nap',
            'default-range' : 'Válassz ki egy {minDays} - {maxDays} nap hosszú időszakot',
            'default-default' : 'Válassz ki egy időszakot'
        },
        'it' : {
            'selected' : 'Selezionati:',
            'day' : 'Giorno',
            'days' : 'Giorni',
            'apply-disabled' : 'Chiudi',
            'apply-enabled' : 'Chiudi',
            'week-1' : 'lu',
            'week-2' : 'ma',
            'week-3' : 'me',
            'week-4' : 'gi',
            'week-5' : 've',
            'week-6' : 'sa',
            'week-7' : 'do',
            'shortcuts' : 'Scorciatoie',
            'past' : 'Scorso',
            'following' : 'Successivo',
            'previous' : 'Precedente',
            'prev-week' : 'Settimana',
            'prev-month' : 'Mese',
            'prev-year' : 'Anno',
            'next' : 'Prossimo',
            'next-week' : 'Settimana',
            'next-month' : 'Mese',
            'next-year' : 'Anno',
            'less-than' : 'L\'intervallo non dev\'essere maggiore di %d giorni',
            'more-than' : 'L\'intervallo non dev\'essere minore di %d giorni',
            'default-more' : 'Seleziona un intervallo maggiore di %d giorni',
            'default-single' : 'Seleziona una data',
            'default-less' : 'Seleziona un intervallo minore di %d giorni',
            'default-range' : 'Seleziona un intervallo compreso tra i {minDays} e i {maxDays} giorni',
            'default-default' : 'Seleziona un intervallo di date'
        },
        'ko' : {
            'selected' : '기간:',
            'day' : '일',
            'days' : '일간',
            'apply-disabled' : '닫기',
            'apply-enabled' : '닫기',
            'week-1' : '월',
            'week-2' : '화',
            'week-3' : '수',
            'week-4' : '목',
            'week-5' : '금',
            'week-6' : '토',
            'week-7' : '일',
            'week-number' : '주',
            'shortcuts' : '단축키들',
            'past' : '지난(오늘기준)',
            'following' : '이후(오늘기준)',
            'previous' : '이전',
            'prev-week' : '1주',
            'prev-month' : '1달',
            'prev-year' : '1년',
            'next' : '다음',
            'next-week' : '1주',
            'next-month' : '1달',
            'next-year' : '1년',
            'less-than' : '날짜 범위는 %d 일보다 많을 수 없습니다',
            'more-than' : '날짜 범위는 %d 일보다 작을 수 없습니다',
            'default-more' : '날짜 범위를 %d 일보다 길게 선택해 주세요',
            'default-single' : '날짜를 선택해 주세요',
            'default-less' : '%d 일보다 작은 날짜를 선택해 주세요',
            'default-range' : '{minDays} 와 {maxDays} 일 사이의 날짜 범위를 선택해 주세요',
            'default-default' : '날짜 범위를 선택해 주세요'
        },
        'no' : {
            'selected' : 'Valgt:',
            'day' : 'Dag',
            'days' : 'Dager',
            'apply-disabled' : 'Lukk',
            'apply-enabled' : 'Lukk',
            'week-1' : 'ma',
            'week-2' : 'ti',
            'week-3' : 'on',
            'week-4' : 'to',
            'week-5' : 'fr',
            'week-6' : 'lø',
            'week-7' : 'sø',
            'shortcuts' : 'Snarveier',
            'custom-values' : 'Egendefinerte Verdier',
            'past' : 'Over', // Not quite sure about the context of this one
            'following' : 'Følger',
            'previous' : 'Forrige',
            'prev-week' : 'Uke',
            'prev-month' : 'Måned',
            'prev-year' : 'År',
            'next' : 'Neste',
            'next-week' : 'Uke',
            'next-month' : 'Måned',
            'next-year' : 'År',
            'less-than' : 'Datoperioden skal ikkje være lengre enn %d dager',
            'more-than' : 'Datoperioden skal ikkje være kortere enn %d dager',
            'default-more' : 'Vennligst velg ein datoperiode lengre enn %d dager',
            'default-single' : 'Vennligst velg ein dato',
            'default-less' : 'Vennligst velg ein datoperiode mindre enn %d dager',
            'default-range' : 'Vennligst velg ein datoperiode mellom {minDays} og {maxDays} dager',
            'default-default' : 'Vennligst velg ein datoperiode'
        },
        'nl' : {
            'selected' : 'Geselecteerd:',
            'day' : 'Dag',
            'days' : 'Dagen',
            'apply-disabled' : 'Ok',
            'apply-enabled' : 'Ok',
            'week-1' : 'ma',
            'week-2' : 'di',
            'week-3' : 'wo',
            'week-4' : 'do',
            'week-5' : 'vr',
            'week-6' : 'za',
            'week-7' : 'zo',
            'shortcuts' : 'Snelkoppelingen',
            'custom-values' : 'Aangepaste waarden',
            'past' : 'Verleden',
            'following' : 'Komend',
            'previous' : 'Vorige',
            'prev-week' : 'Week',
            'prev-month' : 'Maand',
            'prev-year' : 'Jaar',
            'next' : 'Volgende',
            'next-week' : 'Week',
            'next-month' : 'Maand',
            'next-year' : 'Jaar',
            'less-than' : 'Interval moet langer dan %d dagen zijn',
            'more-than' : 'Interval mag niet minder dan %d dagen zijn',
            'default-more' : 'Selecteer een interval langer dan %dagen',
            'default-single' : 'Selecteer een datum',
            'default-less' : 'Selecteer een interval minder dan %d dagen',
            'default-range' : 'Selecteer een interval tussen {minDays} en {maxDays} dagen',
            'default-default' : 'Selecteer een interval'
        },
        'ru' : {
            'selected' : 'Выбрано:',
            'day' : 'День',
            'days' : 'Дней',
            'apply-disabled' : 'Применить',
            'apply-enabled' : 'Применить',
            'week-1' : 'пн',
            'week-2' : 'вт',
            'week-3' : 'ср',
            'week-4' : 'чт',
            'week-5' : 'пт',
            'week-6' : 'сб',
            'week-7' : 'вс',
            'shortcuts' : 'Быстрый выбор',
            'custom-values' : 'Пользовательские значения',
            'past' : 'Прошедшие',
            'following' : 'Следующие',
            'previous' : '&nbsp;&nbsp;&nbsp;',
            'prev-week' : 'Неделя',
            'prev-month' : 'Месяц',
            'prev-year' : 'Год',
            'next' : '&nbsp;&nbsp;&nbsp;',
            'next-week' : 'Неделя',
            'next-month' : 'Месяц',
            'next-year' : 'Год',
            'less-than' : 'Диапазон не может быть больше %d дней',
            'more-than' : 'Диапазон не может быть меньше %d дней',
            'default-more' : 'Пожалуйста выберите диапазон больше %d дней',
            'default-single' : 'Пожалуйста выберите дату',
            'default-less' : 'Пожалуйста выберите диапазон меньше %d дней',
            'default-range' : 'Пожалуйста выберите диапазон между {minDays} и {maxDays} днями',
            'default-default' : 'Пожалуйста выберите диапазон'
        },
        'pl' : {
            'selected' : 'Wybrany:',
            'day' : 'Dzień',
            'days' : 'Dni',
            'apply-disabled' : 'Zamknij',
            'apply-enabled' : 'Zamknij',
            'week-1' : 'pon',
            'week-2' : 'wt',
            'week-3' : 'śr',
            'week-4' : 'czw',
            'week-5' : 'pt',
            'week-6' : 'so',
            'week-7' : 'nd',
            'shortcuts' : 'Skróty',
            'custom-values' : 'Niestandardowe wartości',
            'past' : 'Przeszłe',
            'following' : 'Następne',
            'previous' : 'Poprzednie',
            'prev-week' : 'tydzień',
            'prev-month' : 'miesiąc',
            'prev-year' : 'rok',
            'next' : 'Następny',
            'next-week' : 'tydzień',
            'next-month' : 'miesiąc',
            'next-year' : 'rok',
            'less-than' : 'Okres nie powinien być dłuższy niż %d dni',
            'more-than' : 'Okres nie powinien być krótszy niż  %d ni',
            'default-more' : 'Wybierz okres dłuższy niż %d dni',
            'default-single' : 'Wybierz datę',
            'default-less' : 'Wybierz okres krótszy niż %d dni',
            'default-range' : 'Wybierz okres trwający od {minDays} do {maxDays} dni',
            'default-default' : 'Wybierz okres'
        },
        'se' : {
            'selected' : 'Vald:',
            'day' : 'dag',
            'days' : 'dagar',
            'apply-disabled' : 'godkänn',
            'apply-enabled' : 'godkänn',
            'week-1' : 'ma',
            'week-2' : 'ti',
            'week-3' : 'on',
            'week-4' : 'to',
            'week-5' : 'fr',
            'week-6' : 'lö',
            'week-7' : 'sö',
            'shortcuts' : 'genvägar',
            'custom-values' : 'Anpassade värden',
            'past' : 'över',
            'following' : 'följande',
            'previous' : 'förra',
            'prev-week' : 'vecka',
            'prev-month' : 'månad',
            'prev-year' : 'år',
            'next' : 'nästa',
            'next-week' : 'vecka',
            'next-month' : 'måned',
            'next-year' : 'år',
            'less-than' : 'Datumintervall bör inte vara mindre än %d dagar',
            'more-than' : 'Datumintervall bör inte vara mer än %d dagar',
            'default-more' : 'Välj ett datumintervall längre än %d dagar',
            'default-single' : 'Välj ett datum',
            'default-less' : 'Välj ett datumintervall mindre än %d dagar',
            'default-range' : 'Välj ett datumintervall mellan {minDays} och {maxDays} dagar',
            'default-default' : 'Välj ett datumintervall'
        },
        'pt' : //Portuguese (European)
            {
                'selected' : 'Selecionado:',
                'day' : 'Dia',
                'days' : 'Dias',
                'apply-disabled' : 'Fechar',
                'apply-enabled' : 'Fechar',
                'week-1' : 'seg',
                'week-2' : 'ter',
                'week-3' : 'qua',
                'week-4' : 'qui',
                'week-5' : 'sex',
                'week-6' : 'sab',
                'week-7' : 'dom',
                'week-number' : 'N',
                'shortcuts' : 'Atalhos',
                'custom-values' : 'Valores Personalizados',
                'past' : 'Passado',
                'following' : 'Seguinte',
                'previous' : 'Anterior',
                'prev-week' : 'Semana',
                'prev-month' : 'Mês',
                'prev-year' : 'Ano',
                'next' : 'Próximo',
                'next-week' : 'Próxima Semana',
                'next-month' : 'Próximo Mês',
                'next-year' : 'Próximo Ano',
                'less-than' : 'O período selecionado não deve ser maior que %d dias',
                'more-than' : 'O período selecionado não deve ser menor que %d dias',
                'default-more' : 'Selecione um período superior a %d dias',
                'default-single' : 'Selecione uma data',
                'default-less' : 'Selecione um período inferior a %d dias',
                'default-range' : 'Selecione um período de {minDays} a {maxDays} dias',
                'default-default' : 'Selecione um período'
            },
        'zh-tw' : // traditional chinese
            {
                'selected' : '已選擇:',
                'day' : '天',
                'days' : '天',
                'apply-disabled' : '關閉',
                'apply-enabled' : '確定',
                'week-1' : '一',
                'week-2' : '二',
                'week-3' : '三',
                'week-4' : '四',
                'week-5' : '五',
                'week-6' : '六',
                'week-7' : '日',
                'week-number' : '周',
                'shortcuts' : '快速選擇',
                'past' : '過去',
                'following' : '將來',
                'previous' : '&nbsp;&nbsp;&nbsp;',
                'prev-week' : '上週',
                'prev-month' : '上個月',
                'prev-year' : '去年',
                'next' : '&nbsp;&nbsp;&nbsp;',
                'next-week' : '下周',
                'next-month' : '下個月',
                'next-year' : '明年',
                'less-than' : '所選日期範圍不能大於%d天',
                'more-than' : '所選日期範圍不能小於%d天',
                'default-more' : '請選擇大於%d天的日期範圍',
                'default-less' : '請選擇小於%d天的日期範圍',
                'default-range' : '請選擇{minDays}天到{maxDays}天的日期範圍',
                'default-single' : '請選擇一個日期',
                'default-default' : '請選擇一個日期範圍'
            },
        'ja' : {
            'selected' : '選択しました:',
            'day' : '日',
            'days' : '日々',
            'apply-disabled' : '閉じる',
            'apply-enabled' : '閉じる',
            'week-1' : '日',
            'week-2' : '月',
            'week-3' : '火',
            'week-4' : '水',
            'week-5' : '木',
            'week-6' : '金',
            'week-7' : '土',
            'shortcuts' : 'クイック選択',
            'past' : '過去',
            'following' : '将来',
            'previous' : '&nbsp;&nbsp;&nbsp;',
            'prev-week' : '先週、',
            'prev-month' : '先月',
            'prev-year' : '昨年',
            'next' : '&nbsp;&nbsp;&nbsp;',
            'next-week' : '来週',
            'next-month' : '来月',
            'next-year' : '来年',
            'less-than' : '日付の範囲は %d 日以上にすべきではありません',
            'more-than' : '日付の範囲は %d 日を下回ってはいけません',
            'default-more' : '%d 日よりも長い期間を選択してください',
            'default-less' : '%d 日未満の期間を選択してください',
            'default-range' : '{minDays} と {maxDays} 日の間の日付範囲を選択してください',
            'default-single' : '日付を選択してください',
            'default-default' : '日付範囲を選択してください'
        },
        'da' : {
            'selected' : 'Valgt:',
            'day' : 'Dag',
            'days' : 'Dage',
            'apply-disabled' : 'Luk',
            'apply-enabled' : 'Luk',
            'week-1' : 'ma',
            'week-2' : 'ti',
            'week-3' : 'on',
            'week-4' : 'to',
            'week-5' : 'fr',
            'week-6' : 'lö',
            'week-7' : 'sö',
            'shortcuts' : 'genveje',
            'custom-values' : 'Brugerdefinerede værdier',
            'past' : 'Forbi',
            'following' : 'Følgende',
            'previous' : 'Forrige',
            'prev-week' : 'uge',
            'prev-month' : 'månad',
            'prev-year' : 'år',
            'next' : 'Næste',
            'next-week' : 'Næste uge',
            'next-month' : 'Næste måned',
            'next-year' : 'Næste år',
            'less-than' : 'Dato interval bør ikke være med end %d dage',
            'more-than' : 'Dato interval bør ikke være mindre end %d dage',
            'default-more' : 'Vælg datointerval længere end %d dage',
            'default-single' : 'Vælg dato',
            'default-less' : 'Vælg datointerval mindre end %d dage',
            'default-range' : 'Vælg datointerval mellem {minDays} og {maxDays} dage',
            'default-default' : 'Vælg datointerval'
        }
    }, $.DRPExLang);
}));