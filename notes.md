## Stats

- 360 MB uncompressed
- 26m usernames
  - 8m have just a single comment
  - 13m (50%) have <= 5 comments
  - 9.5m have >= 10 comments
- 6.5m usernames have a numerical suffix
  - 275k distinct suffixes (top 3: 1, 2, 123)

## Interesting questions

- It would actually be really funny just to review all the names of the form `pm_me_your_`. There are a lot.
- Distribution of numerical suffixes (by # of digits)
  - which num suffixes have the property of being the least common 'so far'?
  - some kind of visualization highlighting different trends in turn, e.g.
    - repeated digits
    - increasing/decreasing digits
    - powers of 2
  - would be interesting to compare with other examples of domains where people are picking sequences of digits. (Picked) lottery numbers (does that dataset exist?), PINs, sports jerseys, vanity plates, phone numbers...
- trends in 'throwaway' account names?
  - (could roughly identify them with small # of comments. More principled approach would probably also look for a short window of activity. Someone could do an AMA on a throwaway account and post 50 comments in one day, then never comment on that account again.)
- automatically identifying clusters of common username templates (such as `PM_ME_YOUR_${FOO}`, or um, idk, there must be others? I think at one point lots of people did variations on `i_rape_cats`.)
  - but yeah, this'd be an interesting algorithmic challenge. How would you do this?
  - what would distance fn between usernames look like?
    - Lev distance?
    - might want to incorporate some domain knowledge...
    - certain characters are fairly superfluous. `( foo_bar - foobar ) < ( foo_bar - footbar )`.
    - all sequences of digits can be treated as roughly the same. Numeric suffixes can kind of be ignored completely.
    - case doesn't matter too much ('c' is way more similar to 'C' than to 'd')
    - matching character bigrams, trigrams, etc. are more important than the same number of individual character matches in different positions (w shingling)
  - maybe something similar to how people identify similar images? apply some kind of very coarse, locality sensitive hashing function, and see which buckets get the most hits?
    - what would that hash function look like?
    - maybe something like...
      - lowercase
      - remove underscores and dashes
      - replace digits (or sequences thereof?) with placeholder (#)
      - dedupe consecutive characters?
  - another high-level approach to try: pass a rolling window over all usernames (maybe also applying some normalization rules?), to find most common username substrings
    - would be really cool if you could somehow do multiple window sizes together in some intelligent way. e.g. even though "throwawa" is probably a little more frequent than "throwaway", we know that based on their relative frequencies, the latter 'dominates' the former.
  - https://en.wikipedia.org/wiki/W-shingling
  - man, Wikipedia has so many garbage articles on clustering
    - especially for particular domain-specific problems
    - https://en.wikipedia.org/wiki/Sequence_clustering
  - and of course the really fancy thing would be to do some kind of machine learning neural network thingamajig
    - some kind of auto-encoder/RBM architecture, then cluster by latent representation
