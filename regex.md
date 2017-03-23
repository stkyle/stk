
Regex to validate: `hel055!sdsdJKHJ@#%&_-=()$+.?*`:

```
(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\!\@\#\$\%\^\&\\\\*\\\\(\\\\)\_\+\\\-\=\\\\.\\\\?])(?!.*[\`\~\\\\[\\\\]\\\\{\\\\}\'\;\:\/\>\<\,])[A-Za-z\d\!\@\#\$\%\^\&\\\\*\\\\(\\\\)\_\+\\\-\=\\\\.\\\\?]{15,32}
```

Sample:  hel055!sdsdJKHJ@#%&_-=()$+.?*


Regex Notes
===========

wildcard, which is represented by the . (dot) metacharacter. overrides the matching of the period character
Qualifiers: star "*", plus "+", repetition "{m,n}", and the question mark "?"
char(*)   Kleene Star   match 0 or more of the character that it follows
char(+)   Kleene Plus   match 1 or more of the character that it follows
char(?)   


Characters that must be escaped
--------------------------------
 - char '+'
 - char '.'
 - char '?'

Matching
-------------
* matching specific characters: use square brackets []
* example, the pattern [abc] will only match a single a, b, or c letter and nothing else
* Multiple character ranges can also be used in the same set of brackets e.g. [A-Za-z0-9_]
* exclusion is done with the hat char '^'
* sequential characters by using the dash '-'
* example,  [^n-p] will only match any single character except for letters n to p
* "quantifier": to specify how many repetitions of each character we want using the curly braces notation.
* example, a{3} will match the 'a' character exactly three times.
* to specify a range for this repetition such that a{1,3} will match the a character no more than 3 times, but no less than once
* to explicitly spell out exactly how many characters we want, eg. \d\d\d which would match exactly three digits
* example, [wxy]{5} (five characters, each of which can be a w, x, or y) 
* .{2,6} (between two and six of any character)
* "Kleene Star":  match 0 or more of the character that it follows
* "Kleene Plus":  match 1 or more of the character that it follows
* example, we can use the pattern \d* to match any number of digits
* example,  \d+ which ensures that the input string has at least one digit
* example .* matched zero or more of any character
* optionality: the "?" (question mark) metacharacter denotes optionality. allows you to match either zero or one of the preceding character or group
* example, the pattern ab?c will match either the strings "abc" or "ac" because the b is considered optional
* a pattern that describes both the start and the end of the line using the special ^ (hat) and $ (dollar sign) metacharacters
* Note: the start/end pattern is different than the hat used inside a set of bracket [^...] for excluding characters


The most common forms of whitespace you will use with regular expressions are the 
space (␣), the tab (\t), the new line (\n) and the carriage return (\r) (useful in 
Windows environments), and these special characters match each of their respective 
whitespaces. In addition, a whitespace special character \s will match any of the 
specific whitespaces above and is extremely useful when dealing with raw input text.

Extracting
-----------
* "Match Groups"
Regular expressions allow us to not just match text but also to extract information 
for further processing. This is done by defining groups of characters and capturing 
them using the special parentheses ( and ) metacharacters. Any subpattern inside a 
pair of parentheses will be captured as a group. In practice, this can be used to 
extract information like phone numbers or emails from all sorts of data.

Example: Imagine for example that you had a command line tool to list all the image 
files you have in the cloud. You could then use a pattern such as ^(IMG\d+\.png)$ to 
capture and extract the full filename, but if you only wanted to capture the filename 
without the extension, you could use the pattern ^(IMG\d+)\.png$ which only captures 
the part before the period.

* "Nested Groups"
When you are working with complex data, you can easily find yourself having to extract 
multiple layers of information, which can result in nested groups. Generally, the results 
of the captured groups are in the order in which they are defined (in order by open 
parenthesis).

Take the example from the previous lesson, of capturing the filenames of all the image 
files you have in a list. If each of these image files had a sequential picture number 
in the filename, you could extract both the filename and the picture number using the 
same pattern by writing an expression like ^(IMG(\d+))\.png$ (using a nested parenthesis 
to capture the digits).

The nested groups are read from left to right in the pattern, with the first capture 
group being the contents of the first parentheses group, etc.

Other special characters
-------------------------
\d digits
\s whitespace
\w alphanumeric letters and digits

Note: regular expressions also provides a way of specifying the **opposite** sets of each 
of these metacharacters by using their upper case letters. 
\D represents any non-digit character
\S any non-whitespace character
\W any non-alphanumeric character (such as punctuation)

there is a special metacharacter \b which matches the boundary between a word and a non-word 
character. It's most useful in capturing entire words (for example by using the pattern \w+\b).




^                  // the start of the string
(?=.*[a-z])        // use positive look ahead to see if at least one lower case letter exists
(?=.*[A-Z])        // use positive look ahead to see if at least one upper case letter exists
(?=.*\d)           // use positive look ahead to see if at least one digit exists
(?=.*[_\W])        // use positive look ahead to see if at least one underscore or non-word character exists
.+                 // gobble up the entire string
$                  // the end of the string



match at least one special char in list (!@#$%^&*()_+\-=[]{};':"\\|,.<>\/?)

```
[!@#$%^&\*\(\){}\[\]|;':",.\/<>\?]+
```


* **Match a single character present in the list:** [!@#$%^&\*\(\)\{\}\[\]|;':",.\/<>\?\+\_\-\=~\`]+

```
/[!@#$%^&\*\(\)\{\}\[\]|;':",.\/<>\?\+\_\-\=~\`]+/
```

```
!@#$%^& matches a single character in the list !@#$%^& (case sensitive)
\* matches the character * literally (case sensitive)
\( matches the character ( literally (case sensitive)
\) matches the character ) literally (case sensitive)
\{ matches the character { literally (case sensitive)
\} matches the character } literally (case sensitive)
\[ matches the character [ literally (case sensitive)
\] matches the character ] literally (case sensitive)
|;':",. matches a single character in the list |;':",. (case sensitive)
\/ matches the character / literally (case sensitive)
<> matches a single character in the list <> (case sensitive)
\? matches the character ? literally (case sensitive)
\+ matches the character + literally (case sensitive)
\_ matches the character _ literally (case sensitive)
\- matches the character - literally (case sensitive)
\= matches the character = literally (case sensitive)
~ matches the character ~ literally (case sensitive)
\` matches the character ` literally (case sensitive)

```





