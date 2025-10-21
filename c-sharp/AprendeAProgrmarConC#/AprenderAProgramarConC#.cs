using System;
					
public class Program
{
	public static void Main()
	{
		Console.WriteLine("Hello World");
	}
}

// variables 
	bool(true and false), string(""), char(''), decimal (10.2M), double(10.2), float(1.2F), int (number)

// operadores de comparacion
	== (valores iguales), 1= (valores distintos), (< and >), ( <= and >= )

// operadores booleanos
	&& (and), || (or), ! (not)


//estructuras de control (if)
	if ( variable > variable2) { do something }
	if ( !variable < variable2 ) { do something } else if { do other thing } else { nah }

// estructuras de control (switch)
	switch(value) { 
		case condition: do something; break;
		case condition2: do something; break; 
		...; 
		default: do something; break; }

// bucle while, do while y for
	while (condition) {do something};
	do (do something) while (condition);
	for ( int i=0; i < some; i++ ) { condition }
	
// function
	void hi() { do something }

// array

	string[] beers = new string[5];
	beers[0] = "michelle";
	
// PROGRAMACION ORIENTADA A OBJETOS

class Sale {
	public decimal Total;
	public string Customer;
	
	public Sale(decimal total, string customer) {
		this.decimal = decimal;
		thisl.customer = customer;
	}
	
	public string GetInfo(){
		string info = "El total es" + total;
		return info;
	}
}

// herencia

class Water { public string name; } 
clasa beer: Water { public string Style };
beer mybeer = new beer();

class Water { 
	public string name;
	
	public Water(string name) {
		this.name = name;
	}
}

class Beer: Water {
	public string style;
	public Beer (string name, string style ): base(name) {
		this.style = style;
	}
}

// encapsulamiento

class Tax {
	public decimal amount;
	private decimal _rate;
	
	public Tax(decimal amount, decimal rate) {
		this.amount = amount;
		_rate = rate;
	}
	
	public decimal getTotal() {
		return amount * _rate;	
	}
}

// encapsulamineto en herencia

class People {
	protected string name;
	
	public People (string name) {
		this.name = name;
	}
	
	protected string GetDescription() {
		return  "El nombre es" + name;
		
	}
}

class Engineer: People {
	private string _profession;
	
	public Engineer(string name, string profesion): base(name) {
		_profession = profesion;
	}
	
	public string GEtInfo() {
		return "la profesion es " + _profesion + " " + GetDescription();
	}
	
	public string GetName() {
		return name
	}
}

//  campos y propiedaddes 

class Sale {
	private decimal total;
	public decimal Total {
		get { return total };
		set { 
			total = value
			if (total < 0) { total = 0 }
		}
	}
}

// static

class Beer{
	public static int Quantity = 0;
	public Beer() {
		Quantity++;
	}
	public static void Show(){
		do somwthing
	}
}

var myBeer1 = new Beer();
var myBeer2 = new Beer():
var myBeer3 = new Beer():
Console.WriteLine (Beer.Quantity); => 3
Beer.Show();

// sobrecarga

class Math {
	public int add (int x, int y) { return x + y };
	public int add (int x, int y, int z) { return x + y + z };
	public int add (string x, string y) { return int.Parse(x) + int.Parse(y) }
}

// sobreescritura

class sale{
	protected decimal _total;
	public virtual void add (decimal amount) { _total += amount }
}

class SaleWithTax: sale { 
	private decimal _txt;
	public decimal total {
		get { return _total }
	}
	
	public SaleWithTax(decimal tax) { _tax = tax }
	
	public override void add (decimal amount) {
		base.add(amount * _tax);
	}
}

// CONCEPTOS IMPORTANTES

// parametros por referencia

Beer myBeer = new Beer();
myBeer.Name = "Erdinger"
ChangeName(myBeer, "Corona");

void ChangeName(Beer myBeer, string newNameBeer) {
	myBeer.Name = newNameBeer;
}

class Beer {
	public string Name {get; set;}
}

// parametros por valor

int num = 8;
bool isAlive = true;
Change(num, isAlive);

void Change(int num, bool isAlive) {
	num = 9; isAlive = false;
}

// inmutabilidad

Beer myBeer = new Beer("Stout");

strig name = myBeer.Name;
myBeer.Name = name;

class Beer {
	public string Name {get;} // no se puede editar ya que no tiene get
	public Beer(string name) {
		Name = name;
	}
	public readonly string Name;
}

class Sale {
	public decimal Total {get; set;}
	public Sale(decimal total) {
		Total = total;
	}
	public Sale AddAmountInmutable(decimal amount) {
		Sale newSale = new Sale(this.Total)
		newSale.Total += amount;
		return newSale
	}
	
	public Sale AddAmountMutable(decimal amount) {
		Total += amount;
		return this;
	}
	
}

// azucar sintactica

public void some() => Console.Write("algo pasa");
string message = $"Hola {name} de {country}";

// PROGRAMACION FUNCIONAL

