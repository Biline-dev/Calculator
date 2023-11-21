echo "exo : $1";
jflex  "$1.lex"
mv Yylex.java CompilationFiles
cup  "$1.cup"
mv parser.java sym.java CompilationFiles

javac -cp .:java-cup-11b-runtime.jar CompilationFiles/parser.java CompilationFiles/sym.java CompilationFiles/Yylex.java

echo "Starting program ... "
echo "Started : "
echo
cd CompilationFiles
java -cp .:../java-cup-11b-runtime.jar parser 