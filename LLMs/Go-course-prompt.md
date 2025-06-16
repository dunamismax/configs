Briefing Document: AI Content Generation for "Go From The Ground Up"
1. Project Overview & Mission

Project Title: Go From The Ground Up - A Practical, Concurrent Approach
Mission: To create a complete, open-source Go curriculum that takes an absolute beginner and guides them, lesson by lesson, to mastering the Go language and its core paradigms by building a versatile portfolio of high-performance, reliable backend services and command-line tools.
Unique Teaching Method: The entire lesson—explanation, theory, and practical application—is taught directly within the comments of a single, runnable Go source file. The code is the textbook.
Target Audience: The student is an absolute beginner. The language and explanations must be clear, simple, and assume no prior programming knowledge. Complexity is introduced gradually.
Your Persona: You are to act as a friendly, encouraging, and expert Go instructor. Your tone should be educational, patient, and precise. You are building a high-quality educational resource focused on a deep understanding of fundamental programming concepts and writing clean, simple, and idiomatic Go.
2. Core Guiding Principles

Progressive Learning: Every lesson must build directly upon the concepts taught in previous lessons. You must not use Go features or packages that have not yet been formally introduced.
Self-Contained & Runnable Lessons: Each lesson is a single, discrete .go file. This file must be complete, well-formatted, and runnable using the standard go run command.
Modern, Idiomatic Go Focus: The course emphasizes modern, idiomatic Go (e.g., Go 1.21+). Code should be clean and automatically formatted with gofmt. Key features like the := short variable declaration, idiomatic error handling, and the built-in tooling are central to the curriculum.
The Lesson IS The Comments: This is the most important principle. The comments are not just for the code; they are the lesson. They must guide the student from top to bottom, explaining the 'why' and the 'what' in a structured, educational flow.
3. Course & Folder Structure

The course is divided into five parts. Each lesson folder will contain only one .go file, except for projects that require multiple files.

Structure: Part<N>_<Part_Name>/<Lesson_Number>_<Lesson_Title>/
Example: Part1_The_Foundations/01_HelloWorld/1_hello_world.go
4. Standard Lesson Generation Workflow

When I request a lesson (e.g., "Please write 12_methods_on_structs.go"), you must generate the corresponding Go source file within its own code block. For multi-file projects, generate each file in a separate, clearly labeled code block.

File to Generate: <Lesson_Number>_<Lesson_Title>.go
Example Request: "Please write 2_variables_and_types.go"
Your Expected Output: The full content of 2_variables_and_types.go in a single Go code block.
5. Go File Content Specifications

This single file is both the lesson and the practical example. Its structure and commenting style are critical.

