############################################################################
## user info
## https://api.torn.com/user/107581?selections=&key={api}&comment=TryItPage
############################################################################

############################################################################
## race info
## https://api.torn.com/v2/racing/{raceid}/race?key={api}
############################################################################

(import spork/argparse)
(import spork/json)
(import jurl)

(def finalTable @{})
(var outPutPath nil)


(def arg-params
  [(string "Generate csv from a race containing userid, username, position and faction name. \n"
           "Usage: janet torn-races.janet -a torn-api-key -i race-id -o output-file")
   "api-key" {:kind :option
                :short "a"
              :required true
              :help "Api-key from torn"}
   "race-id" {:kind :option
                   :short "i"
                 :required true
                 :help "Race id"}
   "output-file" {:kind :option
                 :short "o"
               :required true
               :help "Absolut path for output file"}])

(defn getData
  [api raceId outputFile]
  (var jsonData (jurl/slurp (string "https://api.torn.com/v2/racing/" raceId "/race?key=" api)))
  (var data (json/decode jsonData))
  (var tableRaces (data "race"))
  (var arrResult (tableRaces "results"))
  (each item arrResult (do
                         (var
                          {"driver_id" driver_id
                           "position" position} item)
                         (put finalTable driver_id position)))
  (spit outputFile (string "userId,name,position,faction_name" "\n") :a)
  (loop [[driver_id position] :in (pairs finalTable)]
    (var jsonUserData (jurl/slurp (string "https://api.torn.com/user/" driver_id "?selections=&key=" api "&comment=HT-Races")))
    (var userData (json/decode jsonUserData))
    (pp (userData "name"))
    (pp ((userData "faction") "faction_name"))
    (spit outputFile (string driver_id ","(userData "name") "," position "," ((userData "faction") "faction_name") "\n") :a)
    )
  )

(defn main
  [&]
  (def res (argparse/argparse ;arg-params))
  (if res
    (getData (get res "api-key") (get res "race-id") (get res "output-file"))
    (os/exit 1))
  )
