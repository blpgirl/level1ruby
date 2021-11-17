$textoImprimirGlobal = "Mi super variable"
class HolaMundo
  attr_accessor :names,:age

  def initialize(names = "World")
    @textoImprimirClase = "Mi variable de clase HolaMundo"
    $textoImprimirGlobal = "Modifique mi super variable"
    $textoImprimirGlobal << " y un poco mas" #como el variable += valor2 en php
    @names = names
  end

  #print some text and each character
  def sayHi(nombre)
    textoImprimir = "Hola mundo en Ruby, soy #{nombre}" #comentario de una linea, mi primera variable
    puts textoImprimir #put something in the screen
    puts $textoImprimirGlobal
    puts @textoImprimirClase

    textoImprimir = "Separar"
    textoImprimir.each_char { |c| print c
      print "\n" #salto de linea, me separa e imprime caracteres
    }
  end

  #do some math
  def calculate(number1, number2)
    suma = number1+number2
    resta = number1-number2
    multiplicacion = number1*number2
    division = (number1/number2).to_f
    exponente = 2**3 #esto es 2 elevado a la 3 potencia 2^3 entonces 2*2*2 en este caso
    raiz = Math.sqrt(9) #raiz cuadrada de 9
    puts suma
    puts resta
    puts multiplicacion
    puts division
    puts exponente
    puts raiz
  end

  #try if sentence and case sentence
  def conditional()
    hora = 12
    if hora < 15 or hora > 24 and !(hora == 0)
      puts "Entre al if"
    else
      puts "esta entre 15 a 24 o es cero"
    end

    edad = 20
    respuesta = case edad
    when 0..11 then "it's a child"
    when 12..17 then "it's a teenager"
    when 18..29 then "it's an adult"
    else "it's old"
    end
    print respuesta << "\n"

    sustantivo = "facebook"
    respuesta = case sustantivo
    when "facebook", "twitter" then "redes sociales"
    when "chrome", "firefox" then "navegadores"
    else "no es conocido"
    end
    print respuesta
  end

  # doing a for and a foreach
  def say_hi_everyone

    3.times do
      print 'Welcome '
    end

    if @names.nil?
      puts "..." #si nulo, no saludamos a nadie...
    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!" #no era un arreglo entonces saluda normal
    end
  end

  # Say bye to everybody
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Join the list elements with commas
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end

  #Hash
  def rating_books
    books = {}
    books["Gravitys Rainbow"] = :splendid
    books["The deep end"]  = :abysmal #simbolo si usas mucho la palabra y significa algo en tu app
    books["Living colors"] = :mediocre

    puts books.length

    ratings = Hash.new {0}

