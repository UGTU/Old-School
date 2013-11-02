        ��  ��                  �'  4   ��
 X M L _ E R R O R S         0         ﻿<?xml version="1.0" encoding="utf-8" ?>
<Exceptions xmlns="http://ist.ugtu.net/ExceptionSchema.xsd">
  <Exception ExceptionClass ="EAccessViolation" Action="Restart" Severity="Fatal" HelpTopic="ErrorAccessViolation.htm">
    <Summary>    
       Нарушение доступа к памяти.
    </Summary>
    <Caused>
       Ошибка в программе. 
    </Caused>
    <Solution>
       Попробуйте выполнить действие повторно. Если ошибка повторится  - перезапустите программу. Если ошибка часто повторяется - следует сообщить о ней в отдел разработки и сопровождения.
    </Solution>    
  </Exception>  
  <Exception ExceptionClass ="EOleException" ErrorCode="-2147217911" Action="None" URI="http://kbase.ist.ugtu.net/Links.aspx?id=1" Severity="Stop" HelpTopic="ErrorAccessDenied.htm">
     <Summary>
       Отказ в доступе к объекту.
     </Summary>
     <Caused>
       У вас не хватает прав на выполнение запрошенных действий. 
     </Caused>
     <Solution>
       Перейдите по указанной ссылке на страницу поддержки, чтобы посмотреть на имеющиеся у вас права на выполнение функций. Обратитесь в службу поддержки отдела разработки и сопровождения.
     </Solution>
  </Exception>  
  <Exception ExceptionClass ="EApplicationException" ErrorCode="911" Action="None" URI="http://kbase.ist.ugtu.net/Links.aspx?id=2" Severity="Warning" HelpTopic="General.htm">
    <Summary>
        Документ не может быть выведен на печать.
    </Summary>
    <Caused>
       В системе не установлен ни один принтер.
    </Caused>
    <Solution>
       Для выполнения запрошенного вами действия на компьютере должна быть настроен принтер по-умолчанию. Установите принтер. Если ошибка повторится - обратитесь за помощью в службу технической поддержки. 
    </Solution>
  </Exception>
  <Exception ExceptionClass="EApplicationException" ErrorCode="101" Action="Restart" Severity="Warning" HelpTopic="General.htm">
    <Summary>
      База данных в состоянии "только чтение". Вы можете продолжать работу, но только в режиме "чтение данных"
    </Summary>
    <Caused>
      Эта ошибка предусмотрена программой. Возможно, Вы подключаетесь к неактуальной базе данных.
    </Caused>
    <Solution>
      Попробуйте подключиться к другому серверу или обратитесь за помощью к администратору.
    </Solution>
  </Exception>
  <Exception ExceptionClass="EApplicationException" ErrorCode="102" Action="Restart" Severity="Warning" HelpTopic="General.htm">
    <Summary>
      База данных в аварийном состоянии. Работа приложения будет завершена.
    </Summary>
    <Caused>
      Эта ошибка предусмотрена программой. Возможно, Вы подключаетесь к неактуальной базе данных.
    </Caused>
    <Solution>
      Попробуйте подключиться к другому серверу или обратитесь за помощью к администратору.
    </Solution>
  </Exception>
  <Exception ExceptionClass="EApplicationException" ErrorCode="103" Action="Restart" Severity="Warning" HelpTopic="General.htm">
    <Summary>
      База данных в нестабильном состоянии. Работа приложения будет завершена.
    </Summary>
    <Caused>
      Эта ошибка предусмотрена программой. Возможно, Вы подключаетесь к неактуальной базе данных.
    </Caused>
    <Solution>
      Попробуйте подключиться к другому серверу или обратитесь за помощью к администратору.
    </Solution>
  </Exception>
  <Exception ExceptionClass="EApplicationException" Action="None" Severity="Warning" HelpTopic="General.htm">
    <Summary>
      Предусмотренная ошибка
    </Summary>
    <Caused>
      Эта ошибка предусмотрена программой. Возможно, её причиной является несоблюдение условий ввода данных.
    </Caused>
    <Solution>
      Посмотрите дополнительные сведения об ошибке, которые могут содержать подробные инструкции ваших действий.
    </Solution>
  </Exception>
  
  <Exception ExceptionClass="Exception" Action="None" URI="http://kbase.ist.ugtu.net/Links.aspx?id=5" Severity="Warning" HelpTopic="General.htm">
    <Summary>
      Непредвиденная ошибка.
    </Summary>
    <Caused>
      Эта ошибка была вызвана неизвестной причиной.
    </Caused>
    <Solution>
      Посмотрите дополнительные сведения об ошибке, которые могут содержать подробные инструкции ваших действий. Если ошибка часто повторяется - сообщите о ней в отдел разработки и сопровождения.
    </Solution>
  </Exception>
  <Exception ExceptionClass ="EOleException" ErrorCode="-2147217873" Action="None" URI="http://kbase.ist.ugtu.net/Links.aspx?id=2" Severity="Stop" HelpTopic="ErrorIntegrity.htm">
    <Summary>
      Нарушение ограничений базы данных.
    </Summary>
    <Caused>
      Введены неверные данные.
    </Caused>
    <Solution>
      Проверьте введённые данные и попытайтесь выполнить действие снова.
    </Solution>
  </Exception>
  <Exception ExceptionClass ="EOleException" ErrorCode="-2147467259" Action="Reconnect" URI="http://kbase.ist.ugtu.net/Links.aspx?id=3" Severity="Fatal" HelpTopic="ErrorConnection.htm">
    <Summary>
      Ошибка подключения.
    </Summary>
    <Caused>
      Отсутствие подключение к серверу базы данных.
    </Caused>
    <Solution>
      Проверьте, подключен ли компьютер к локальной сети. Перезапустите программу. Если ошибка повторится - обратитесь за помощью в службу технической поддержки.
    </Solution>
  </Exception>
  <Exception ExceptionClass ="EOleException" ErrorCode="-2147217900" Action="None" URI="http://kbase.ist.ugtu.net/Links.aspx?id=6" Severity="Warning" HelpTopic="General.htm">
    <Summary>
      Ошибка данных.
    </Summary>
    <Caused>
      Введены неверные данные.
    </Caused>
    <Solution>
      Проверьте введенные данные. Возможно, эта информация уже содержиться в системе и произошло дублирование данных. В подробных сведениях может содержаться информация о том, какое поле заполнено неверно.
    </Solution>
  </Exception>
