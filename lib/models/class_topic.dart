
import 'package:hive/hive.dart';




@HiveType(typeId: 0)
class topic extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool done;

  @HiveField(2)
  String language;

  @HiveField(3)
  List<Details> details;

  topic({
    required this.name,
    required this.done,
    required this.language,
    required this.details,
  });
}

@HiveType(typeId: 1)
class Details extends HiveObject {
  @HiveField(0)
  String topicName;

  @HiveField(1)
  String details;

  @HiveField(2)
  String url;

  @HiveField(3)
  String code;

  @HiveField(4)
  String error;

  Details({
    required this.details,
    required this.topicName,
    required this.url,
    required this.code,
    required this.error,
  });
}

final Map<String, List<topic>> topics = {
  "Python": [
    topic(
      name: "Syntax",
      done: true,
      language: "Python",
      details: [
        Details(
            details:
            "Indentation refers to the spaces at the beginning of a code line.\nWhere in other programming languages the indentation in code is for readability only, the indentation in Python is very important.\nPython uses indentation to indicate a block of code.",
            topicName: "Syntax",
            url: "https://www.youtube.com/watch?v=oMMW_Cx0qW8&list=PLuXY3ddo_8nzrO74UeZQVZOb5-wIS6krJ&index=5",
            code: "if 5 > 2:\n\tprint(\"Five is greater than two!\")",
            error: "if 5 > 2:\nprint(\"Five is greater than two!\")"
        ),
      ],
    ),
    topic(name: "Variables", done: false, language: "Python",  details: [
      Details(
          details:
          "Creating Variables\nPython has no command for declaring a variable.\nA variable is created the moment you first assign a value to it.",
          topicName: "Variables",
          url: "https://www.youtube.com/watch?v=gQxch0k9B0E&list=PLuXY3ddo_8nzrO74UeZQVZOb5-wIS6krJ&index=7",
          code: "x = 5\ny = \"John\"\nprint(x)\nprint(y)",
          error: ""      ),
    ],),
    topic(name: "Strings", done: false, language: "Python",  details: [
      Details(
          details:
          "Strings in python are surrounded by either single quotation marks, or double quotation marks.\n'hello' is the same as \"hello\".\nYou can display a string literal with the print() function:",
          topicName: "Strings",
          url: "https://www.youtube.com/watch?v=5O_m0IGwQLw&list=PLuXY3ddo_8nzrO74UeZQVZOb5-wIS6krJ&index=8",
          code: "print(\"Hello\")\nprint(\'Hello\')",
          error: ""      ),
    ],),
    topic(name: "Arithmetic operators", done: false, language: "Python",  details: [
      Details(
          details:"Operator\t	 Name\t 	Example\n\n+\t  	Addition\t  	x + y\n -\t 	 Subtraction\t 	 x - y\n \t  	Multiplication\t  	x * y\n/\t  	Division\t 	 x / y\n%\t  	Modulus\t   	x % y\n*\t 	Exponentiation\t 	 x ** y\n //\t 	 Floor division\t 	 x // y "
          ,topicName: "Arithmetic operators",
          url: "https://www.youtube.com/watch?v=I8Aq2B-P868&list=PLfK5X-fTOAT57TPR7kMtHrGiOAd2gqoN9&index=12",
          code: "\"\"\"Multiplication * has higher precedence than addition +, and therefore multiplications are evaluated before additions:\"\"\"\n\nprint(100 + 5 * 3)",
          error: ""      ),
    ],),
    topic(name: "Numbers", done: false, language: "Python",  details: [
      Details(
          details:
          "There are three numeric types in Python:\nint\nfloat\ncomplex\nVariables of numeric types are created when you assign a value to them:" ,
          topicName: "Numbers",
          url: "https://www.youtube.com/watch?v=HjfiVp0L3LI&list=PLuXY3ddo_8nzrO74UeZQVZOb5-wIS6krJ&index=9",
          code: "x = 1    # int\ny = 2.8  # float\nz = 1j   # complex\n\n#To verify the type of any object in Python, use the type() function:\n\nprint(type(x))\nprint(type(y))\nprint(type(z))\n\n\n"
              "#Convert from one type to another:\nx = 1    # int\ny = 2.8  # float\nz = 1j   # complex\n\n#convert from int to float:\na = float(x)\n\n#convert from float to int:\nb = int(y)\n\n#convert from int to complex:\nc = complex(x)\n\nprint(a)\nprint(b)\nprint(c)\n\nprint(type(a))\nprint(type(b))\nprint(type(c))",
          error: ""      ),
    ],),
    topic(name: "If ... Else", done: false, language: "Python",  details: [
      Details(
          details:
          "Python supports the usual logical conditions from mathematics:\n- Equals: a == b\n- Not Equals: a != b\n- Less than: a < b\n- Less than or equal to: a <= b\n- Greater than: a > b\n- Greater than or equal to: a >= b\nThese conditions can be used in several ways, most commonly in \"if statements\" and loops.\nAn \"if statement\" is written by using the if keywo\n\nElif\nThe elif keyword is Python's way of saying \"if the previous conditions were not true, then try this condition\".\n\nElse\nThe else keyword catches anything which isn't caught by the preceding conditions. ",
          topicName: "Python Conditions and If statements",
          url: "https://www.youtube.com/watch?v=yy7zXgeSt4U&list=PLfK5X-fTOAT57TPR7kMtHrGiOAd2gqoN9&index=15",
          code: "a = 200\nb = 33\n\if b > a:\n\tprint(\"b is greater than a\")\nelif a == b:\n\tprint(\"a and b are equal\")\nelse:\n\tprint(\"a is greater than b\")",
          error: "#If statement, without indentation (will raise an error):\n\na = 33\nb = 200\nif b > a:\n\tprint(\"b is greater than a\") \t# you will get an error"      ),
    ],),
    topic(name: "while Loops", done: false, language: "Python",  details: [
      Details(
          details:
          "With the while loop we can execute a set of statements as long as a condition is true.",
          topicName: "The while Loops",
          url: "https://www.youtube.com/watch?v=ewVUrNqTQGU&list=PLfK5X-fTOAT57TPR7kMtHrGiOAd2gqoN9&index=21",
          code: "i = 1 \nwhile i < 6:\n\tprint(i)\n\ti += 1)",
          error: ""      ),
    ],),
    topic(name: "For Loops", done: false, language: "Python",  details: [
      Details(
          details:
          "A for loop is used for iterating over a sequence (that is either a list, a tuple, a dictionary, a set, or a string).\nThis is less like the for keyword in other programming languages, and works more like an iterator method as found in other object-orientated programming languages.\nWith the for loop we can execute a set of statements, once for each item in a list, tuple, set etc.",
          topicName: "The For Loops",
          url: "https://www.youtube.com/watch?v=WuVT4fzGl2A&list=PLfK5X-fTOAT57TPR7kMtHrGiOAd2gqoN9&index=22",
          code: "#Print each fruit in a fruit list:\nfruits = [\"apple\", \"banana\", \"cherry\"]\nfor x in fruits:\n\tprint(x)\n\n#Exit the loop when x is \"banana\":\nfruits = [\"apple\", \"banana\", \"cherry\"]\nfor x in fruits:\n\tprint(x)\n\tif x == \"banana\":\n\tbreak",
          error: ""      ),
    ],),
    topic(name: "Functions", done: false, language: "Python",  details: [
      Details(
          details:"A function is a block of code which only runs when it is called.\nYou can pass data, known as parameters, into a function.\nA function can return data as a result.",
          topicName: "Functions",
          url: "https://www.youtube.com/watch?v=7sRcOl-EXfQ&list=PLfK5X-fTOAT57TPR7kMtHrGiOAd2gqoN9&index=25",
          code: "#In Python a function is defined using the def keyword:\ndef my_function():\n\tprint(\"Hello from a function\")\n\n#To call a function, use the function name followed by parenthesis:\n\ndef my_function():\n\tprint(\"Hello from a function\")\n\nmy_function()\n\n\n"
              "\"\"\"Arguments:\nInformation can be passed into functions as arguments.\nArguments are specified after the function name, inside the parentheses. You can add as many arguments as you want, just separate them with a comma.\nThe following example has a function with one argument (fname). When the function is called, we pass along a first name, which is used inside the function to print the full name:\"\"\"\n\n"
              "def my_function(fname):\n\tprint(fname + \" Refsnes\")\n\nmy_function(\"Emil\")\nmy_function(\"Tobias\")\nmy_function(\"Linus\")",
          error: "#This function expects 2 arguments, but gets only 1:\n\ndef my_function(fname, lname):\n\tprint(fname + " " + lname)\n\nmy_function(\"Emil\")"      ),
    ],),
  ],
  "React":[
    topic(name: 'JSX', done: false, language: "React", details: [
      Details(details: "JSX, or JavaScript XML, is a syntax extension for JavaScript that is commonly used with the React library for building user interfaces. It allows developers to write HTML-like markup directly within their JavaScript code. ", topicName: "JSX",
          url:"https://youtu.be/7fPXI_MnBOY?si=WivjLmml8cv5LKUF" ,
          code: "",
          error: "")
    ]),
    topic(name: 'Components',done: false,language: "React",details: [
      Details(details: "In React, a component is an independent, reusable piece of code that represents a part of the user interface (UI). Components are the fundamental building blocks of React applications, enabling developers to break down complex UIs into smaller, manageable, and self-contained units.",
        topicName: 'Components',
        url: "https://youtu.be/d5ooYpXioqE?si=nLKpoKioaZFlP1A7",
        code: "",
        error: "",
      )
    ]),
    topic(name: "State", done: false, language: "React", details: [
      Details(details: "In React, state refers to a built-in object that allows components to store and manage data that can change over time. This data is local to a specific component instance and determines how the component renders and behaves.",
          topicName: "State",
          url: 'https://youtu.be/4ORZ1GmjaMc?si=P1J62Hn5FY4wpwab',
          code: '',
          error: '')
    ]),
    topic(name: "Event Handling",done: false,language: "React",details: [
      Details(details: "Event handling in React refers to the process of responding to user interactions within React components, such as clicks, key presses, and mouse movements. React provides a declarative approach to event handling using a synthetic event system. ",
          topicName: "Event Handling",
          url: "https://youtu.be/Znqv84xi8Vs?si=dSR9ietzz8BeMZlG",
          code: "",
          error: "")
    ]),
    topic(name: "Conditional Rendering", done: false, language: "React", details: [
      Details(details: "Conditional rendering in React refers to the practice of rendering different elements or components based on specific conditions or states within your application. This allows for dynamic user interfaces that adapt to changes in data, user interactions, or other factors. ",
          topicName: "Conditional Rendering",
          url: "https://youtu.be/7o5FPaVA9m0?si=QmaiZ_OETsTNG8tm",
          code: "",
          error: "")
    ]),
    topic(name: "Lists and Keys", done: false, language: "React", details: [
      Details(details: "In React, Lists and Keys are fundamental concepts for efficiently rendering collections of similar data and ensuring optimal performance and correct behavior when the data changes.",
          topicName: "Lists and keys",
          url: "",
          code: "",
          error: "https://youtu.be/0sasRxl35_8?si=y2GDseHLzdxF8l3U")
    ]),
  ],
  "HTML":[
    topic(name: "HTML Structure", done: false, language: "HTML", details: [
      Details(details: "An HTML document is structured using a series of nested elements, each enclosed in angle brackets (e.g., <p>, <div>). These elements define the content and structure of a webpage, telling browsers how to display information. The fundamental structure includes a <!DOCTYPE html>, <html>, <head>, and <body> section. ",
          topicName: "HTML Structure",
          url:"https://www.youtube.com/watch?v=U4nbKMJRVaw&pp=ygUOSFRNTCBzdHJ1Y3R1cmU%3D" ,
          code: "",
          error: "")
    ]),
    topic(name: "Heading and Paragraphs", done: false, language: "HTML", details: [
      Details(details: "Most structured text consists of headings and paragraphs, whether you are reading a story, a newspaper, a college textbook, a magazine, etc.Structured content makes the reading experience easier and more enjoyable.",
          topicName: "Heading and Paragraphs",
          url: "https://www.youtube.com/watch?v=-BmDd6_99Dc&pp=ygUeaGVhZGluZyBhbmQgcGFyYWdocmFwaCBpbiBodG1s",
          code: "",
          error: "")
    ]),
    topic(name: "Text Formatting", done: false, language: "HTML", details: [
      Details(details: "HTML text formatting allows you to change the appearance of text on a webpage using specific tags. These tags can make text bold, italic, underlined, or change its size, among other things. HTML formatting is essential for enhancing readability and visual appeal of content. ",
          topicName: "Text Formatting",
          url: "https://www.youtube.com/watch?v=SZfoOAv9tEo&pp=ygUXdGV4dCBmb3JtYXR0aW5nIGluIGh0bWw%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Links", done: false, language: "HTML", details: [
      Details(details: "HTML links are hyperlinks.You can click on a link and jump to another document.When you move the mouse over a link, the mouse arrow will turn into a little hand.",
          topicName: "Links",
          url: "https://www.youtube.com/watch?v=7TQhxAOjd1w&pp=ygUNbGlua3MgaW4gaHRtbA%3D%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Images", done: false, language: "HTML", details: [
      Details(details:"The HTML <img> tag is used to embed an image in a web page.Images are not technically inserted into a web page; images are linked to web pages. The <img> tag creates a holding space for the referenced image." ,
          topicName: "images",
          url: "https://www.youtube.com/watch?v=Hh_se2Zqsdk&pp=ygUOaW1hZ2VzIGluIGh0bWw%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Unordered Lists", done: false, language: "HTML", details: [
      Details(details: "HTML lists allow web developers to group a set of related items in lists.An unordered list starts with the <ul> tag. Each list item starts with the <li> tag.",
          topicName: "Unordered Lists",
          url: "https://www.youtube.com/watch?v=-kXZvKxs9oA&pp=ygUXdW4gb3JkZXJlZCBsaXN0IGluIGh0bWw%3D",
          code: "",
          error: "")
    ]),
    topic(name:"Ordered Lists",done: false,language: "HTML",details: [
      Details(details: "The HTML <ul> tag defines an unordered (bulleted) list.An unordered list starts with the <ul> tag. Each list item starts with the <li> tag.",
          topicName: "Ordered Lists",
          url:"https://www.youtube.com/watch?v=-kXZvKxs9oA&pp=ygUVIG9yZGVyZWQgbGlzdCBpbiBodG1s" ,
          code: "",
          error: "")
    ] ),
    topic(name: "Forms & Inputs",done: false,language: "HTML",details: [
      Details(
          details: "An HTML form is used to collect user input. The user input is most often sent to a server for processing.he HTML <form> element is used to create an HTML form for user input",
          topicName: "Forms & Inputs",
          url: "https://www.youtube.com/watch?v=H9zdfZrFUp0&pp=ygUWIGZvcm1zICZpbnB1dHMgaW4gaHRtbA%3D%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Tables", done: false, language: "HTML", details: [
      Details(details:"HTML tables allow web developers to arrange data into rows and columns.A table in HTML consists of table cells inside rows and columns." ,
          topicName: "Tables",
          url: "https://www.youtube.com/watch?v=SUW49Jjxvac&pp=ygUPIFRhYmxlcyBpbiBodG1s",
          code: "",
          error: "")
    ]),
    topic(name: "Buttons", done: false, language: "HTML", details: [
      Details(details:"A clickable button is marked up.The <button> tag defines a clickable button. ",
          topicName: "Buttons",
          url: "https://www.youtube.com/watch?v=tDqTXipQmBU&pp=ygUQIGJ1dHRvbnMgaW4gaHRtbA%3D%3D",
          code: "",
          error: "")
    ]),

  ],
  "Angular":[
    topic(name: "Angular CLI", done: false, language: "Angular", details: [
      Details(details: "The Angular CLI is a command-line interface tool which allows you to scaffold, develop, test, deploy, and maintain Angular applications directly from a command shell.",
          topicName: "Angular CLI",
          url: "https://www.youtube.com/watch?v=IZEolKjcjks&pp=ygULYW5ndWxhciBDTEk%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Project Structure", done: false, language: "Angular", details: [
      Details(details: "An Angular project typically follows a well-defined folder structure to promote organization, maintainability, and scalability. The core elements of an Angular project's structure are detailed below",
          topicName: "Project Structure",
          url: "https://www.youtube.com/watch?v=mJGg7LWmVeU&pp=ygUZYW5ndWxhciBwcm9qZWN0IHN0cnVjdHVyZQ%3D%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Components", done: false, language: "Angular", details: [
      Details(details: "Components are the fundamental building blocks of an Angular application, representing reusable and self-contained units of the user interface (UI). Each component controls a specific part of the application's view and behavior.",
          topicName: "Components",
          url: "https://www.youtube.com/watch?v=23o0evRtrFI&pp=ygUSYW5ndWxhciBjb21wb25lbnRz",
          code: "",
          error: "")
    ]),
    topic(name: "Templates and Data Binding", done: false, language: "Angular", details: [
      Details(details: "In Angular, templates and data binding are fundamental concepts for building dynamic user interfaces.Angular templates are essentially HTML augmented with Angular-specific syntax. They define the structure and layout of a component's view. ",
          topicName: "Templated and Data Binding",
          url: "https://www.youtube.com/watch?v=DNMIlucXnbU&pp=ygUjYW5ndWxhciB0ZW1wbGF0ZXMgYW5kIGRhdGEgYmluZGluZyA%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Directives", done: false, language: "Angular", details: [
      Details(details: "Directives in Angular are classes that provide instructions or additional behavior to elements in the Document Object Model (DOM). They are a fundamental part of Angular's declarative approach to building user interfaces, allowing for manipulation of the DOM, application of styles, handling of user input, and much more.",
          topicName: "Directives",
          url: "https://www.youtube.com/watch?v=SK-xlWW4pOM&pp=ygUSYW5ndWxhciBkaXJlY3RpdmVz0gcJCcEJAYcqIYzv",
          code: "",
          error: "")
    ]),
    topic(name: "Pipes", done: false, language: "Angular", details: [
      Details(details: "Pipes in Angular are functions used within template expressions to transform data before it is displayed in the view. They allow for declarative data.manipulation without altering the underlying data model in the component",
          topicName: "Pipes",
          url: "https://www.youtube.com/watch?v=DOUmCfaYA1w&pp=ygUNYW5ndWxhciBwaXBlc9IHCQnBCQGHKiGM7w%3D%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Services and Dependecy Injection",done: false,language: "Angular",details: [
      Details(details: "Pipes in Angular are a mechanism for transforming data directly within templates. They allow for declarative data manipulation, taking an input value and returning a transformed output value.",
          topicName: "Services and Dependecy Injection",
          url: "https://www.youtube.com/watch?v=ySJiHLlyZsU&pp=ygU2YW5ndWxhciBzZXJ2aWNlcyBhbmQgZGVwZW5kZW5jeSBpbmplY3Rpb24gaW4gb25lIHZpZGVv",
          code: "",
          error: "")
    ])
  ],
  "JavaScript":[
    topic(name: "Variables", done: false, language: "JavaScript", details: [
      Details(details: "Variables in JavaScript are symbolic names used to store and manage data within a program. They act as containers for values, allowing you to reference and manipulate information by its assigned name rather than its raw value.",
          topicName: "Variables",
          url: "https://www.youtube.com/watch?v=nbX0MIV7-Ek&pp=ygUZdmFyaWFibGVzIGluIGphdmEgc2NyaXB0IA%3D%3D",
          code: "",
          error: "")
    ]),
    topic(name: "data types",done: false,language: "JavaScript",details: [
      Details(details: "JavaScript has eight fundamental data types, categorized into two main groups: primitive and non-primitive (or reference) types.Primitive Data Types: These represent single, simple values and are immutable(their values cannot be changed after creation)",
          topicName: "data types",
          url: "https://www.youtube.com/watch?v=nCwQY8inRvU&pp=ygUaZGF0YSB0eXBlcyBpbiBqYXZhIHNjcmlwdCA%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Operators", done: false, language: "JavaScript", details: [
      Details(details:"Operators in JavaScript are symbols or keywords that perform operations on values and variables, known as operands. They are fundamental buildingblocks for creating expressions and manipulating data within JavaScript code." ,
          topicName: "Operators",
          url: "https://www.youtube.com/watch?v=ovWYhDVQiR8&pp=ygUZb3BlcmF0b3JzIGluIGphdmEgc2NyaXB0INIHCQnBCQGHKiGM7w%3D%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Conditions", done: false, language: "JavaScript", details: [
      Details(details: "In JavaScript, conditions are used to control the flow of execution in a program, allowing different blocks of code to run based on whether a specified condition is true or false. These are primarily implemented using conditional statements.",
          topicName: "Conditions",
          url: "https://www.youtube.com/watch?v=PgUXiprlg1k&pp=ygUaY29uZGl0aW9ucyBpbiBqYXZhIHNjcmlwdCA%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Loops",done: false,language: "JavaScript",details: [
      Details(details: "Loops in JavaScript are programming constructs that enable the repeated execution of a block of code until a specified condition is met. This automation of repetitive tasks enhances code efficiency.",
          topicName: "Loops",
          url: "https://youtu.be/Kn06785pkJg?si=D12zuGknl-Cl44tx",
          code: "",
          error: "")
    ]),
    topic(name: "Functions",done: false,language: "JavaScript",details: [
      Details(details: "Functions in JavaScript are fundamental building blocks of code designed to perform specific tasks. They allow for code reusability and organization",
          topicName: "Functions",
          url: "https://www.youtube.com/watch?v=HFaxylC7bUc&pp=ygUZZnVuY3Rpb25zIGluIGphdmEgc2NyaXB0IA%3D%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Arrays", done: false, language: "JavaScript", details: [
      Details(details: "In JavaScript, an array is a global object used to store an ordered collection of values, known as elements. Key characteristics of JavaScript arrays",
          topicName: "Arrays",
          url: "https://www.youtube.com/watch?v=yQ1fz8LY354&pp=ygUWQXJyYXlzIGluIGphdmEgc2NyaXB0IA%3D%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Objects", done: false, language: "JavaScript", details: [
      Details(details: "In JavaScript, an object is a fundamental data structure used to store collections of related data and functionality. Objects are essentially collections of key-value pairs",
          topicName: "Objects",
          url: "https://www.youtube.com/watch?v=rLPwCAqyCAE&pp=ygUXb2JqZWN0cyBpbiBqYXZhIHNjcmlwdCA%3D",
          code: "",
          error: "")
    ]),
    topic(name: "DOM Manipulation", done: false, language: "Jave Script", details: [
      Details(details: "DOM manipulation in JavaScript refers to the process of using JavaScript to interact with and modify the Document Object Model (DOM) of a webpage.",
          topicName: "DOM Manipulation",
          url: "https://www.youtube.com/watch?v=WjxQRfZfZnw&pp=ygUfRE9NIE1hbmlwdWxhdGlvbmluIGphdmEgc2NyaXB0IA%3D%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Event Handling", done: false, language: "JavaScript", details: [
      Details(details: "Event handling in JavaScript refers to the process of responding to actions or occurrences within a web page or application, such as user interactions.",
          topicName: "Event Handling",
          url: "https://www.youtube.com/watch?v=j6WO42D3lx4&pp=ygUcRXZlbnQgaGFuZGxpbmcgIGphdmEgc2NyaXB0IA%3D%3D",
          code: "",
          error: "")
    ]),
    topic(name: "Classes and OOP", done: false, language: "JavaScript", details: [
      Details(details: "Object-Oriented Programming (OOP) in JavaScript is a paradigm that structures code around objects rather than functions and logic.while JavaScript is fundamentally a prototype-based language, it supports OOP",
          topicName: "Classes and OOP",
          url: "https://www.youtube.com/watch?v=PFmuCDHHpwk&pp=ygUcY2xhc3NlcyBhbmQgb29wIGphdmEgc2NyaXB0IA%3D%3D",
          code: "",
          error: "")
    ])
  ]
};
Future<void> saveTopicsToBox() async {
  final box = Hive.box<dynamic>('topicsBox');
  await box.clear();

  for (var language in topics.keys) {
    for (var t in topics[language]!) {
      await box.put(language, topics[language]!);

    }
  }

  print("Topics saved to Hive successfully!");
}
