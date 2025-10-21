// Your first program in Kotlin
 
fun main() {
    println("Hello, world!")
}

fun main() {
    println("Hello, Android!")
}

fun main() {
    println("Hello, Android!")
    println("Hello, Android!")
}

fun main() {
    println("I'm")
    println("Learning")
    println("Kotlin")
}

fun main() {
    println("Monday")
    println("Tuesday")
    println("Wednesday")
    println("Thursday")    
    println("Friday")
}

fun main() {
    println("Tomorrow is rainy")
}

fun main() {
    println("There is a chance of snow")
}

fun main() {
    println("Cloudy")
    println("Partly Cloudy")
    println("Windy")
}

fun main() {
    println("How's the weather today?")
}






//Create and use variables in Kotlin

fun main() {
    val count: Int = 2
    val unreadCount = 5
    val readCount = 100
    println(count)
    println("You have $count unread messages")
    println("You have ${unreadCount + readCount} total messages in your inbox.")
}

fun main() {
    val numberOfPhotos = 100
    val photosDeleted = 10
    println("$numberOfPhotos photos")
    println("$photosDeleted photos deleted")
    println("${numberOfPhotos - photosDeleted} photos left")
}

fun main() {
    var cartTotal = 0 // val dont allows change variable value
    cartTotal = 20
    println("Total: $cartTotal")
}

fun main() {
    var count = 10
    println("You have $count unread messages.")
    count = count + 1 // count++ or count--
    println("You have $count unread messages.")
}

fun main() {
    val trip1: Double = 3.20
    val trip2: Double = 4.10
    val trip3: Double = 1.72
    val totalTripLength: Double = trip1 + trip2 + trip3
    println("$totalTripLength miles left to destination")
}

fun main() {
    val nextMeeting = "Next meeting: "
    val date = "January 1"
    val reminder = nextMeeting + date + " at work"
    println(reminder)
}

fun main() {
    val notificationsEnabled: Boolean = false
    println("Are notifications enabled? " + notificationsEnabled)
}




// Create and use functions in Kotlin

fun main() {
    birthdayGreeting()
}
fun birthdayGreeting() {
    println("Happy Birthday, Rover!")
    println("You are now 5 years old!")
}


fun main() {
    birthdayGreeting()
}
fun birthdayGreeting(): Unit {
    println("Happy Birthday, Rover!")
    println("You are now 5 years old!")
}


fun birthdayGreeting(): String {
    val nameGreeting = "Happy Birthday, Rover!"
    val ageGreeting = "You are now 5 years old!"
    return "$nameGreeting\n$ageGreeting"
}
fun main() {
    val greeting = birthdayGreeting()
    println(greeting) // println(birthdayGreeting())
}


fun birthdayGreeting(name: String): String {
    val nameGreeting = "Happy Birthday, $name!"
    val ageGreeting = "You are now 5 years old!"
    return "$nameGreeting\n$ageGreeting"
}
fun main() {
    println(birthdayGreeting("Rover"))
}


fun birthdayGreeting(name: String, age: Int): String {
    val nameGreeting = "Happy Birthday, $name!"
    val ageGreeting = "You are now $age years old!"
    return "$nameGreeting\n$ageGreeting"
}
fun main() {
    println(birthdayGreeting("Rover", 5))
    println(birthdayGreeting("Rex", 2))
}


fun birthdayGreeting(name: String = "Rover", age: Int): String {
    return "Happy Birthday, $name! You are now $age years old!"
}
println(birthdayGreeting(age = 5))
println(birthdayGreeting("Rex", 2))


// Practice Problems

fun main() {
    println("Use the val keyword when the value doesn't change. ")
    println("Use the var keyword when the value can change.")
    println("When you define a function, you define the parameters that can be passed to it. ")
    println("When you call a function, you pass arguments for the parameters.")
}

fun main() { 
    println("New chat message from a friend")
}

fun main() {
    val discountPercentage = 20
    val item = "Google Chromecast"
    val offer = "Sale - Up to $discountPercentage% discount on $item! Hurry up!"
    println(offer)
}

fun main() {
    val numberOfAdults = 20
    val numberOfKids = 30
    val total = numberOfAdults + numberOfKids
    println("The total party size is: $total")
}

fun main() {
    val baseSalary = 5000
    val bonusAmount = 1000
    val totalSalary = "${baseSalary + bonusAmount}"
    println("Congratulations for your bonus! You will receive a total of $totalSalary (additional bonus).")
}

fun main() {
    val firstNumber = 10
    val secondNumber = 5    
    val result = firstNumber + secondNumber
    println("$firstNumber + $secondNumber = $result")
}

fun main() {
    val firstNumber = 10
    val secondNumber = 5
    val thirdNumber = 8
    
    val result = add(firstNumber, secondNumber)
    val anotherResult = add(firstNumber, thirdNumber)

    println("$firstNumber + $secondNumber = $result")
    println("$firstNumber + $thirdNumber = $anotherResult")
    
    val resultSubstract = substract(firstNumber, secondNumber)
    val anotherResultSubstract = substract(firstNumber, thirdNumber)
    
	println("$firstNumber - $secondNumber = $resultSubstract")
    println("$firstNumber - $thirdNumber = $anotherResultSubstract")
}
fun add(firstNumber: Int, secondNumber: Int): Int {
    val result = firstNumber + secondNumber 
    return (result)
}
fun substract(firstNumber: Int, secondNumber: Int): Int {
    val result = firstNumber - secondNumber 
    return (result)
}

fun main() {
    val firstUserEmailId = "user_one@gmail.com"

    println(displayAlertMessage(emailId = firstUserEmailId))
    println()

    val secondUserOperatingSystem = "Windows"
    val secondUserEmailId = "user_two@gmail.com"

    println(displayAlertMessage(secondUserOperatingSystem, secondUserEmailId))
    println()

    val thirdUserOperatingSystem = "Mac OS"
    val thirdUserEmailId = "user_three@gmail.com"

    println(displayAlertMessage(thirdUserOperatingSystem, thirdUserEmailId))
    println()
}
fun displayAlertMessage( operatingSystem: String = "Unknown OS", emailId: String ): String {
    return "There's a new sign-in request on $operatingSystem for your Google Account $emailId."
}

fun main() {
    val steps = 4000
    val caloriesBurned = pedometerStepsToCalories(steps); 
    println("Walking $steps steps burns $caloriesBurned calories") 
}

fun pedometerStepsToCalories(numberOfSteps: Int): Double {
    val caloriesBurnedForEachStep = 0.04
    val totalCaloriesBurned = numberOfSteps * caloriesBurnedForEachStep
    return totalCaloriesBurned
}

fun main() {
    println(functionToCompare( 200, 50 ))
}

fun functionToCompare ( timeSpentToday: Int, timeSpentYesterday: Int): Boolean {
    val result: Boolean = timeSpentToday > timeSpentYesterday
    return result
}
*/

fun main() {
    weatherCity( "Ankara", 27, 31, 82 )
    weatherCity( "Tokyo", 32, 36, 10 )
    weatherCity( "Cape Town", 59, 64, 2 )
    weatherCity( "Guatemala City", 50, 55, 7 )
}
fun weatherCity (city: String, lowTemperature: Int, highTemperature: Int, chanceOfRaining: Int) {
    println( "City: $city" )
    println( "Low temperature: $lowTemperature, High temperature: $highTemperature" )
    println( "Chance of rain: $chanceOfRaining%" )
    println()
}