=begin
  si quiero solo los valores puedo hacer
  books.values.each { |valor|
  o si quiero solo las llaves
  books.keys.each { |id|

  Nota aparte: estos comentarios siempre sin indentacion
=end
    books.each { |key, rate|
      ratings[rate] += 1
      puts "The book rated was #{key}"
    }

    return ratings #ruby returns automatically the last value used so I can just write ratings without the return
  end

  def advanced_each
    books = {"William Shakespeare"=>{"1"=>{"title"=>"The Two Gentlemen of Verona", "finished"=>1591}, "2"=>{"title"=>"The Taming of the Shrew", "finished"=>1591}, "3"=>{"title"=>"Henry VI, Part 2", "finished"=>1591}, "4"=>{"title"=>"Henry VI, Part 3", "finished"=>1591}, "5"=>{"title"=>"Henry VI, Part 1", "finished"=>1592}, "6"=>{"title"=>"Titus Andronicus", "finished"=>1592}, "7"=>{"title"=>"Richard III", "finished"=>1593}, "8"=>{"title"=>"Edward III", "finished"=>1593}, "9"=>{"title"=>"The Comedy of Errors", "finished"=>1594}, "10"=>{"title"=>"Love's Labour's Lost", "finished"=>1595}, "11"=>{"title"=>"Love's Labour's Won", "finished"=>1596}, "12"=>{"title"=>"Richard II", "finished"=>1595}, "13"=>{"title"=>"Romeo and Juliet", "finished"=>1595}, "14"=>{"title"=>"A Midsummer Night's Dream", "finished"=>1595}, "15"=>{"title"=>"King John", "finished"=>1596}, "16"=>{"title"=>"The Merchant of Venice", "finished"=>1597}, "17"=>{"title"=>"Henry IV, Part 1", "finished"=>1597}, "18"=>{"title"=>"The Merry Wives of Windsor", "finished"=>1597}, "19"=>{"title"=>"Henry IV, Part 2", "finished"=>1598}, "20"=>{"title"=>"Much Ado About Nothing", "finished"=>1599}, "21"=>{"title"=>"Henry V", "finished"=>1599}, "22"=>{"title"=>"Julius Caesar", "finished"=>1599}, "23"=>{"title"=>"As You Like It", "finished"=>1600}, "24"=>{"title"=>"Hamlet", "finished"=>1601}, "25"=>{"title"=>"Twelfth Night", "finished"=>1601}, "26"=>{"title"=>"Troilus and Cressida", "finished"=>1602}, "27"=>{"title"=>"Sir Thomas More", "finished"=>1604}, "28"=>{"title"=>"Measure for Measure", "finished"=>1604}, "29"=>{"title"=>"Othello", "finished"=>1604}, "30"=>{"title"=>"All's Well That Ends Well", "finished"=>1605}, "31"=>{"title"=>"King Lear", "finished"=>1606}, "32"=>{"title"=>"Timon of Athens", "finished"=>1606}, "33"=>{"title"=>"Macbeth", "finished"=>1606}, "34"=>{"title"=>"Antony and Cleopatra", "finished"=>1606}, "35"=>{"title"=>"Pericles, Prince of Tyre", "finished"=>1608}, "36"=>{"title"=>"Coriolanus", "finished"=>1608}, "37"=>{"title"=>"The Winter's Tale", "finished"=>1611}, "38"=>{"title"=>"Cymbeline", "finished"=>1610}, "39"=>{"title"=>"The Tempest", "finished"=>1611}, "40"=>{"title"=>"Cardenio", "finished"=>1613}, "41"=>{"title"=>"Henry VIII", "finished"=>1613}, "42"=>{"title"=>"The Two Noble Kinsmen", "finished"=>1614}}}

    # selecciona los libros acabados en el year 1591, imprime el titulo y los cuenta
    year = 1591
    shakespeare_books = books["William Shakespeare"]
    shakespeare_books.select { |k, v|
      v["finished"] == year
    }.each { |key, val|
      puts val["title"]
    }.count

    #me va a retornar el conteo automaticamente que fue el ultimo valor usado
  end

  def print_plays(year_from, year_to)
    books = {"William Shakespeare"=>{"1"=>{"title"=>"The Two Gentlemen of Verona", "finished"=>1591}, "2"=>{"title"=>"The Taming of the Shrew", "finished"=>1591}, "3"=>{"title"=>"Henry VI, Part 2", "finished"=>1591}, "4"=>{"title"=>"Henry VI, Part 3", "finished"=>1591}, "5"=>{"title"=>"Henry VI, Part 1", "finished"=>1592}, "6"=>{"title"=>"Titus Andronicus", "finished"=>1592}, "7"=>{"title"=>"Richard III", "finished"=>1593}, "8"=>{"title"=>"Edward III", "finished"=>1593}, "9"=>{"title"=>"The Comedy of Errors", "finished"=>1594}, "10"=>{"title"=>"Love's Labour's Lost", "finished"=>1595}, "11"=>{"title"=>"Love's Labour's Won", "finished"=>1596}, "12"=>{"title"=>"Richard II", "finished"=>1595}, "13"=>{"title"=>"Romeo and Juliet", "finished"=>1595}, "14"=>{"title"=>"A Midsummer Night's Dream", "finished"=>1595}, "15"=>{"title"=>"King John", "finished"=>1596}, "16"=>{"title"=>"The Merchant of Venice", "finished"=>1597}, "17"=>{"title"=>"Henry IV, Part 1", "finished"=>1597}, "18"=>{"title"=>"The Merry Wives of Windsor", "finished"=>1597}, "19"=>{"title"=>"Henry IV, Part 2", "finished"=>1598}, "20"=>{"title"=>"Much Ado About Nothing", "finished"=>1599}, "21"=>{"title"=>"Henry V", "finished"=>1599}, "22"=>{"title"=>"Julius Caesar", "finished"=>1599}, "23"=>{"title"=>"As You Like It", "finished"=>1600}, "24"=>{"title"=>"Hamlet", "finished"=>1601}, "25"=>{"title"=>"Twelfth Night", "finished"=>1601}, "26"=>{"title"=>"Troilus and Cressida", "finished"=>1602}, "27"=>{"title"=>"Sir Thomas More", "finished"=>1604}, "28"=>{"title"=>"Measure for Measure", "finished"=>1604}, "29"=>{"title"=>"Othello", "finished"=>1604}, "30"=>{"title"=>"All's Well That Ends Well", "finished"=>1605}, "31"=>{"title"=>"King Lear", "finished"=>1606}, "32"=>{"title"=>"Timon of Athens", "finished"=>1606}, "33"=>{"title"=>"Macbeth", "finished"=>1606}, "34"=>{"title"=>"Antony and Cleopatra", "finished"=>1606}, "35"=>{"title"=>"Pericles, Prince of Tyre", "finished"=>1608}, "36"=>{"title"=>"Coriolanus", "finished"=>1608}, "37"=>{"title"=>"The Winter's Tale", "finished"=>1611}, "38"=>{"title"=>"Cymbeline", "finished"=>1610}, "39"=>{"title"=>"The Tempest", "finished"=>1611}, "40"=>{"title"=>"Cardenio", "finished"=>1613}, "41"=>{"title"=>"Henry VIII", "finished"=>1613}, "42"=>{"title"=>"The Two Noble Kinsmen", "finished"=>1614}}}

    books["William Shakespeare"]
      .select { |k, v|
        year_from <= v["finished"] &&
        year_to   >= v["finished"]
      }.each { |k, v|
        puts "#{v["title"].ljust(30)} #{v["finished"]}" #imprime el titulo justificado izquierda con 30 caracteres de espacio y luego el year terminado
      }
  end

end

=begin
Comentarios de varias lineas
Cree una clase con un unico metodo que imprime un texto
y abajo estoy inicializando la clase y llamando el metodo
el gets es solo para que no finalice la aplicacion despues de imprimir el texto
=end
objeto = HolaMundo.new()
objeto.sayHi("Leyla")
objeto.calculate 2,3 #works same as calculate(2,3), ruby doesn't care about parentesis
objeto.conditional
puts objeto.rating_books #print the return of the method
objeto.names = ["Albert", "Brenda", "Charles", "Dave", "Engelbert"]
objeto.say_hi_everyone
objeto.say_bye
puts objeto.advanced_each
objeto.print_plays(1600, 1605)
#puts HolaMundo.instance_methods

#without a class, just code
def hungry?(time_of_day_in_hours)
  result = true
  if time_of_day_in_hours < 12
    puts "Me not hungry"
    result = false
  else
    puts "Me hungry"
  end
  result
end

def eat_an(what)
  puts "Me eat #{what}\n"
end

eat_an 'apple' if hungry?(14) #lunch time, i'm hungry therefore call eat_an method
eat_an 'apple' if hungry?(10) #early morning, not hungry
