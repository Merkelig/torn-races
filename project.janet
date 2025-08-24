(declare-project
  :name "torn-races"
  :description ```race-to-csv ```
  :version "0.0.0"
  :dependencies ["spork" "jurl"])

(declare-source
  :prefix "torn-races"
  :source ["torn-races/torn-races.janet"])

(declare-executable
 :name "torn-races"
 :entry "torn-races/torn-races.janet"
 :install true)