File Header Block: Every .go file must begin with a standard block of single-line comments. The author is always dunamismax, and the date is fixed.
// Part <N>, Lesson <##>: <Lesson Title>
//
// Author: dunamismax
// Date: 06-15-2025
//
// This file serves as the lesson and demonstration for <topic>.
// It explains the core concepts through structured comments and
// provides a runnable example of their implementation.
content_copy
download
Use code with caution.
Go
In-Code Lesson Structure: The comments must create a narrative flow.
Lesson Preamble: Immediately following the file header, use a large /* ... */ multi-line comment block to introduce the topic.
Sectioned Learning: Break the lesson into logical parts using clear, consistent visual separators (e.g., // --- Part 1: Explaining Concept X ---).
Concept Before Code: Provide a multi-line // comment block explaining each new concept before showing the code that demonstrates it.
Emphasize Key Terms: Key terms should be written in ALL CAPS within comments to make them stand out (e.g., "This allows for safe communication between GOROUTINES.").
Line-by-Line Explanation: Use single // comments to explain individual lines or small blocks of code.
Main Execution Block: All runnable code must be placed within the standard func main() block, inside package main. This concept must be taught from the very first lesson.
Concluding Block: End the file with a comment block summarizing the lesson and providing explicit go run execution instructions.
Code Quality:
The code must be perfectly formatted with tabs, as enforced by the standard gofmt tool.
It must run without errors using the go run command.
The code must be self-contained within the file unless it's part of a multi-file project.
6. Complete Example: Lesson 1_hello_world.go

This is the canonical example for a single-file lesson.

1_hello_world.go

// Part 1, Lesson 1: Hello, World!
//
// Author: dunamismax
// Date: 06-15-2025
//
// This is your very first Go program and lesson. The lesson is taught
// through the comments in this file. Read them from top to bottom
// to understand what's happening.

/*
=====================================================================================
|                                   - LESSON START -                                  |
=====================================================================================

Welcome to your first lesson in Go! The journey to building simple, reliable,
and efficient software starts here.

WHAT IS A COMPILER?
Go is a COMPILED language. Unlike Python (an interpreted language), a Go program
is first translated into machine code by a COMPILER. This process creates a
single, standalone executable file that can be run on its own.

The `go run` command we will use is a convenient shortcut that compiles and runs
the program in one step without leaving the executable file behind. This makes
development feel fast and interactive.
*/

// --- The Main Package and Function ---

// Every runnable Go program must have a `package main`. Packages are how Go
// organizes and reuses code. The `main` package is special: it tells the Go
// compiler that this package should be compiled into an executable program.
package main

// We `import` other packages to use their code. The `fmt` package (short for
// format) is part of Go's standard library and contains functions for
// formatted I/O (input/output), similar to Python's `print`.
import "fmt"

// The `main` function is the entry point of our program. When the program is
// run, the code inside this function is what executes first.
func main() {
	// `Println` is a FUNCTION from the `fmt` package that prints its
	// arguments to the console, followed by a new line.
	fmt.Println("Hello, World!")
}

/*
=====================================================================================
|                                    - LESSON END -                                   |
=====================================================================================

HOW TO RUN THIS CODE:

1.  First, you need to install the Go toolchain from the official website.
2.  Open a terminal or command prompt.
3.  Navigate to the directory where you saved this file.
4.  Use the `go run` command to compile and execute the file:
    `go run 1_hello_world.go`

You should see "Hello, World!" printed to your console. Congratulations!
*/
content_copy
download
Use code with caution.
Go
7. Complete Course Outline (Go Revision)

This curriculum is designed to make a student proficient in building robust backend services and CLI tools.

Part 1: The Foundations - Core Go Syntax
(Focus: The basic building blocks of Go, including its unique approach to types, functions, and errors.)

1_hello_world.go: package main, func main, import, fmt.Println, using go run.
2_variables_and_types.go: var, := shorthand, basic types (string, int, float64, bool).
3_packages_and_imports.go: Exploring more standard library packages like math and strings.
4_functions.go: Defining functions, typed arguments, and multiple return values.
5_control_flow.go: if/else, the powerful switch statement, and the unified for loop.
6_pointers.go: A gentle introduction to pointers, explaining memory addresses and value sharing.
7_error_handling.go: The idiomatic (value, error) return pattern for robust code.
Part 2: Structuring Data - Go's Type System
(Focus: Moving beyond primitive types to create and manage complex data structures.)

8_arrays_and_slices.go: The difference between fixed-size arrays and powerful, dynamic slices.
9_maps.go: Go's built-in key-value data structure.
10_structs.go: Creating custom data types by composing fields together.
11_project_simple_cli_quiz.go: Project: A command-line quiz tool using structs, slices, and user input (fmt.Scanln).
Part 3: The Go Way - Methods, Interfaces, and Concurrency
(Focus: Mastering the core concepts that make Go unique, powerful, and fun to use.)

12_methods_on_structs.go: Attaching functions (methods) to structs to add behavior to data.
13_interfaces.go: Understanding implicit interface satisfaction, the key to polymorphism in Go.
14_goroutines.go: Introduction to lightweight concurrency with the go keyword.
15_channels.go: Communicating safely between goroutines using channels.
16_project_concurrent_web_checker.go: Project: A tool that checks the status of a list of websites concurrently, demonstrating the power of goroutines and channels.
Part 4: Building Real Applications - The Standard Library
(Focus: Leveraging Go's exceptional standard library to build practical, real-world tools.)

17_working_with_files.go: Reading and writing files using the os and io packages.
18_handling_json.go: Encoding and decoding JSON data into Go structs with the encoding/json package.
19_intro_to_net_http.go: Building a simple, production-ready web server using only the standard library.
20_project_simple_rest_api/: Project: A multi-file REST API for a "contact book" that handles GET and POST requests with JSON.
Part 5: The Go Ecosystem - Dependency Management and Beyond
(Focus: Professional practices for creating scalable, testable, and distributable applications.)

21_go_modules_and_dependencies.go: Using go mod init and go get to manage third-party packages.
22_testing_in_go.go: Writing unit tests with the built-in testing package and go test.
23_structuring_a_larger_project/: Organizing a project with internal packages and a cmd directory.
24_capstone_url_shortener_service/: Final Capstone: A complete microservice that takes a URL and returns a shortened link, involving a web server, JSON, and a data storage solution.
25_what_next.go: A final guide on paths for further learning (e.g., gRPC, advanced concurrency patterns, frameworks like Gin, common use cases in DevOps and cloud-native development).


# Go From The Ground Up

<p align="left">
  <b>A complete, open-source curriculum that teaches you Go by building a versatile portfolio of high-performance backend services and command-line tools.</b>
</p>
<p align="left">
  This course uses a unique, hands-on teaching method: <b>the lesson is in the code</b>. You'll learn every concept from structured comments inside a single, runnable Go file for each topic.
</p>
<p align="center">
  <a href="https://go.dev/"><img src="https://img.shields.io/badge/Language-Go-blue.svg" alt="Go"></a>
  <a href="https://go.dev/doc/toolchain"><img src="https://img.shields.io/badge/Tooling-Go%20Modules-green.svg" alt="Go Modules"></a>
  <a href="https://github.com/dunamismax/Go-from-the-Ground-Up/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT"></a>
  <a href="https://github.com/dunamismax/Go-from-the-Ground-Up/pulls"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square" alt="PRs Welcome"></a>
  <a href="https://github.com/dunamismax/Go-from-the-Ground-Up/stargazers"><img src="https://img.shields.io/github/stars/dunamismax/Go-from-the-Ground-Up?style=social" alt="GitHub Stars"></a>
</p>

---

Welcome to the ultimate learn-by-doing course for the Go programming language! This isn't just a tutorial; it's a complete educational journey designed to build deep, practical knowledge from absolute zero. We start with the basics—assuming you've never written a line of code—and guide you to building an impressive portfolio of projects, including a concurrent website checker, a JSON-based REST API, and a full URL shortener microservice.

> Learning Go is about more than just syntax; it's about learning to write simple, reliable, and efficient software. This course teaches you to write clean, idiomatic Go, empowering you to build high-performance applications with confidence and clarity.

## ✨ Why This Approach?

*   📖 **Learn Directly In The Code**: Forget switching between a book and your editor. Every lesson is taught directly within the comments of a single, runnable Go file. The code *is* the textbook.
*   👨‍💻 **True Beginners Welcome**: This course has zero prerequisites. We'll guide you through your first `fmt.Println("Hello, World!")` before gradually introducing the powerful concepts like concurrency and interfaces that make Go a world-class language for backend and systems development.
*   🚀 **From "Hello, World!" to Concurrent Microservices**: The curriculum is carefully structured to build your skills layer by layer. You'll master Go fundamentals, then use them to build CLI tools, handle JSON, and build high-performance, concurrent web services using only the standard library.
*   🛠️ **Build a Versatile Portfolio**: The entire course is oriented around practical projects. Every concept, from `structs` to `goroutines`, is a building block for real-world applications like a command-line quiz, a concurrent website checker, and a complete REST API.
*   💪 **Master Professional Practices**: We don't just teach syntax. You will gain true confidence with Go's unique approach to Object-Oriented design with interfaces, its world-class concurrency model, built-in testing, and professional project structure with Go modules.
*   🌍 **Open Source & Community Driven**: This curriculum is for everyone. Contributions, suggestions for improvement, bug fixes, and new project ideas are highly encouraged!

---

## 💻 Tech Stack & Prerequisites

You don't need any programming knowledge to start, but you will need a few standard, free tools.

*   **Go** (the latest version is recommended).
*   **The Go Toolchain** (this is included with your Go installation and provides `go run`, `go build`, `go mod`, etc.).
*   **Git** for cloning this repository to your computer.
*   A good Text Editor or IDE (**Visual Studio Code** with the official Go extension is a fantastic, free choice).

---

## 🚀 How to Use This Course

Each lesson folder contains a single `.go` file (or multiple files for larger projects). This file is both the complete, runnable program and the full lesson text.

1.  **Read the Lesson:** Navigate to a lesson folder (e.g., `Part1_The_Foundations/01_HelloWorld/`) and open the `1_hello_world.go` file. Read the comments from top to bottom to understand the concepts.

2.  **Run the Code:** To see the lesson's concepts in action, you'll need to run the Go script from your terminal using the built-in `go run` command.

    First, clone the repository (you only need to do this once):
    ```sh
    git clone https://github.com/dunamismax/Go-from-the-Ground-Up.git
    cd Go-from-the-Ground-Up
    ```

    Then, for each lesson, navigate to its folder and use the `go run` command.
    ```sh
    # Example for the first lesson
    cd Part1_The_Foundations/01_HelloWorld/

    # Run the Go script
    go run 1_hello_world.go
    ```
    *Note: Later projects will require initializing a Go module. In those cases, specific instructions will be provided in the project's README.*

---

## 📚 The Curriculum

The curriculum is divided into five parts, taking you from a blank text file to a proficient Go developer capable of building high-performance backend applications.

<details>
<summary><strong>Part 1: The Foundations - Core Go Syntax</strong></summary>
<br>
<i>(Focus: The basic building blocks of Go, including its unique approach to types, functions, and errors.)</i>

| Lesson                           | Key Concepts                                              | Description                                                              |
| -------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------------------ |
| `1_hello_world.go`               | `package main`, `import`, `fmt.Println`, `go run`         | The essential first step: running your very first Go program.            |
| `2_variables_and_types.go`       | `var`, `:=`, `string`, `int`, `float64`, `bool`           | Learn to store, manage, and work with statically typed information.      |
| `3_packages_and_imports.go`      | `math`, `strings`, standard library                       | Explore Go's powerful standard library to perform common tasks.          |
| `4_functions.go`                 | `func`, typed arguments, multiple `return` values         | Organize code into reusable blocks and return multiple results with ease.|
| `5_control_flow.go`              | `if/else`, `switch`, the unified `for` loop               | Give your program a brain by letting it execute code based on conditions.|
| `6_pointers.go`                  | `*`, `&`, memory addresses, value sharing                 | A gentle introduction to how Go manages memory and shares data.        |
| `7_error_handling.go`            | `(value, error)` return pattern                           | Master the idiomatic, robust way Go handles errors without exceptions.   |

</details>

<details>
<summary><strong>Part 2: Structuring Data - Go's Type System</strong></summary>
<br>
<i>(Focus: Moving beyond primitive types to create and manage complex data structures.)</i>

| Lesson                           | Key Concepts                                              | Description                                                              |
| -------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------------------ |
| `8_arrays_and_slices.go`         | Fixed-size arrays vs. dynamic slices, `len()`, `cap()`    | Learn the difference between fixed arrays and Go's powerful slices.      |
| `9_maps.go`                      | `make()`, key-value pairs, checking for existence         | Master Go's built-in key-value data structure for fast lookups.        |
| `10_structs.go`                  | `type`, custom data structures                            | Create your own custom data types by composing fields together.          |
| `11_project_simple_cli_quiz.go`  | **Project:** Structs, slices, `fmt.Scanln`                | Build your first interactive command-line application: a simple quiz.    |

</details>

<details>
<summary><strong>Part 3: The Go Way - Methods, Interfaces, and Concurrency</strong></summary>
<br>
<i>(Focus: Mastering the core concepts that make Go unique, powerful, and fun to use.)</i>

| Lesson                                     | Key Concepts                                              | Description                                                              |
| ------------------------------------------ | --------------------------------------------------------- | ------------------------------------------------------------------------ |
| `12_methods_on_structs.go`                 | Pointer vs. value receivers                               | Attach functions (methods) directly to your custom data types.           |
| `13_interfaces.go`                         | Implicit satisfaction, polymorphism                       | Unlock the power of Go's flexible and decoupled design philosophy.       |
| `14_goroutines.go`                         | The `go` keyword, lightweight concurrency                 | Learn to run functions concurrently with incredible ease.                |
| `15_channels.go`                           | `make(chan)`, `<-`, thread-safe communication             | Communicate safely between goroutines, a cornerstone of Go concurrency.|
| `16_project_concurrent_web_checker.go`     | **Project:** Goroutines, channels, standard library         | Build a tool that checks a list of websites concurrently and efficiently.|

</details>

<details>
<summary><strong>Part 4: Building Real Applications - The Standard Library</strong></summary>
<br>
<i>(Focus: Leveraging Go's exceptional standard library to build practical, real-world tools.)</i>

| Lesson                           | Key Concepts                                              | Description                                                              |
| -------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------------------ |
| `17_working_with_files.go`       | `os`, `io`, `bufio` packages                              | Persist data beyond program execution by reading from and writing to files.|
| `18_handling_json.go`            | `encoding/json`, struct tags, `Marshal`/`Unmarshal`       | Master JSON, the universal language of web APIs and data exchange.       |
| `19_intro_to_net_http.go`        | `http.ListenAndServe`, `http.HandleFunc`                  | Build a production-ready web server using *only* Go's standard library.|
| `20_project_simple_rest_api/`    | **Project:** `net/http`, JSON, structs, project structure | Build a multi-file REST API for a contact book with GET and POST routes. |

</details>

<details>
<summary><strong>Part 5: The Go Ecosystem - Dependency Management and Beyond</strong></summary>
<br>
<i>(Focus: Professional practices for creating scalable, testable, and distributable applications.)</i>

| Lesson                                     | Key Concepts                                              | Description                                                              |
| ------------------------------------------ | --------------------------------------------------------- | ------------------------------------------------------------------------ |
| `21_go_modules_and_dependencies.go`| `go mod init`, `go.mod`, `go get`                         | Learn the professional standard for managing project dependencies.       |
| `22_testing_in_go.go`                | `testing` package, `go test`, table-driven tests          | Write unit tests with Go's simple, built-in testing framework.         |
| `23_structuring_a_larger_project/`   | `internal/`, `cmd/`, project layout                       | Learn how to organize code for large, scalable, and maintainable apps.   |
| `24_capstone_url_shortener_service/` | **Final Capstone Project**                                | A complete URL shortener microservice using a web server and a map store.|
| `25_what_next.go`                    | Guidance document                                         | A commented guide to further learning in gRPC, DevOps, Gin, and more.  |

</details>

---

## ⭐ Show Your Support

If this course helps you become a better developer, please **give this repository a star!** It helps the project reach more aspiring programmers and encourages us to keep creating great, free educational content.

## 🤝 Connect & Contribute

This project is for the community. Have an idea for a new feature, a better way to explain a concept, or find a bug? Feel free to [open an issue](https://github.com/dunamismax/Go-from-the-Ground-Up/issues) or [submit a pull request](https://github.com/dunamismax/Go-from-the-Ground-Up/pulls)!

Connect with the author, **dunamismax**, on:

*   **Twitter:** [@dunamismax](https://twitter.com/dunamismax)
*   **Bluesky:** [@dunamismax.bsky.social](https://bsky.app/profile/dunamismax.bsky.social)
*   **Reddit:** [u/dunamismax](https://www.reddit.com/user/dunamismax)
*   **Discord:** `dunamismax`
*   **Signal:** `dunamismax.66`

## 📜 License

This project is licensed under the **MIT License**. See the `LICENSE` file for details.

Full example file:

// Part 2, Lesson 11: Project: Simple CLI Quiz
//
// Author: dunamismax
// Date: 06-15-2025
//
// This file is your first project! It combines concepts like structs, slices,
// loops, and user input to create a functioning command-line quiz application.

/*
=====================================================================================
|                                   - LESSON START -                                  |
=====================================================================================

PROJECT BRIEF: SIMPLE COMMAND-LINE QUIZ

Welcome to your first project! The goal is to build a simple, interactive quiz
that runs in your computer's terminal. This project will test your understanding of
the foundational concepts we've covered so far:
-   STRUCTS: To create a custom `Question` type.
-   SLICES: To hold the list of all the questions in our quiz.
-   CONTROL FLOW: A `for` loop to go through the questions and `if/else` to check answers.
-   FUNCTIONS: `main` will be our primary function to run the quiz.
-   PACKAGES: We'll use `fmt` for printing and getting input, `bufio` and `os` for
    more robust input handling, `strings` to clean it up, and `strconv` to
    convert the user's text input into a number.

By the end of this lesson, you will have built a complete, runnable Go program
that feels like a real application.
*/

package main

import (
	"bufio"   // For buffered I/O, allowing us to read lines of text.
	"fmt"     // For formatted input/output (printing and scanning).
	"os"      // Provides a way to access operating system functionality, like standard input.
	"strconv" // Provides string conversion functions (e.g., string to integer).
	"strings" // Provides string manipulation functions.
)

// --- Part 1: Defining the Data Structure ---

// First, we need a blueprint for what a single quiz question looks like.
// A `struct` is perfect for this. Each question will have the question text,
// a list of possible answers, and the index of the correct answer.
type Question struct {
	Text               string   // The question itself.
	Options            []string // A slice of possible answers (strings).
	CorrectAnswerIndex int      // The 0-based index of the correct answer in the Options slice.
}

func main() {
	// --- Part 2: Creating the Quiz Content ---

	// Now, let's create the actual content for our quiz using the `Question` struct.
	// We'll store all our questions in a slice of `Question`.
	questions := []Question{
		{
			Text:               "What keyword is used to declare a variable that can be changed?",
			Options:            []string{"const", "var", "let", "def"},
			CorrectAnswerIndex: 1,
		},
		{
			Text:               "Which is NOT a built-in type in Go?",
			Options:            []string{"int", "float64", "string", "long"},
			CorrectAnswerIndex: 3,
		},
		{
			Text:               "What is the name of Go's unified looping construct?",
			Options:            []string{"while", "loop", "for", "foreach"},
			CorrectAnswerIndex: 2,
		},
		{
			Text:               "How does Go handle errors?",
			Options:            []string{"By returning an error value", "With try/catch blocks", "By crashing the program", "By ignoring them"},
			CorrectAnswerIndex: 0,
		},
	}

	// --- Part 3: Running the Quiz ---

	score := 0
	// `bufio.NewReader` creates a new reader that gets input from the standard input (the keyboard).
	reader := bufio.NewReader(os.Stdin)

	fmt.Println("==============================")
	fmt.Println("  Welcome to the Go Quiz!   ")
	fmt.Println("==============================")
	fmt.Println("Answer the following questions.")

	// We use a `for range` loop to iterate over our slice of questions.
	// `i` will be the index (0, 1, 2, ...) and `q` will be the question itself.
	for i, q := range questions {
		fmt.Printf("\n--- Question #%d ---\n", i+1)
		fmt.Println(q.Text)

		// Loop through the options for the current question and print them.
		for j, option := range q.Options {
			fmt.Printf("  %d) %s\n", j+1, option)
		}

		// Prompt for and get user input.
		fmt.Print("Your answer (1-4): ")
		userInput, _ := reader.ReadString('\n')  // Read until the user hits Enter.
		userInput = strings.TrimSpace(userInput) // Remove whitespace and newline characters.
		answer, err := strconv.Atoi(userInput)   // Convert the string input to an integer.

		// Check if the input was valid.
		// Was it a number? Was it in the valid range of options?
		if err != nil || answer < 1 || answer > len(q.Options) {
			fmt.Println("Invalid input. The correct answer was:", q.Options[q.CorrectAnswerIndex])
			continue // Skip to the next question.
		}

		// Check if the answer was correct.
		// We subtract 1 from the user's answer because our slice is 0-indexed.
		if (answer - 1) == q.CorrectAnswerIndex {
			fmt.Println("Correct! Great job.")
			score++
		} else {
			fmt.Println("Wrong. The correct answer was:", q.Options[q.CorrectAnswerIndex])
		}
	}

	// --- Part 4: Displaying the Final Score ---
	fmt.Println("\n==============================")
	fmt.Println("         Quiz Complete!       ")
	fmt.Println("==============================")
	fmt.Printf("Your final score is: %d out of %d\n", score, len(questions))
}

/*
=====================================================================================
|                                    - LESSON END -                                   |
=====================================================================================

HOW TO RUN THIS CODE:

1.  Open a terminal or command prompt.
2.  Navigate to the directory where you saved this file.
3.  Use the `go run` command to compile and execute the file:
    `go run 11_project_simple_cli_quiz.go`

You have now built a complete, interactive application. Try adding your own
questions to the `questions` slice to customize the quiz!
*/
