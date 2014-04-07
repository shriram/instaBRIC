instaBRIC

=========
Backround

Make yourself an international economics pundit.

Over a decade ago, Jim O'Neill of Goldman Sachs published a deeply
influential report where he introduced the term BRICs: Brazil, Russia,
India, and China, as significant, representative emerging market
economies. Arguably, choosing these countries has given them
disproportionate influence.

Over time others have tried to create their own four-country
groupings. For instance, today, I saw an ad claiming that the BRICs
are passe; now they want us to focus on TRIPs.

Obviously, coming up with a four-letter country grouping is the
requisite first step towards international economics punditry. And
this is where I come in: I want to help _you_ become a pundit, too! So
I will do the hard work of generating the quartets; you do the easy
job of wrapping it in some explanatory text. Really, just make up any
old thing you'd like, what matters most is how catchy your quartet is.

-
Process

Ideally, we want to find all 4-letter words in the dictionary that can
be made up of the initials of countries. However, the astute reader
will notice this will have ruled out the grandparent of them all,
*BRIC*, which is a _prefix_ of a word rather than a word
itself. Therefore, we will look at prefixes, not words. Furthermore,
maybe your avenue to fame is to break with the 4-letter tradition and
use three or -- look out! -- _five_ letters. I will not judge you; I
am your servant. Therefore, these are all parameters.

For better or worse, just about every letter of the alphabet has a
country whose name begins with that letter. Indeed, when I processed
the data and looked at the number of distinct initial letters, I
found...26. This is not exactly the 26 one might naively expect: why?

That's because there appears to be no country whose name begins with
`X'. In its place, however, we have the Åland Islands.

This meant just about every word in the dictionary works. Indeed, my
dictionary has 15,502 words between 4 and 5 characters long, of which
only 346 are disqualified for containing `X'.

Removing capital initials (i.e., proper nouns) gets rid of 2,574.

How can we prune the search space?

Asking for palindromes gives us just 39 words. (Going up to the range
4-6 characters still gave only 46 names.) Furthermore, if we take all
the letters that appear in these 39 words, that drops six characters
entirely (namely, G, H, Q, W, X, and Z). [There are 26 countries whose
names begin with these letters.]  So you could decide to make the next
celebrated country group be a palindrome!

-
How to Run

I assume you have installed Racket v6.0 (http://racket-lang.org/).

[TODO]

-
Sources

* I got my list of countries, with thanks, from

  http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2

  which I scraped using Excel. This produced a file with numerous
  problems such as extra lines, broken accent characters,
  etc. (because computers, and because I didn't just pay ISO). I
  manually fixed it. I then went through and removed all the frippery
  (e.g., "Republic of"), because it gets in the way of creating catchy
  country groups.

* I use /usr/share/dict/words on OS X. Yes, that file has issues. They
  all do.

-
NOTE TO AGGRIEVED NATIONALISTS

Your country may not be listed, or it may be listed in a way you find
distasteful. Or, your neighboring country may be listed in a way you
consider incorrect. (It's always neighboring countries, isn't it?)

Admittedly, some of these came about because I edited the file to use
the shortest names of places, e.g., using the common name wherever
possible. But the rest are all either because I made a mistake while
editing the file, or because that's just how the original Wikipedia
page is. IT IS NOT AN INTENTIONAL SLIGHT. Please do not mail me a
bomb. This doesn't have quite the same ring as "Make love, not war",
but still:

  Make pull-requests, not bombs

Better still, go duke it out on Wikipedia instead.

-
NOTE TO AGGRIEVED LINGUISTS

Yes, I know, there are many languages in the world, not only
English. (I even know some of the others.) If you change languages you
also change the names of some of the countries, which can sometimes
alter the initial letter. (And yes, "letter" is already a
certain-language-model-centric.) That leads to different
abbreviations, and breaks some of the ones here. I know. This is open
source. Go for it. Allez!
