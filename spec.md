# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (User has_many teams) 
- [ ] Include at least one belongs_to relationship (Team belongs_to User)
- [x] Include at least two has_many through relationships (Pokemon has_many :teams, through: :pokemons_teams & Team has_many :pokemons, through :pokemons_teams)
- [x] Include at least one many-to-many relationship (Pokemon has_many :teams, through: :pokemons_teams & Team has_many :pokemons, through :pokemons_teams)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (pokemons_team.pokemon_nickname)
- [x] Include reasonable validations for simple model objects (User, PokemonsTeam, Team)
- [x] Include a class level ActiveRecord scope method (Pokemon, Pokemon.type_search, Pokemon.name_search, and Pokemon.number_search; /pokemons)
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate