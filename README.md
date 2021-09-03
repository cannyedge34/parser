## Skeleton

Entry point is `parse.rb` script with top level shebang
It loads all required classes and calls Application with provided arguments
The structure based on logic flow:
```
-> App
    (the base logic of application with global exceptions handler)
    -> wrap Cli
     (logic to handle run commands)
        -> wrap Resolver
        (business logic of data processing)
            -> wrap Presenter
            (output of processed results by console or any other ways)
```
## TODO:

- encapsulate solution in a Gem

## Run

    ./parse.rb "Pressuuuuuure"

## Tests

    COVERAGE=true bundle exec rspec

## Lints

    bundle exec rubocop

______________
### Test description

```
The test is as follows: ruby_app

Write a ruby script that:
a. Receives a string as argument ("Pressuuuuuure" is provided)
e.g.: ./parse.rb "Pressuuuuuure"
b. Returns the following:
> sequence of a specific character that appears the most in sequence
e.g.:
uuuuuu
> if there are many of them, return the first character
e.g.: ./parse.rb "Boat"
B
 etc...
```
