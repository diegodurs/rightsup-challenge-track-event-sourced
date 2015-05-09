
`bundle install` then run test with `rake test`, open a console with `rake console`.


Description Junior challenge[FR]
--------------------------------

Avec Jouba, j'aimerais pouvoir créer un Track avec un titre, et y ajouter des artistes. Pour cela on va utiliser Track comme Root Aggregate. Et y ajoutera une association one-to-many pour les artistes (attention, içi ce n'est pas un `has_many :artists` à la Rais, c'est différent, on fait de l'event sourcing ...).

Je veux simplement pouvoir faire:

```ruby
track = Track.create(title: 'Uptown Funk')
track.add_main_artist(name: 'Mark Ronson')
track.add_featured_artist(name: 'Bruno Mars')
```

Et ensuite, si je le récupère, j'aimerais pouvoir faire ceci:

```ruby
track = Track.find(id)
track.title # 'Uptown Funk'
track.main_artists.map(&:name) # ['Mark Ronson']
track.featured_artists.map(&:name) # ['Bruno Mars']
track.artists.map(&:name) # ['Mark Ronson', 'Bruno Mars']
```

Le but est d'atteindre l'objectif le plus simplement possible mais je met beaucoup d'importance aux détails du code.
Tu gagneras énormément de temps en créant un test dés le départ, ce test guidera ton developpement.

Maquette de test pour t'aider:
```ruby
class TestTrack < Minitest::Test
  def setup
    @track = Track.create(title: 'Uptown Funk')
    @track.add_main_artist(name: 'Mark Ronson')
    @track.add_featured_artist(name: 'Bruno Mars')
  end

  def test_title_is_set
    assert_equal 'Uptown Funk', @track.title
  end

  def test_rebuild
    track_rebuilded = Track.replay(Track.stream(@track.uuid))
    assert_equal @track, track_rebuilded
  end

  # add more test
end
```