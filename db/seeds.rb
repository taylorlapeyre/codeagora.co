# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Language.create([
  {name: 'Ruby', description: %Q{
def hello(name)
  puts "Hello, \#{name}!"
end
  }.strip},

  {name: 'C++', description: %Q{
void hello(string name) {
  cout << "Hello, " << name << "!";
}
  }},

  {name: 'Python', description: %Q{
def hello(name):
  print("Hello, {}!".format(name))
}.strip},

  {name: 'Bash', description: %Q{
hello() {
  echo Hello, $1
}
  }.strip},

  {name: 'Clojure', description: %Q{
(defn hello [name]
  (println "Hello, " name "!"))
}.strip},

  {name: 'C', description: %Q{
void hello(char *name) {
  while (*name) {
    putchar(*name);
    name++;
  }
}
  }.strip},

  {name: 'Javascript', description: %Q{
var hello = function(name) {
  console.log("Hello, " + name + "!");
}
  }.strip},

  {name: 'Java', description: %Q{
public static void hello(String name) {
  System.out.println("Hello, " + name + "!");
}
  }.strip},

  {name: 'PHP', description: %Q{
<?php
  function hello(name) {
    echo "Hello, " . name . "!";
  }
?>
  }.strip},
])
