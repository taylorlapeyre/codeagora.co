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

  {name: 'Assembly', description: %Q{
.text
.global hello

hello:
  movb %ecx, 8(%esp)
  movb $72, (%eax, 1)
  movb $101, (%eax, 2)
  movb $108, (%eax, 3)
  movb $108, (%eax, 4)
  movb $111, (%eax, 5)
  movb $44, (%eax, 6)
  movb $32, (%eax, 7)

  xor %ebx, %ebx
  LOOP:
    movb (%ecx, %ebx), (%eax)
    inc %ebx
    cmp $ebx, $0
    je DONE
  jmp LOOP
  DONE:
    ret
  }.strip},

  {name: 'Text', description: %Q{
Hello, name!
  }.strip},

  {name: 'HTML', description: %Q{
<h1>Hello, name!</h1>
  }.strip},

  {name: 'CSS', description: %Q{
.hello-name {
  visibility: visible;
}
  }.strip},

  {name: 'Diff', description: %Q{
diff --git a/hello.txt b/hello.txt
index c3516ab..c44d7f2 100644
--- a/hello.txt
+++ b/hello.txt
@@ -1,11 +1,30 @@ hello:
-hello, ...
+hello, whatever your name is
  }.strip},

  {name: 'Go', description: %Q{
func hello(name string) string {
  fmt.Println("Hello, " + name + "!")
}
  }.strip},

  {name: 'Lua', description: %Q{
function hello(name)
  print("Hello, " .. name .. "!")
end
  }.strip},
])