<Exception ExceptionClass ="EOleException" ErrorCode="-2146827284" Action="None" URI="http://kbase.ist.ugtu.net/Links.aspx?id=7" Severity="Warning" HelpTopic="General.htm">
    <Summary>
      Отсутствуют права на работу с приложением Microsoft Excel.
    </Summary>
    <Caused>
      Недостаточно прав на создание документа. Возможно, пользователь, от имени которого запущено приложение, не зарегистрирован на локальной машине.
    </Caused>
    <Solution>
      Обратитесь к Вашему системному администратору.
    </Solution>
  </Exception>
  <Exception ExceptionClass ="EDatabaseError" Action="Restart" URI="http://kbase.ist.ugtu.net/Links.aspx?id=8" Severity="Warning" HelpTopic="General.htm">
    <Summary>
      Ошибка базы данных.
    </Summary>
    <Caused>
      Ошибка в программе.
    </Caused>
    <Solution>
      Попробуйте выполнить действие повторно. Если ошибка повторится  - перезапустите программу. Если ошибка часто повторяется - следует сообщить о ней в отдел разработки и сопровождения.
    </Solution>
  </Exception>
  <Exception ExceptionClass ="EDBEditError" Action="None" URI="http://kbase.ist.ugtu.net/Links.aspx?id=9" Severity="Warning" HelpTopic="General.htm">
    <Summary>
      Неверный ввод данных!.
    </Summary>
    <Caused>
      Введено значение, не удовлетворяющее заданному условию.
    </Caused>
    <Solution>
      Проверьте введённое значение.Вы можете отменить ввод в поле, нажав ESC.
    </Solution>
  </Exception>
</Exceptions>  