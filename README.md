
# Compiler Construction Lab

This repository contains practical implementations, lexical analyzers, and parsers developed for the Compiler Construction Lab course using **LEX (Flex)** and **YACC (Bison)** on Linux/Ubuntu.

## 🛠️ Tools & Environment
* **Operating System:** Linux / Ubuntu (WSL)
* **Lexical Analyzer Generator:** Flex
* **Parser Generator:** Bison (Yacc)
* **C Compiler:** GCC

---

## 📂 Practicals Overview

| Practical | Name of the Experiment | Tool Used | Status |
| :--- | :--- | :--- | :--- |
| **Practical 1** | Introduction to LEX tool, metadata, and patterns (Line, word, and character counter). | LEX / Flex |  Completed |
| **Practical 2** | Count comments, keywords, identifiers, words, lines, and spaces. | LEX / Flex |  Completed |
| **Practical 3** | Count number of words starting with "A" and exponential numbers. | LEX / Flex |  Completed |
| **Practical 4** | Introduction to YACC tool, and format to write YACC code (Basic Calculator). | LEX & YACC |  Completed |
| **Practical 5** | Conversion of lowercase to uppercase and vice versa. | LEX / Flex |  Completed |
| **Practical 6** | Conversion of decimal to hexadecimal number in a file. | LEX / Flex |  Completed |
| **Practical 7** | Test lines ending with "COM". | LEX / Flex |  Completed |
| **Practical 8** | Postfix Expression Evaluation. | LEX & YACC |  Completed |
| **Practical 9** | Desk calculator with error recovery. | LEX & YACC |  Completed |
| **Practical 10** | Parser for "FOR" loop statements. | LEX & YACC |  Completed |

---

## 🚀 How to Run the Codes

### For Pure LEX/Flex Practicals (Pracs 1, 2, 3, 5, 6, 7)
Navigate to the specific practical folder and run:
```bash
flex -o lex.yy.c source_file.l
gcc lex.yy.c -o program
./program
```
*Note: Press `Ctrl + D` on a new line to send the EOF signal and see output calculations.*

### For Combined LEX & YACC Practicals (Pracs 4, 8, 9, 10)
Navigate to the specific practical folder and run:
```bash
bison -d yacc_file.y -o y.tab.c
flex -o lex.yy.c lex_file.l
gcc y.tab.c lex.yy.c -o parser -lm
./parser
```

---

## 👤 Author
* **Repository Owner:** [vedant3124](https://github.com)
* **Academic Year:** 2026

