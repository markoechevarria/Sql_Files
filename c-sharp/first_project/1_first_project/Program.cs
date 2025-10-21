using System.ComponentModel.Design;
using System.Diagnostics;
using System.Diagnostics.Metrics;
using System.Runtime.InteropServices.Marshalling;

namespace _1_first_project
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // 1. Hello world

            Console.WriteLine("Write your name: ");
            string value = Console.ReadLine();

            Console.WriteLine($"Your name is {value}");

            // 2. Variables

            string characterName = "marko";
            int age = 20;
            Console.WriteLine("There once a man named" + characterName);
            Console.WriteLine("He was " + age + " years old.");

            // 3. Data types

            string phras = "United International university"; // string is for more than one character

            char grade = 'A'; // only one character

            int year = 2025; // integer numbers
            float height = 1.70F; // single-precision floating-point type
            double randomnumber = 134133.1415;  // double-precision floating-poitn type
            decimal distance = 1200.313M; // high-precision decimal type

            bool isMale = true; // true or false

            Console.WriteLine(isMale);

            //  4. Working with strings

            string phrase = "United" + "International" + "University";

            Console.WriteLine(phrase.Length);

            Console.WriteLine(phrase.ToUpper());
            Console.WriteLine(phrase.ToLower());

            Console.WriteLine(phrase.Contains("International"));

            Console.WriteLine(phrase[5]);

            Console.WriteLine(phrase.IndexOf("International"));
            Console.WriteLine(phrase.IndexOf("o"));
            Console.WriteLine(phrase.IndexOf("21"));

            Console.WriteLine(phrase.Substring(7));
            Console.WriteLine(phrase.Substring(7, 4));

            // 5. Working with numbers

            int new_value = 5 + 10; // 5/10 or 5/2
            int num = 6;
            num++;
            num--;

            Math.Abs(-40);
            Math.Pow(3, 3);
            Math.Pow(3.5, 2);
            Math.Sqrt(36);
            Math.Max(10, 100);
            Math.Min(10, 100);
            Math.Round(9.61);

            // 6. Getting user input

            Console.WriteLine("Enter something");
            string name = Console.ReadLine();
            Console.WriteLine($"You enterded {name}");

            // 7. Building a calculator

            Console.WriteLine("Entered two numbers");
            int numero1 = Convert.ToInt32(Console.ReadLine());
            int numero2 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("You entered " + (numero1 + numero2));

            // 8. Building a Mad Lib

            // 9. Arrays 

            int[] luckyNumbers = { 1, 2, 3, 4, 5, 6 };
            string[] friends = { "marko", "percy", "juampi" };
            string[] friendsEmpty = new string[5];
            Console.WriteLine(friends[0]);

            friendsEmpty[2] = "Jhoncito";
            Console.WriteLine(friendsEmpty[0]);

            friendsEmpty[2] = "New Jhoncito";
            Console.WriteLine(friendsEmpty[2]);


            // 10. Methods

            static void User(string name, int edad)
            {
                SayHey();
                Console.WriteLine($"Im the user {name} and im {edad} years old");
            }
            User("Joaqui", 20);

            static void SayHey()
            {
                Console.WriteLine("Hello");
            }

            // 11. Return Statement

            static int Sumar2Numbers(int n1, int n2)
            {
                int result = n1 + n2;
                return result;
            }

            int resultado = Sumar2Numbers(10, 10);

            // 12. If Statement

            bool isTall = false;
            bool isGood = false;
            int variable;

            if (isTall && isGood) //  && and ||
            {
                variable = 10;
            }
            else if (isTall && !isGood)
            {
                variable = 20;
            }
            else
            {
                variable = 0;
            }

            // 13. If Statement Continuing

            static int maxNumber(int a, int b)
            {
                if (a > b)
                {
                    return a;
                }
                else
                {
                    return b;
                }
            }

            static int maxNumberOfThree(int a, int b, int c)
            {
                if (a >= b && a >= c) { return a; }
                else if (b >= c && a >= c) { return b; }
                else { return c; }
            }

            // 14. Building A Better Calculator

            Console.WriteLine("Implement");

            // 15. Switch Statements

            static string GetDay(int day)
            {
                string dayName;
                switch (day)
                {
                    case 0: dayName = "Sunday"; break;
                    case 1: dayName = "Monday"; break;
                    case 2: dayName = "Tuesday"; break;
                    case 3: dayName = "Wednesday"; break;
                    case 4: dayName = "Thursday"; break;
                    case 5: dayName = "Friday"; break;
                    case 6: dayName = "Saturday"; break;
                    default: dayName = "invalid Day number"; break;
                }
                return dayName;
            }

            // 16. While Loops

            int index = 10;
            while (index > 0)
            {
                Console.WriteLine(index);
                index--;
            }

            // 17. Do While Loops

            int index2 = 10;
            do {
                Console.WriteLine(index2);
                index2--;
            } while (index2 > 0);

            // 18. Building A Guessing Game

            string secretWord = "Fahim";
            string guess = "";
            int guessCount = 0;
            int guessLimit = 3;
            bool outOfGuess = false;

            while (guess != secretWord && !outOfGuess)
            {
                if (guessCount < guessLimit)
                {
                    Console.Write("Enter your guessed word: ");
                    guess = Console.ReadLine();
                    guessCount++;
                }

                else
                {
                    outOfGuess = true;
                }

            }

            if (outOfGuess)
            {
                Console.Write("Ops! You LOST!");
            }
            else
            {
                Console.Write("Congratulations! You won!!!");
            }

            Console.ReadLine();

            // 19. For Loops

            int[] randomnumbers = { 4, 8, 15, 16, 23, 42 };

            for (int i = 0; i < randomnumbers.Length; i++)
            {
                Console.Write(randomnumbers[i]);
            }

            // 20. Building An Exponent Method

            static int GetPow(int baseNum, int powerNum)
            {
                int result = 1;

                for (int i = 0; i < powerNum; i++)
                {
                    result = result * baseNum;
                }
                return result;
            }

            // 21. 2D Arrays

            int[,] numberGrid =
            {
                {1,2}, {3,4}, {5,6}
            };

            Console.WriteLine(numberGrid[1,1]);

            int[,] MyArray = new int[2, 3];

            // 22. Comments

            /*
             * This is a multilineal comment
             */

            // 23. Exception Handling

            try
            {
                Console.Write("Enter a number: ");
                int num1 = Convert.ToInt32(Console.ReadLine());

                Console.Write("Enter another number: ");
                int num2 = Convert.ToInt32(Console.ReadLine());

                Console.WriteLine(num1 / num2);
            }
            catch (Exception e){
                Console.WriteLine(e.Message);
            }

            // 24. Classes & Objects

            Book myBook = new Book();
            myBook.title = "titleofbook";
            myBook.author = "authorofbook";
            myBook.pages = 100;

            Book book2 = new Book();
            book2.title = "Lord Of The Rings";
            book2.author = "Tolkein";
            book2.pages = 700;

            // 25. Object Methods

            Student joaqui = new Student("joaqui", "Accounting", 3.9);
            Student percy = new Student("Percy", "mostazology", 2.8);

            // 26. Getters & Setters

            Movie avengers = new Movie("the avengers", "Joss whedon", "PG-13");
            avengers.Rating = "Cat";
            Console.Write(avengers.Rating);

            // 27. Static Class Attributes

            Song holiday = new Song("Holiday", "Green Day", 200);
            Console.WriteLine(holiday.getSongCount()); // Console.WriteLine(holiday.songCount);

            // 28. Static Methods & Classes

            UsefulTools tool = new UsefulTools();
            UsefulTools.SayHi("marko"); // tool.SayHi("marko");

            // 29. Inheritance

            Chef chef = new Chef();
            chef.MakeSpecialDish();

            ItalianChef italianChef = new ItalianChef();
            italianChef.MakeSpecialDish();
        }
    }
}

