# Soccer::Engine

This is an atempt to build a probabilistic soccer manager game using Markov Chains and Probabilistic Programming.
My goal here, is to use these concepts in a pet-project just to pratice. I don't have the intetion to build the next generation of Soccer Manager games, rs.

The basic idea is that players, in na determinted position, have possible actions,  and this actions have probabilities associated.

For example:
A player with a Foward position, should can be a something like this:

```ruby
 {
  short_pass: 0.20,
  long_pass: 0.10,
  shot_on_goal: 0.70
}
```

The engine use this probabilities to choose what is the action that a player will do.


## Usage
We need to two teams and a event listener.
To start a game:

```ruby
  Soccer::Engine.start_game(team1, team2, event_listener)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/soccer-engine/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
