void secondMain() async {
  
  print('Before the Future'); // выводиться

  Future(() {
    print('Running the Future'); // Помещается в очередь
  }).then((_) {
    print('Future is complete'); // Помещается в очередь
  });
  print('After the Future'); // Выводиться

  /* Заключение: код в основном методе main выполняется синхронно в очереди Event Loop, 
    когда очередь доходит до объекта Future
    этот объект помещается в конец очереди, весь остальной код продолжает синхронно выполнятся,
    после того как весь синхронный код (не Future и async await) отработался, очередь доходит до объектов Future и отрабатывается их код 
    по принципу первый вошел первый вышел. 
    Всё проиходит в последовательности Event Loop, никакой ассинхронности нет))) расходимся.
  */


  /* Конструкция async await позволяется остановить поток выполения кода когда очередь доходит до объекта отмеченного await, 
    это значит что*/

  methodA();
  await methodB();
  await methodC('main');
  methodD();
}

methodA() {
  print('A');
}

methodB() async {
  print('B start');
  await methodC('B');
  print('B end');
}

methodC(String from) async {
  print('C start from $from');

  Future(() {
    // <== Этот код будет исполнен когда-то в будущем
    print('C running Future from $from');
  }).then((_) {
    print('C end of Future from $from');
  });

  print('C end from $from');
}

methodD() {
  print('D');
}