class Book
{
    public string title ;
    public string author;
    public int pages;
}

class Student
{
    public string name;
    public string major;
    public double gpa;

    public Student(string aName, string aMajor, double aGpa)
    {
        name = aName;
        major = aMajor;
        gpa = aGpa;
    }

    public bool HasHonor()
    {
        if (gpa > 3.5)
        {
            return true;
        }
        return false;
    }
}

class Movie
{
    public string title; 
    public string director;
    private string rating;

    public Movie(string aTitle, string aDirector, string aRating)
    {
        title = aTitle;
        director = aDirector;
        rating = aRating;
    }

    public string Rating
    {
        get
        {
            return rating;
        }
        set
        {
            if (value == "G" || value == "PG" || value == "PG-13" || value == "R" || value == "NR")
            {
                rating = value;
            }
            else
            {
                rating = "NR";
            }
        }
    }

}

class Song
{
    public string title;
    public string artist;
    public int duration;
    public static int songCount = 0;

    public Song(string aTitle, string aArtist, int aDuration)
    {
        title = aTitle;
        artist = aArtist;
        duration = aDuration;
        songCount++;
    }

    public int getSongCount()
    {
        return songCount;
    }
}

class UsefulTools
{
    public static void SayHi(string name)
    {
        Console.WriteLine("Hwllo" + name + ". How are you?");
    }
}

class Chef
{
    public void MakeChicken()
    {
        Console.WriteLine("The chef makes chicken");
    }
    public void MakeSalas()
    {
        Console.WriteLine("The chef makes salad");
    }
    public virtual void MakeSpecialDish()
    {
        Console.WriteLine("the chef makes bbq ribs");
    }
}

class ItalianChef: Chef
{
    public void MakePasta()
    {
        Console.WriteLine("The chef make pasta");
    }
    public override void MakeSpecialDish()
    {
        base.MakeSpecialDish();
        Console.WriteLine("The chef makes chicken pasta");
    }
}