int[] numbers = new int[10]{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
numbers.Where(n => n%2 == 0).ToList().ForEach( n => Console.WriteLine(n))

// funciones de primera clase

void Hi() => Console.Write("Hola Mundo")
var hello = Hi;
hello()

// funcion de orden superior

string Message() => "un mensaje externo"

void DoSomethign ( Func<string> fun ) {
	Consolw.WriteLine( fn() );
}

DoSomething( Message );

//  funcion no pura

Datetime AddSeconds(int seconds) {
	DateTime date = DateTime.Now>AddSeconds(seconds);
	return date;
}

// funcion pura

var now = DateTime.Now;
DateTime DateAddSeconds(DateTime date, int seconds){
	date.AddSeconds(seconds);
	return date;
}

// funciones lambda

var some = () => Console.WriteLine("Hola mundo");
some();

var add = (int a, int b) => a + b;
int res = add(1,2);

var mul = (int a, int b) => {
	int res = a * b;
	return res;
}

// tipado de funciones

Func<string> message = () => "es un mensaje";
Func<int, string> hi = (int number) => $"el numero es {number}";

var messagees = (Func<string> fn) => {
	console.Write(fn());
}

messages( () => "Mensaje central" )

Action<string> print = (string msg) => Console.Write(msg);
print("Un Mensaje");

Predicate<int> isPair = (int number) => number % 2 == 0;
if (isPair(2)) { Console.Write("es par") }

// Recursividad

int[] numbers = new int[10] {1,2,3,4,5,6,7,8,9,10};
void print(int[] numbers, int index = 0) {
	if (index > numbers.Length) {
		return ;
	}
	Console.Write(numbers[index]);
	print(numbers, index + 1);
}

print(numbers);

// Closure (clausura)

Action<string> print() {
	int counter = 0;
	return (string message) => {
		counter ++;
		Console.Write($"ejecucion {counter} {message}");
	}
}

// Currificación

Func<float, Func<float, float>> Mul() {
	return (float a) => {
		return (float b) => a * b;
	}
}
func<float, func<float, float> mull = (a) => (b) => a * b;

// POO avanzada

// Polimorfismo por herencia

class A{
	public virtual string GetClassName() => "Soy A";
}
class B : A{
	public override string GetClassName() => "Soy B";
}
class C: A{
	public override string GetClassName() => "Soy C" ;
}

// Interfaces

interface IProduct {
	public decimal Price {get; set;}
	public string Name {get; set;}
	
	public string GetInfo();
}

class Beer: IProduct {
	public decimal Price {get; set;}
	public string Name (get; set;)
	public string GetInfo() => $"La informacion es {Name} ${Price}";
}

interface IDrinkable {
	public decimal Quantity {get; set;}
	public bool HasAlcohol {get; set;}
}

class Beer: IProduct, IDrinkable {
	public decimal Price {get; set;}
	public string Name { get; set; }
	public decimal Quantity { get; set);
	public bool HasAlchol { get; set); 
	publid string GetInfo() {
		return $"La información es {Name} ${Price} " + "y es un producto bebible con {Quantity} ml";
	}
}


class VideoGameConsole: IProduct {
	public decimal Price {get; set;}
	public string Name {get; set;}
	public string GetInfo() {
		return $"La información de la consola es {Name} ${Price}";
	}
}

var nintendoSwitch = new VideoGameConsole() {
	Name = "Nintendo Switch",
	Price = 2000
}

var nintendoSwitch = new VideoGameConsole()
{
	Name = "Nintendo Switch",
	Price = 2000
};
void Show (IProduct product)
{
	Console.WriteLine (product.GetInfo());
}
Show(nintendoSwitch);

// Genericos 

int[] numbers = new int[5] {1, 2, 3, 4, 5}
string[] names = new string[5]{"Héctor", "Pedro", "Ana", "Paula", "Juan"}

void Show<T> (T[] data) {
	for (int i=0; i<data.Length; i++) {
		Console.Write(data[i])
	}
}

Show<int>(numbers);
Show<string>(names);

//

class MyList<T> {
	private T[] data;
	private index = 0;
	
	public MyList(int length) => data = new T[length];
	
	public void Add(T item) {
		data[index++] = item;
	}
	public void Show() {
		for (int i=0; i<data.length; i++) {
			Console.Write(data[i])
		}
	}
}

var countries = new MyList<string>[5];
countries.Add("Mexico");

// Foreach

var numbers = new List<int>(1,2,3);
foreach(var n in numbers) { Console.Write(n) }

// ABSTRACCION

// clase abstracta

abstract class Liquid {
	public string Name {get; set;}
	public string Quantity {get; set;}
	public string GetInfo() => $"liquido {Name}"
	public abstract string GetCompleteInfo();
}

class Beer: Liquid {
	public double Alcohol {get; set;}
	public string Style {get; set;}

	public override string GetCompleteInfo() => $"Una cerveza {Name} con {Alcohol} de alcohol"
}

// Excepciones

try {
	var numbers = new int[5] {1,2,3,4,5}
	Console.Write(numbers[10]);
} catch (Exception e) {
	Console.Write("Posicioni invalida del array")
} finally {
	Console.Write("Siempre se ejecuta la linea")
}

try {
	string text = File.ReadAllText("myfile.txt");
	Console.Write(text);
} catch (FileNotFoundException ex) {
	Console.Write("El archivo no existe");
} catch (Exception ex) {
	Console.Write("Ha ocurrido un problema")
} 

class BeerNotFoundException: Exception {
	public BeerNotFoundException(string message): base (message) {}
}

class Beer 
{
	private int _quantity;
	public int Quantity {
		get {return _quantity;}
		set { 
			if (value <= 0) {
				throw new BeerNotFoundException("No hay cerveza");
			}
			_quantity = value;
		}
	}
}

// JSON

class Beer {
	public string Name {get; set;}
	public decimal Price {get; set;}
}

var beer = new Beer() {
	Name = "Delirium Tremens";
	Price = 100;
}
// en json seria

{
	"Name": "Delirium Tremens",
	"Price": 100
}

using System.Text.Json;

string jsonBeer = JsonSerializer.Serialize(beer);
Console.WriteLine(jsonBeer);

string beerJson = @"{""Name"": ""Delirium tremens"", ""Price"": 100}"
Beer myBeer = JsonSerializer.Deserialize<Beer>(beerJson)
Console.Write(myBeer.Name);