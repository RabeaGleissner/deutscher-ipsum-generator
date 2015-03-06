require 'sinatra'
require 'json'

get '/' do
  if request.xhr?
 
    paragraphs = number_of_paragraphs(params[:paragraph])
    user_output = replace_words(paragraphs, params[:strength])

  
    return [200, {'Content-Type' => 'application/json'}, JSON.generate(user_output)]
    end

  erb :index
end

def number_of_paragraphs(n)
  @paragraphs = PARAGRAPHS.shuffle[(0..n.to_i-1)]
end

def replace_words(paragraphs, strength)
  text = paragraphs.join.split( )

  case strength 

  when "strong"
        text.each_with_index.map{|e, i| i % 2 == 1 ? random_deutsch_word : e }
  when "medium"
        text.each_with_index.map{|e, i| i % 4 == 2 ? random_deutsch_word : e }
  when "light"
       text.each_with_index.map{|e, i| i % 6 == 2 ? random_deutsch_word : e }
  else
        puts "something is wrong"
  end 
end

def random_deutsch_word
  GERMAN.shuffle.first
end


GERMAN = ["schnell", "Wurst", "Frau Professor", "Ampelmännchen", "Ritter Sport", "Milka", "Herr Doktor", "Deutschland", "genau", "bitte", "Danke", "Bier", "Schnaps", "Prost", "Brezel", "Hallo", "Wie geht's",  "Spezi", "Faust", "Döner", "Berlin", "Hamburg", "Köln", "Aperol Spritz", "Hugo" "Club Mate", "Kreuzberg", "Juttensack", "Bretzel", "Guten Tag", "Zauberer", "Hochzeit", "Welt", "zu spät", "Die Toten Hosen", "Die Ärzte", "99 Luftballons", "Reise", "Weihnachten", "Audi", "Volkswagen", "Mercedes Benz", "Mozart", "Stuttgart", "Glühwein", "über", "schnell", "Wurst", "genau", "bitte", "danke", "Bier", "Schnaps", "Prost", "Brezel", "Helmut Kohl", "Angela Merkel", "Goethe", "Schadenfreude", "Kindergarten", "Meerschweinchen", "Guten Tag", "Vorsprung durch Technik", "Schwarzwälder Kirschtorte", "was machst du", "Fußballweltmeisterschaft", "Lebensabschnittsgefährte", "Bezirksschornsteinfegermeister", "Kaftfahrzeug-Haftpflichtversicherung", "Freude schöner Götterfunken", "Die unendliche Geschichte", "Grimms Märchen","Müller Rice", "Landjaeger", "Apfelstrudel", "Käsefondue", "Projektplanung", "Apfelschorle", "Oktoberfest", "Bratwurst", "Fußball", "Milchreis", "Ohrwurm", "Fernweh", "Weltschmerz", "Gesundheit", "Handschuh", "Eichhörnchen", "Currywurst", "Grossbritannien", "Hackfleisch", "Polizei", "Hockenheim", "Michael Schuhmacher", "Lukas Podolski", "Jürgen Klinsmann", "Krankenschwester", "Wiener Schnitzel", "Umsatzanalyse", "Nackenheim", "Reinheitsgebot", "Erbsenzähler", "Honigkuchenpferd", "Schmetterling", "Kirschkerne", "Handtasche", "Gemeinsamkeit", "Hörspiele", "Turnbeutel", "Warmduscher", "Frohsinn", "Autobahn", "Bildung", "Weltanschauung", "Zeitgeist", "Entschuldigung", "Heisenberg", "Mertesacker", "Mesut Özil", "Schweinsteiger", "Joachim Löw", "Flughafen", "Bahnhof", "Kartoffelkopf", "Pfannkuchen", "Freude schöner Götterfunken", "Die unendliche Geschichte", "Grimms Märchen", "Lebkuchen", "Schneewittchen", "Deutsche Mark", "Riesling", "Sauerkraut", "Anwendungsprogrammierschnittstelle", "Doppelscheren-Hubtischwagen", "Donaudampfschiffahrtsgesellschaftskapitän", "Siebentausendzweihundertvierundfünfzig", "Ich habe fertig", "Aufenthaltsgenehmigung", "Ich bin ein Berliner", "Sprechen Sie deutsch", "Rubin auf Schienen", "Mettwurst", "Rotwurst", "Knappwurst", "Wiener Würstchen", "Aufschnitt"]

PARAGRAPHS = ["sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "deserunt dissentias has et. Tollit argumentum ius an. Saepe lobortis elaboraret per ne, nam eu probatus pertinax, impetus eripuit aliquando no sea. Diam scripserit no vis, eos meis suscipit ea. Eam ea offendit eleifend, ad blandit voluptatibus sed, ad eius consul sanctus vix. Cu quas legimus veritus vim.", "quo lucilius posidonium at, adhuc laboramus sadipscing per at, in mei ullum gloriatur. Id inermis recteque accommodare sed. Id nec assum argumentum, te melius erroribus vix. Nec ut amet causae iriure, prodesset gloriatur mea ut. Dicunt virtute suscipit per no. At nemore scaevola eum. An regione malorum efficiendi ius.", "meliore persecuti et mel. Te oratio utamur vix. Exerci eloquentiam eu per. Principes complectitur eos no. His illud moderatius ut, at pro omnis minim epicurei, natum feugait mel ei. Sea purto singulis te.", "id latine indoctum complectitur pri, mea meliore denique nominavi id. Elitr expetenda nam an, his ei reque euismod assentior. Odio principes iracundia ex pri. Ut vel solum mandamus, quas natum adversarium ei ius, diam minim honestatis eum no."
]

