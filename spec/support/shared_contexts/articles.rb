# encoding: utf-8

shared_context 'Articles' do
  let!(:article_from_the_second_page) { create(:article,
    category: 'Альтернативна енергетика',
    section: 'Енергія вітру',
    title: 'Коли вітер не дме')
  }

  let!(:about_libya) { create :article,
    language: 'uk',
    category: 'Енергія',
    section: 'Енергетика',
    title: 'Що очікує Лівію?',
    author: 'By. John C.K.',
    body: <<-HTML.gsub(/^ {6}/, '')
      <p>42 роки жорстокої правління лівійського полковника Каддафі закінчилася, але майбутнє виглядає темним вперед для країни, насамперед, відомий експорту нафти і тероризмом.</p>

      <p>Одне можна сказати напевно - міжнародні нафтові компанії будуть пакувати польоти в Тріполі, щоб укладати угоди за шматок дії.</p>

      <p>Лівія залишається джокером, і тільки 25 відсотків нафти потенційної території країни досліджуваної. Якими б не були недоліки режиму Каддафі, він тримав у їжакових рукавицях над своєї нафтової промисловості, і що, в поєднанні з міжнародними санкціями за його терористичні спонукання, в основному тупик розвитку ресурсів країни, так багато на шляху, що розвиток іранської нафтохімічної галузі був в значній мірі позбавлена ​​іноземного капіталу. Зрештою, вони не називали в 1996 році американське законодавство &quot;Закон Іран-Лівія Санкції&quot; (ОСА) ні за що. У вересні 2006 року ОСА був перейменований Закон про санкції проти Ірану (ISA), а Каддафі поводився себе більш, але збиток енергетичної інфраструктури країни до того часу глибоко і системно.</p>

      <p>Лівійська економіка залежить насамперед від доходів від нафтового сектора, які сприяють близько 95 відсотків експортних надходжень, 25 відсотків ВВП і 80 відсотків державних доходів. Все це для захоплень тепер.</p>

      <p>До початку конфлікту в лютому, Лівія експортувала близько 1,3-1,4 мільйона барелів на добу з виробництва оцінюється в приблизно 1790000 барелів на день з високоякісної, легкої нафти, з яких приблизно лише 280 тисяч барелів на добу були споконвічно споживаних . Але поточне виробництво є горезвісний просто крапля в морі. Лівія володіє найбільшими доведеними запасами нафти в Африці з 42 млрд барелів нафти і більше 1,3 трлн кубометрів природного газу, за найскромнішими оцінками.</p>

      <p>Тепер, що бойові дії, мабуть більш, питання про видобуток нафти в Лівії буде швидко рухатися фронт і центр у міжнародних інтересів.</p>

      <p>19 жовтня Міжнародне енергетичне агентство чиновника Девід Файф сказав в Парижі, що, незважаючи МЕА офіційний вважає, що Лівія може бути насосних близько 1 млн. барелів на день до кінця 2012 року, фракція його 1790000 барелів на день виходу передпідсилювача військових дій, все оцінки майбутньої продукції Лівії є &quot;постріл в темряві&quot;, перш ніж додати, що є &quot;багато логістичні, експлуатаційні та пов&#39;язані з безпекою виклики&raquo;, щоб подолати, перш ніж повне виробництво відновлюється. Після початку військової інтервенції, до вересня вихід лівійської нафти скоротилася до жалюгідні 100 тисяч барелів на день.</p>

      <p>У той час як Національна перехідна рада Лівії зробив невизначені ознаки того, що він буде дотримуватися діючих контрактів нафти і природного газу в даний час, це не виключає Національна перехідна рада від майбутніх реструктуризацій термінів нафтових і газових контрактів &quot;, а тим більше підписання нових.</p>

      <p>Крім того, поки він не навчився говорити diplomatese, Національна перехідна глава Ради Мустафа Абдель Джаліль посилався на те, що Національна перехідна рада буде приділяти більше уваги реконструкції і розподілі нафтових контрактів у країнах, які підтримали їх повстання, помітивши, що країни будуть винагороджені &quot;згідно підтримку&raquo; повстанців - це означає, члени НАТО Європейська коаліція матиме всередині треку, зокрема, як і раніше початку бойових Європа отримала понад 85 відсотків експорту сирої Лівії.</p>

      <p>У таких міркувань, один з ясних переможців буде Італії Ente Nazionale Idrocarburi SpA, більш відомий під абревіатурою ENI, який бачив до конфлікту Лівію припадає 15 відсотків виробництва ENI в.</p>

      <p>Основні програвши в такій ситуації будуть ті країни, які тримали проти військового втручання, в першу чергу Російської Федерації та Китаю. З 2005 року російське держава перспективі газовий монополіст Газпром інвестував $ 200 млн у розвідку енергії в Лівії навіть експортера державні озброєнь Rosobornekhsport продав Каддафі протягом мільярдів в озброєннях до ембарго на поставки зброї було накладено по Лівії Радою Безпеки ООН в березні багато з яких були згодом розгорнута проти сил НАТО і лівійських повстанців, це факт, без сумніву, не вислизнуло від Національної перехідної членів Ради. Державне інформаційне агентство Росії ІТАР-ТАСС вважає, що Росія може втратити стільки, скільки $ 10 млрд в бізнесі, якщо Національний перехідний рада оскаржує законність чинних контрактів.</p>

      <p>Китай, який має масивний масляний африканський слід в іншому місці в Судані та Анголі, отримав нікчемні 150000 барелів нафти на день з лівійської нафти, усього три відсотки своїх імпорту сирої. 23 серпня, коли його запитали про можливість Національний перехідний рада перегляду контракти заступник глави китайського міністерства торгівлі Міністерства торгівлі, Вень Zhongliang бушував, &quot;що я можу сказати в чотирьох словах: Вони не посміють, вони не посміють змінити будь-який контракти &quot;.</p>

      <p>Крім питання нафти, другий темної ситуація майбутній склад пост-Каддафі уряду Лівії. Минулого місяця глава тимчасового уряду Лівії, голова Національної перехідної ради Мустафа Абдель Джаліль, у своєму першому публічному виступі в Тріполі сказав своїй аудиторії, &quot;Ми прагнемо правової держави, процвітання і той, де шаріат є основним джерелом для законодавства, а це вимагає багато речей і умови &quot;.</p>

      <p>Як Шаріат Ісламський закон і майбутній уряд Лівії, безсумнівно, містять багато ісламських елементів, навряд чи ймовірно, що в майбутньому адміністрація країни будуть готові підписувати &quot;Мила&quot; операції з іноземними енергетичними компаніями на умовах більш вигідних або навіть такі сприятливі, як Gadaffi підписаний з іноземними енергетичними компаніями, як популістські Ісламська державних елементів, безсумнівно, буде вимагати більшої фінансової прозорості, ніж це передбачено адміністрації Каддафі.</p>

      <p>Але Каддафі мертвий, і так Лівії і Національний перехідний рада ввести чудовий новий світ з дещо вказівників. Що стосується інтервенцію Заходу в бурхливі нафтової політиці Близького Сходу, згадується те, що відповідно до Washington Post журналіст Боб Вудворд, державний секретар США Колін Пауелл сказав президенту Джорджу Бушу в влітку 2002 року про можливі наслідки військових акція в Іраку в тому, що згодом стало відомо як &laquo;Кераміка Barn&quot; Правило - &quot;ви порушите його, ви є його власником.&quot;</p>

      <p>Брюссель і Вашингтон мають більшу кількість близькосхідних керамічних черепків, щоб підмести.</p>
    HTML
  }

  let!(:about_tripoli) { create :article,
    language: 'uk',
    category: 'Енергія',
    section: 'Енергетика',
    title: 'Щось підозріле в Тріполі',
    author: 'By. Daniel J. Graeber',
    body: <<-HTML.gsub(/^ {6}/, '')
      <p>Ще на початку 2011 року, члени Ради Безпеки ООН не було проблеми, отримуючи дозвіл через цей уповноваженого військової сили в Лівії нібито для захисту цивільного населення від нападів сил, вірних силачів Муаммара Каддафі. За рік до цього, законодавці по обидві сторони Атлантики були суперечки про те, хто зробив те, що і чому з точки зору раку потерпілого Локербі бомбардувальника. Це шотландський рішення звільнити його, залежно від того, який законодавця США ви говорили с, був прив&#39;язаний до угоди BP для буріння на нафту в Лівії. Незважаючи переломів у новому тимчасового уряду в Тріполі, і повідомлення про відновилися протестів, рішення італійського уряду, щоб спокійно обговорити торговельні відносини припускає щось не зовсім правильно на шляху західні союзники забрати свої бої.</p>

      <p>ОПЕК торік відмовилися зрушити з місця, коли економічні Песимісти передбачали кінець світу, тому що війна в Лівії штовхав ціни на нафту до максимумів, які погрожували якихось міфічних відновлення економіки десь у світі. Міжнародне енергетичне агентство вступили в гру, але до січня, нафтові компанії в Лівії говорили рівень виробництва був більш-менш нормалізувалася, враховуючи всі обставини. Італійська енергетична компанія Eni, яка мала досить хороші контракти з урядом Каддафі, щасливо штампувати нафти з родовищ у Лівії, які залишилися, для всіх намірів і цілей, неушкодженим кращий НАТО мали запропонувати. Навіть найпесимістичніші аналітики нафту здивовані тим, як швидко Лівійська видобуток нафти знову в мережі.</p>

      <p>У жовтні, повстанські сили імовірно сказав чорт з ним і вважав, що вони б врятувати всіх багато часу, вбиваючи Каддафі самостійно. МУС, здавалося, не заперечував дуже і тепер перелом Тимчасовий уряд зробило небагато, щоб турбуватися італійський уряд достатньо, щоб вирішити у вихідні дні, що бізнес був на підйомі в пост-Каддафі Лівії.</p>

      <p>До початку конфлікту, група демократичних законодавців у Вашингтоні випустив звіт про 123-сторінковий стверджуючи рішення 2009, щоб звільнити Локербі Абдельбасет аль-Меграхі був прив&#39;язаний до комерційних інтересів нафтових з Тріполі. Британський запит у разі знайдено ВР бере участь у якійсь мірі в рішенні 2009, тому що, відповідно до Нью-Йорка сенатор Чак Шумер, Лондон хотів нафтовий контракт, щоб пройти через з урядом Каддафі.</p>

      <p>Так де були ті ж самі сенатори, коли було оголошено в листопаді, що Абдуррахман Бен Yezza був призначений в якості нового міністра нафти Лівії? Він колишній голова Eni нафтової компанії, спільного підприємства між італійської енергетичної компанії та Лівії National Oil корпорації Чому немає фурор, коли Eni головний виконавчий директор Паоло Скароні став першим виконавчим від масляного мажор для відвідування, коли він відправився в Тріполі в Січень? Якщо на те пішло, де демократи в США?</p>

      <p>Це здається досить лукавих, щоб на одному сидять рук і дебатів, який засуджує Сирії в Раді Безпеки протягом 10 місяців, поки він взяв, що, через кілька тижнів, щоб отримати один через Лівії? Був Лівія Каддафі якось дозрів для збору? Був Лівійська резолюція занадто хитрий для цих набридливих росіян?</p>

      <p>Італія і Лівія протягом вихідних підписали лист, що роз&#39;яснює, двостороннє координації з метою захисту своїх кордонів і нафтових установок. Примушує задуматися, хто розробляє те, що в який європейської енергетичної компанії в якості носіїв бойових США попрямувати в західній іранського узбережжя.</p>
    HTML
  }

  let!(:about_opec) { create :article,
    language: 'uk',
    category: 'Енергія',
    section: 'Сира нафта',
    title: 'ОПЕК розвалюється по швах'
  }

  let!(:about_oil) { create :article,
    language: 'uk',
    category: 'Світова політика',
    section: 'Близький Схід',
    title: 'Граючи з нафти і вогню',
    author: 'By. Claude Salhani',
    body: <<-HTML.gsub(/^ {6}/, '')
      <p>Війна в Сирії приймає несподіваний поворот - і потенційно небезпечний. Вже сочилася до Туреччини з низкою нападів сирійських сил по обидва боки кордону зростаючих і вибуху двох величезних бомб автомобілів на турецькому прикордонному місті Рейханли близько двох тижнів тому є реальний ризик сьогодні побачити війна розширити в двох інші сусіди Сирії; Ліваном та Ізраїлем.</p>

      <p>Як ситуація змінилася на користь президента Сирії Башара Асада в останні дні з боїв за ключової стратегічної міста на ліванському кордоні відбувається на користь урядових сил, дві основні інгредієнти, які могли б розширити конфлікт виткали свій шлях в умовах кризи.</p>

      <p>По-перше, це зараз очевидний факт, що ліванський шиїтський рух Хезболла, відкрито підтримує сирійський уряд. Хоча це було вже добре документований факт, бої на кордоні півночі Лівану приносить його у відкриту, як шиїтської міліції, відповідно до Аль-Джазіра, постраждав щонайменше 27 загиблих, але їх участь у битві за місто має доведено, що життєво важливо для сирійського уряду та інструментальна за перемогу.</p>

      <p>У відповідь на шиїтів, що рухаються в, щоб допомогти алавітів сили Асадом, (алавіти бути відгалуження шиїзму), натовпу ліванських сунітів, як повідомляється, вступив в боротьбу і перетнули кордон із Сирією, щоб допомогти своїм одновірцям. Крім того, важкі зіткнення спалахнули в північній ліванської портовому місті Тріполі, де суніти бойовики зіткнулися з алавітів прихильників президента Асада.</p>

      <p>Такий поворот подій перетворює сирійський конфлікт в сектантську війну з сунітами і шиїтами відкрито воювати один з одним на основі їх релігійної, а не політичної належності.</p>

      <p>І другий президент Асад прекрасно розуміє, що ця перемога є лише тимчасовим, враховуючи, що припливи війни часто зміщуватися назад і вперед, як в будь-якому конфлікті. Асад також знає, що чим довше ця війна затягнеться, тим менше ймовірність його шанси на перемогу як шанси чітко укладені проти нього, особливо якщо він відкрито стає релігійна війна. Однак, якщо конфлікт раптово змінити темп і стає більш регіональної одиниці, то пан Асад, можливо, відчуває, що він може мати більше шансів на перемогу у війні, хоча навіть якщо це означає вітрильний спорт в незвіданою політичних водах.</p>

      <p>Це могло б пояснити, чому після 40 років затишшя на ООН-контрольованого Голанських висот, що відокремлює Ізраїль від Сирії сталося раптове виверження в понеділок.</p>

      <p>Висоти були зайняті Ізраїлем у червні 1967 долі арабо-ізраїльської війни. Технічно Сирія була в стані війни з ізраїльтянами з 1948 року, але Дамаск зробив підписати угоду про перемир&#39;я з Ізраїлем, за посередництва тодішнього держсекретаря США Генрі Кіссінджер у зв&#39;язку з наслідками у жовтні 1973 арабо-ізраїльської війни, або, як його Відомо, в Ізраїлі, війни Судного дня.</p>

      <p>Переміщаючи єврейську державу в конфлікт Сирія сподівається, що рух буде сплатити арабів до його підтримці і змістити баланс громадянської війни твердо на його користь. Як і його батько Хафез, Башар часто грали в &quot;Ізраїль карту&quot; крик арабських розчарування і невдоволення - навіть якщо час від часу більш використовуватися, якщо не зловживати, - але це, тим не менш завжди дають позитивні результати для уряду.</p>

      <p>Чи повинен уряд в Сирії знайти себе у стані війни з Ізраїлем, інші арабські країни, такі як багатій нафтою Катару і Саудівської Аравії - двох найгарячіших прихильників опозиції - доведеться нелегко підтримувати свою підтримку опозиції в той час як уряд бореться Ізраїль .</p>

      <p>Водночас Ізраїль опиниться в чимось пов&#39;язані, стикається з дуже складною головоломкою: Атака з боку режиму Асада, Ізраїль буде змушений відповісти. Проте, Ізраїль вважає за краще мати нинішній режим в Ізраїлі успіху, а не мати країну наступної осені двері в руки ісламістів. Дійсно, Ізраїль буде між молотом і ковадлом: чи повинен він мстити сирійських урядових сил і тому грають прямо в п&#39;єс Асада, і послабити опозиційні сили, таким чином, відбувається в протиріччі з усіма політики, описаних в США, Європейському Союз і ряд арабських країн? Або він має мстити, допомагаючи опозицію і тим самим, встановивши грунт для незвіданою політичних водах?</p>

      <p>Сцена для наступного акту в Сирійській війни тепер встановлений з акторами, реквізит (нафти і зброї) і все, що необхідно для вибухонебезпечної фіналу.</p>
    HTML
  }

  let!(:about_libya_ru) { create :article,
    language: 'ru',
    category: 'Энергия',
    section: 'Энергетика',
    title: 'Что ожидает Ливию?',
    author: 'By. John C.K.',
    body: <<-HTML.gsub(/^ {6}/, '')
      <p>42 года правления жестокого ливийского полковника Каддафи закончилась, но будущее выглядит темным вперед для страны, в первую очередь известна для экспорта нефти и терроризма.</p>

      <p>Одно можно сказать наверняка - международные нефтяные компании будут паковать полеты в Триполи, чтобы сократить сделок на часть действия.</p>

      <p>Ливия остается джокером, и лишь 25 процентов нефти территорией потенциал страны изучены. Какими бы ни были недостатки режима Каддафи, он держал плотно делать на своей нефтяной промышленности, и это, в сочетании с международными санкциями для своих террористических наклонностях, в основном тупик развитие ресурсов страны, много на пути, что развитие нефтехимического сектора Ирана была в значительной степени лишенные иностранного капитала. В конце концов, они не называли в 1996 году американским законодательством &quot;Ирана и Ливии наказаниях&quot; (ОСА) ни за что. В сентябре 2006 года был переименован ILSA закон о санкциях против Ирана (ISA), а Каддафи вел себя сам больше, но ущерб энергетической инфраструктуры страны к тому времени был глубокий и системный характер.</p>

      <p>Ливийская экономика зависит прежде всего от доходов нефтяного сектора, который приходится примерно 95 процентов доходов от экспорта, 25 процентов ВВП и 80 процентов государственных доходов. Все это можно ухватить сейчас.</p>

      <p>До начала конфликта в феврале, Ливия экспортировала около 1,3-1,4 млн. баррелей в день от производства оценивается примерно в 1790000 баррелей в сутки высококачественной, легкой нефти, из которых около 280 000 простых баррелей в день, были исконно потребляемого . Но в настоящее время продукции является пресловутый просто капля в море. Ливия имеет крупнейшие доказанные запасы нефти в Африке с 42 млрд. баррелей нефти и более 1,3 триллиона кубических метров природного газа, по самым скромным подсчетам.</p>

      <p>Теперь, когда боевые над видимому, вопрос о добыче нефти Ливии будет быстро перемещаться в центре комнаты и международных интересов.</p>

      <p>19 октября Международного энергетического агентства Дэвид Файф официальных заявил в Париже, что, несмотря официальным оценкам МЭА, что Ливия может быть насосные около 1 млн. баррелей в день к концу 2012 года, часть его 1790000 баррелей в день выхода предусилителя военные действия, все Оценки будущих выходных Ливии являются &quot;выстрел в темноте&quot;, прежде чем добавить, что есть &laquo;много логистических, эксплуатационных и связанных с этим проблем безопасности&quot;, чтобы преодолеть, прежде чем полное производство восстанавливается. После начала военной интервенции, к сентябрю ливийской добычи нефти сократилась до жалких 100 000 баррелей в день.</p>

      <p>В то время как Национальный переходный совет Ливии сделал расплывчатые признаки того, что она будет соблюдать текущие нефть и газовые контракты в настоящее время, это не исключает Национального переходного совета от будущих переговоров о пересмотре условий нефтегазовых контрактов &quot;, а тем более подписания новых.</p>

      <p>Кроме того, пока он не научился говорить diplomatese, Национальный переходный голова совета Мустафа Абдель Джалиль ссылался на то, что Национальный переходный совет будет уделять больше внимания реконструкции и распределении нефтяных контрактов в страны, которые поддерживали их восстания, отметив, что страны будут быть вознаграждены &quot;согласно поддержку&raquo; повстанцев - это означает, европейские члены НАТО коалиции будет иметь внутреннюю дорожку, в частности, как и до начала боевых действий Европа получила более 85 процентов экспорта нефти Ливии.</p>

      <p>При таких соображений, один из явных победителей будет Италии Ente Nazionale SpA Idrocarburi, более известный под аббревиатурой ENI, которая видела начала конфликта Ливию приходится 15 процентов общего объема продукции ЭНИ.</p>

      <p>Основные проигравшие в таком сценарии будут те страны, которые держался против военного вмешательства, в первую очередь России и Китая. С 2005 года русская государственная газовая монополия Газпром инвестировал $ 200 млн в исследования энергии в Ливии даже как государственный экспортер оружия Rosobornekhsport продал Каддафи за миллиарды в вооружениях, прежде чем эмбарго на поставки оружия, введенных против Ливии в Совете Безопасности ООН в марте многие из которых были Впоследствии развернуты против сил НАТО и ливийским повстанцам, факт, несомненно, не потеряли на членов Национального переходного совета. Россия в государственное информационное агентство ИТАР-ТАСС считает, что Россия может потерять до 10 миллиардов долларов в бизнесе, если Национальный переходный совет оспаривает законность действующих контрактов.</p>

      <p>Китай, который имеет массивный жирной Африканский след в других местах в Судане и Анголе, получила ничтожные 150 000 баррелей в день ливийской нефти, всего три процента от общего объема добычи импорта. 23 августа, отвечая на вопрос о возможности Национального переходного совета перезаключении контрактов заместитель главы китайского министерства торговли Департамента торговли США, Вэнь Zhongliang выпалил: &quot;Я могу сказать, в четырех словах: Они не посмеют, они не посмеют изменить любой контрактов. &quot;</p>

      <p>Помимо нефтяной вопрос, другая темная ситуация будущем составе пост-Каддафи Правительство Ливии. В прошлом месяце глава временного правительства Ливии, председатель Национального переходного совета Мустафа Абдель Джалиль, в своем первом публичном выступлении в Триполи сказал своей аудитории, &quot;Мы стремимся правового государства, процветание и тот, где шариат является основным источником законодательства, а это требует многие вещи, и условий &quot;.</p>

      <p>Как Шариат исламского права и будущее правительство Ливии, несомненно, содержат много исламских элементов, вряд ли вероятно, что будущее руководство страны будет готов подписать &quot;возлюбленной&quot; сделки с иностранными энергетическими компаниями на условиях более выгодных, или даже такие благоприятные, как Каддафи подписал с иностранными энергетическими компаниями, а популистские правительства исламских элементов, несомненно, потребует большей финансовой прозрачности, чем это предусмотрено администрации Каддафи.</p>

      <p>Но Каддафи мертв, и так и Ливии Национальный переходный совет введите дивный новый мир с несколькими указателями. Что касается западного вмешательства в турбулентном нефтяной политике на Ближнем Востоке, можно вспомнить, что в соответствии с Washington Post журналист Боб Вудворд, госсекретарь США Колин Пауэлл сказал президент Джордж Буш в летом 2002 года о возможных последствиях военных действий в Ираке в том, что впоследствии стало известно как &quot;Pottery Barn&quot; Правило - &quot;вы нарушите его, вы являетесь его владельцем&quot;.</p>

      <p>Брюссель и Вашингтон имеют большее количество ближневосточных осколки керамической подмести.</p>
    HTML
  }

  let!(:recent_articles) { create_list(:article, 10) }
end
