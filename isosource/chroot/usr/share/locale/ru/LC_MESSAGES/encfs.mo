��    �        �         �
     �
  ]   �
  .   O  1   ~  1   �  (   �  "     '   .     V  -   d  �   �  R   )      |    �     �     �  *   �  )   �     &     >  B   U  >   �  S   �  P  +     |  )   �  2   �     �  �     U   �  S   *     ~     �  6   �  &  �  `     �   s  �        �          #  /   =     m  .   �  #   �     �  j   �  <   [  (   �  )   �  *   �  )     /   @  .   p     �     �  .   �  3   �  +   3  &   _     �  #   �     �     �     �  #   �  (   #  #   L  (   p  4   �  #   �     �  �     �   �      �  *   �  �   �  �   �     %  �   4     �     �  l           m   :   �   ?   �   �  	!  :   �"  .   �"  9   #  ?   =#  0   }#  9   �#  K   �#     4$  *   Q$  4   |$  %   �$  8   �$  ;   %  $   L%  '   q%  *   �%  *   �%     �%  @   �%      8&  '   Y&     �&     �&  '   �&  '   �&  5   '  5   9'  !   o'  M   �'  !   �'     (  \   (     |(     �(     �(  {   �(     5)     F)  +   \)  4   �)  *  �)  8   �+  �   !,  N   �,  `   /-  v   �-  J   .  9   R.  S   �.     �.  Q   �.    Q/  �   j0  3   81    l1  %   z3  !   �3  I   �3  E   4  '   R4  #   z4  �   �4  N   5  �   n5  a  6  $   y8  I   �8  W   �8  #   @9  �  d9  �   ;  �   �;  H   ;<  )   �<  }   �<  �  ,=  �   !?  *  �?  �   A     �B  1   �B  -   C  T   EC  0   �C  ]   �C  Q   )D      {D  �   �D  n   ;E  I   �E  0   �E  �   %F  E   �F  �   
G  �   �G     .H  8   LH  ]   �H  m   �H  T   QI  9   �I  0   �I  6   J     HJ     gJ  "   �J  5   �J  >   �J  5   K  p   PK  k   �K  J   -L     xL  ?  �L  b  �M  ]   ;O  O   �O  1  �O  �   Q  2   �Q    R  (   #S  ,   LS  �   yS  ?   T  Y   \T  P   �T  �  U  W   �W  L   /X  L   |X  e   �X  N   /Y  r   ~Y  �   �Y  3   yZ  ;   �Z  L   �Z  :   6[  �   q[  f   \  t   h\  f   �\  h   D]  ^   �]     ^  k   &^  O   �^  ^   �^  <   A_  '   ~_  4   �_  :   �_  P   `  I   g`  9   �`  �   �`  2   �a  3   �a  �   �a     �b     �b  9   �b  �   �b     �c  %   �c  i   d  W   ~d     }      [   S   -      ]         1          l   )      +            x   c   y                   6      U          V      a   "   `   '          ,   H   0   n   L         =         ;          3   *       ~       v   X   u   9   E   g       t                 <   	                          
           :       K   w   k   I   %   z      e   Y          /   b   &   ^   Q   4       F   _           o   d           |   m   s   {              Z          >   8   f       D   p   7   5           T       G   �   A       i   P   (      q       r   W          j           !   ?   N   h   B   C       O                  #   R   .          J   @       \   M   $       2      -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show key   -- show undecodable filenames in the volume   --extpass=program	Use external program for password prompt

Example, to mount at ~/crypt with raw storage in ~/.crypt :
    encfs ~/.crypt ~/crypt

   --public		act as a typical multi-user filesystem
			(encfs must be run as root)
   --reverse		reverse encryption
   -v, --verbose		verbose: output encfs debug messages
  -i, --idle=MINUTES	Auto unmount after period of inactivity
  --anykey		Do not verify correct key is being used
  --forcedecode		decode data even if an error is detected
			(for filesystems using MAC block headers)
  (NOT supported)
  (using %i:%i:%i)
  -- Supports block sizes of %i to %i bytes  -- Supports key lengths of %i to %i bits  -- block size %i bytes  -- key length %i bits %s (root dir)
  -- displays information about the filesystem, or 
 -------------------------- WARNING --------------------------
 A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Add random bytes to each block header?
This adds a performance penalty, but ensures that blocks
have different authentication codes.  Note that you can
have the same benefits by enabling per-file initialization
vectors, which does not come with as great of performance
penalty. 
Select a number of bytes, from 0 (no random bytes) to 8:  Block Size: %i bytes Block Size: %i bytes + %i byte MAC header Block Size: %i bytes, including %i byte MAC header Build: encfs version %s Common Options:
  -H			show optional FUSE Mount Options
  -s			disable multithreaded operation
  -f			run in foreground (don't spawn daemon).
			Error messages will be sent to stderr
			instead of syslog.
 Config subversion %i found, but this version of encfs only supports up to version %i. Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. Each file contains 8 byte header with unique IV data.
 Enable block authentication code headers
on every block in a file?  This adds about 12 bytes per block
to the storage requirements for a file, and significantly affects
performance but it also means [almost] any modifications or errors
within a block will be caught and will cause a read error. Enable file-hole pass-through?
This avoids writing encrypted blocks when file holes are created. Enable filename initialization vector chaining?
This makes filename encoding dependent on the complete path, 
rather then encoding each path element individually. Enable per-file initialization vectors?
This adds about 8 bytes per file to the storage requirements.
It should not affect performance except possibly with applications
which rely on block-aligned file io for performance. EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error creating key
 Error decoding volume key, password incorrect
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 External chained IV disabled, as both 'IV chaining'
and 'unique IV' features are required for this option. Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 Filename encoding: "%s", version %i:%i:%i Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li MAC comparison failure, refusing to read Manual configuration mode selected. Missing one or more arguments, aborting. Must set password program when using mount-on-demand Name coding interface not supported New Encfs Password:  Note: requested single-threaded mode, but an idle
timeout was specified.  The filesystem will operate
single-threaded, but threads will still be used to
implement idle checking. Now you will need to enter a password for your filesystem.
You will need to remember this password, as there is absolutely
no recovery mechanism.  However, the password can be changed
later using encfsctl.

 Paranoia configuration selected. Passwords did not match, please try again
 Please choose from one of the following options:
 enter "x" for expert configuration mode,
 enter "p" for pre-configured paranoia mode,
 anything else, or an empty line will select standard mode.
?>  Please select a key size in bits.  The cipher you have chosen
supports sizes from %i to %i bits in increments of %i bits.
For example:  Remount failed Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Sorry, unable to locate cipher for predefined configuration...
Falling through to Manual configuration mode. Standard configuration selected. The configuration loaded is not compatible with --reverse
 The directory "%s" does not exist. Should it be created? (y,N)  The external initialization-vector chaining option has been
enabled.  This option disables the use of hard links on the
filesystem. Without hard links, some programs may not work.
The programs 'mutt' and 'procmail' are known to fail.  For
more information, please see the encfs mailing list.
If you would like to choose another configuration setting,
please press CTRL-C now to abort and start over. The filename encoding interface requested is not available The following cipher algorithms are available: The following filename encoding algorithms are available: The raw directory may not be a subdirectory of the mount point. The requested cipher interface is not available
 The requested filename coding interface is not available
 This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find nameio interface %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to instanciate cipher %s, key size %i, block size %i Unable to load or parse config file
 Unable to locate mount point, aborting. Unable to locate root directory, aborting. Unmounting filesystem %s due to inactivity Usage:
 Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using PBKDF2, with %i iterations Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Version 6 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 When specifying daemon mode, you must use absolute paths (beginning with '/') Zero length password not allowed
 directory %s does not exist.
 encfs [options] rootDir mountPoint -- [FUSE Mount Options]
valid FUSE Mount Options follow:
 encfs version %s encfsctl version %s filesystem block size:  fuse failed.  Common problems:
 - fuse kernel module not installed (modprobe fuse)
 - invalid options -- see usage message
 getopt error: %i invalid command: "%s" option '--public' ignored for non-root user truncate failure: read %i bytes, partial block of %i Project-Id-Version: encfs
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2012-02-14 05:32+0000
Last-Translator: Vyacheslav Sharmanov <Unknown>
Language-Team: Russian <ru@li.org>
Language: ru
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- изменить пароль для раздела   -- изменить пароль для тома, ввести пароль со стандартного потока ввода.

	Не выдает подсказки для ввода.   -- декодирует имя и печатает отрытый текст   -- декодирует файл и выводит его в стандартный поток   -- расшифровывает том и записывает результат по указанному пути   -- шифрует имя файла и выводит результат   -- вывести номер версии и выйти   -- показать информацию (Команда по умолчанию)   -- показать ключ   -- показать недекодируемые файлы на разделе   --extpass=program	Использовать внешнюю программу для отображения приглашения на ввод пароля

К примеру, подмонтировать ~/crypt к хранилищу в ~/.crypt :
    encfs ~/.crypt ~/crypt

   --public		вести себя как типичная многопользовательская файловая система

			(encfs должна быть запущена с правами root)
   --reverse		обратное шифрование
   -v, --verbose		подробный режим: вывод отладочных сообщений encfs
  -i, --idle=MINUTES	Автоматически размонтировать после указанного промежутка времени
  --anykey		Не проверять ключ на использование
  --forcedecode		расшифровать данные, даже если ошибки обнаружены
			(для файловых систем использующих MAC заголовки)
  (НЕ поддерживается)
  (использует %i:%i:%i)
  -- Поддержка размера блока от %i до %i байт  -- Поддержка ключа длиной от %i до %i бит  -- размер блока %i байт  -- длина ключа %i бит %s (корневой каталог)
  -- отобразить информацию о файловой системе, или 
 ----------------------- ПРЕДУПРЕЖДЕНИЕ -----------------------

 Найдена слишком старая версия файловой системы EncFS. 
Она не поддерживается этой версией EncFS.
 Добавлять случайные байты в каждый заголовок блока?
Данная опция уменьшит производительность системы, но будет гарантировать различные коды аудентификации. Также можно включить инициализацию
векторов на каждый файл, что не приведет к 
большому уменьшению производительности. 
Введите количество байт от 0 (нет случайных байт) до 8:  Размер блока: %i байт Размер блока: %i байт + %i байт MAC заголовок Размер блока: %i байт, включая %i байт MAC заголовок Сборка: encfs версия %s Общие опции:
  -H			показать необязательные опции монтирования FUSE
  -s			отключить мультипоточное выполнение
  -f			запустить в фоновом режиме (не порождать демона).
			Сообщения об ошибках будут посылаться на stderr
			вместо системного лога.
 Найдена %i версия конфигурационного файла, но эта версия поддерживается только с %i версии. Конфигурация завершена. Создана файловая система
с следующими свойствами: Создание нового зашифрованого раздела. Директория не создана. Каждый файл содержит 8-ми байтный заголовок с уникальными IV данными.
 Хранить в каждом блоке файла заголовки
проверки подлинности? Для хранения файла потребуется примерно
на 12 байтов больше на каждый блок, производительность значительно
уменьшится, зато [почти] любые изменения и ошибки внутри блока
будут обнаружены и вызовут ошибку чтения. Пропускать пустые места в файлах?
Это позволит избежать записи шифрованных блоков при создании
пропусков в файлах. Включить цепи инициирующих векторов для имён файлов?
Шифрование имён файлов будет зависеть от полного пути к файлу, 
вместо шифрования каждой части пути отдельно. Хранить в каждом файле начальный вектор?
Для хранения потребуется примерно на 8 байт больше на каждый файл.
Производительность не должна измениться, кроме, возможно,
производительности приложений, зависящих от поблочного ввода-вывода. Пароль EncFS:  Введите текущий Encfs пароль
 Введите новый Encfs пароль
 Введите номер соответствующий Вашему выбору:  Ошибка при создании ключа
 Ошибка расшифровки ключа раздела, неверный пароль
 Ошибка сохранения конфигурационного файла.
 Пример: 
%s info ~/.crypt
 Наружные цепочки IV отключены, так как это требуют
обе опции 'IV цепочки' и 'IV уникальные'. Ошибка генерации ключа раздела! Сообщите нам об этой ошибке. Данные файла IV связаны с именем файла IV.
 Шифр файла: "%s", версия %i:%i:%i Файловые имена зашифрованы с использованием режима сцепления вектора инициализации.
 Шифр файловой системы: "%s", версия %i:%i:%i Для дополнительной информации, обратитесь к страницам руководства encfs(1) Найден %i испорченный файл. Найдено %i испорченных файлов. Найдено %i испорченных файлов. В директории %s: 
 Недопустимое число параметров Неправильное количество аргументов для команды "%s" Внутренняя ошибка: Возникло исключение из главного цикла: %s Внутренняя ошибка: непредвиденное исключение Внутренняя ошибка: failed to exec program Внутренняя ошибка: fork() failed Внутренняя ошибка: socketpair() failed Неверный пароль
 Ошибка выбора. Размер ключа: %i бит Ошибка MAC сравнения в блоке %li Ошибка MAC сравнения, отмена чтения Выбрана ручная конфигурация. Отсутствуют один или более аргументов, аварийное завершение. При использовании mount-on-demand должен быть использован пароль Интерфейс именования не поддерживается. Новый пароль EncFS:  Заметка: запущен однопотоковый режим, но задано время простоя. Файловая система будет работать в однопотоковом режиме, но потоки будут осуществлять проверку времени простоя Введите пароль для доступа к файловой системе.
Запомните пароль, так как в случае утери его, 
будетневозможно востановить данные. Тем не менее
этот пароль можно изменить с помощью утилиты encfsctl.

 Выбрана конфигурация с максимальной секретностью. Пароли не совпадают, заново введите пароль
 Выберите одну из следующих букв:
 введите "x" для режима эксперта,
 введите "p" для режима максимальной секретности,
 любой другая буква для выбора стандартного режима.
?>  Выберите размер ключа в битах. Выбранный шифр поддерживает размер ключа от %i до %i бит с шагом в %i бит.
К примеру:  Неудалось перемонтировать. Выберите размер блока в байтах. Используемый шифр поддерживает размер от %i до %i байт с шагом в %i байт.
Нажмите enter для выбора по умолчанию (%i байт)
 Выбранный алгоритм "%s" Выбранный размер ключа:  Нельзя подобрать шифр для выбранной конфигурации...
Возврат в режим ручной конфигурации. Выбрана стандартная конфигурация. Загруженная конфигурация не сопоставима с --reverse
 Директория "%s" не существует. Создать ее? (y,N)  Опция наружной инициализации векторного связывания включена.
Эта опция запрещает использовать жесткие ссылки на файловой системе.
Без жестких ссылок некоторые программы не будут работать.
Не будут работать такие программы как 'mutt' и 'procmail'. 
Для более подробной информации читайте списки рассылки encfs.
Если вы желаете выбрать другие настройки
конфигурации то нажмите CTRL-C и начните все заново. Интерфейс шифрования файловых имен не доступен Доступны следующие алгоритмя шифрования: Доступны следующие алгоритмы зашифровки: Каталог не может быть подкаталогом точки монтирования. Интерфейс запрошенного шифра не доступен.
 Запрошенный интерфейс кодировки файлового имени не доступен.
 Данная версия EncFS не поддерживает файловые системы, созданные ранее 2004-08-13 Не могу создать директорию:  Не могу найти шифр %s, версии %i:%i:%i Не могу найти nameio интерфейс %s, версии %i:%i:%i Не могу найти выбранный шифр "%s"
 Нельзя инициализировать зашифрованную файловую систему. Проверте путь к ней.
 Не могу установить шифр %s, размер ключа %i, размер блока %i Невозможно загрузить или анализировать конфигурационный файл
 Не могу найти точку монтирования, аварийное завершение. Не могу найти корневую директорию, аварийное завершение. Размонтировка файловой системы %s из-за бездействия Применение:↵
 Использование: %s [options] rootDir mountPoint [-- [FUSE опции монтирования]] С использованием PBKDF2 с числом повторений: %i Используется блок файловой системы размером %i байт Используется ключ размером %i бит Повторите пароль EncFS:  Настройки версии 3 созданы %s
 Конфигурация 4 версии создана %s
 Конфигурация 5 версии создана %s (редакция %i)
 Настройка версии 6; создана %s (ревизия %i)
 Ключ раздела успешно обновлен.
 Когда запускается в режиме демона, необходимо указывать полные пути (начинающиеся с '/') Пустые пароли не разрешены
 директория %s не существует.
 encfs [options] rootDir mountPoint -- [FUSE опции монтирования]
Доступны следующие опции монтирования:
 encfs версия %s encfsctl версия %s размер блока файловой системы:  ошибка fuse. Возможные проблемы:
 - модуль ядра fuse не установлен (modprobe fuse)
 - не правильные опции -- cм. справку по использованию
 ошибка getopt: %i неверная команда: "%s" опция '--public' игнорируется для всех пользователей кроме root Ошибка усечения: прочитано %i байт, часть блока %i 