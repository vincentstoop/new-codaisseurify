Song.delete_all
Artist.delete_all

w1 = Song.new(title: "How will I know", year: 1985)
w2 = Song.new(title: "All at once", year: 1985)
w3 = Song.new(title: "I have nothing", year: 1993 )
m1 = Song.new(title: "Earth Song", year: 1995)
m2 = Song.new(title: "Thriller", year: 1984)
m3 = Song.new(title: "Billie Jean", year: 1983)
m4 = Song.new(title: "Stranger in Moscow", year: 1997)
e1 = Song.new(title: "Occhi di speranza", year: 1988)
e2 = Song.new(title: "Ad un amico", year: 1982)
e3 = Song.new(title: "Amarte es total", year: 1990)
e4 = Song.new(title: "Estrella gemela", year: 1996)
d1 = Song.new(title: "I will always love you", year: 1973)
d2 = Song.new(title: "Eagle when she flies", year: 1991 )
d3 = Song.new(title: "Jolene", year: 1974)
d4 = Song.new(title: "9 to 5", year: 1980)
d5 = Song.new(title: "The Seeker", year: 1975)



whitney = Artist.new(name: "Whitney Houston", bio: "<p>Whitney Elizabeth Houston (August 9, 1963 – February 11, 2012) was an American singer, actress, producer, and model. In 2009, Guinness World Records cited her as the most awarded female act of all time. Houston is one of pop music's best-selling music artists of all-time, with an estimated 170–200 million records sold worldwide. She released seven studio albums and two soundtrack albums, all of which have diamond, multi-platinum, platinum or gold certification. Houston's crossover appeal on the popular music charts, as well as her prominence on MTV, starting with her video for 'How Will I Know', influenced several African American women artists who follow in her footsteps.</p>", songs: [w1, w2, w3])
michael = Artist.new(name: "Michael Jackson", bio: "<p>Michael Joseph Jackson (August 29, 1958 – June 25, 2009) was an American singer, songwriter, record producer, dancer, actor, and philanthropist. Called the 'King of Pop', his contributions to music, dance, and fashion along with his publicized personal life made him a global figure in popular culture for over four decades.</p><p>The eighth child of the Jackson family, Michael made his professional debut in 1964 with his elder brothers Jackie, Tito, Jermaine, and Marlon as a member of the Jackson 5. He began his solo career in 1971. In the early 1980s, Jackson became a dominant figure in popular music. His music videos, including those of 'Beat It', 'Billie Jean', and 'Thriller' from his 1982 album Thriller, are credited with breaking racial barriers and transforming the medium into an art form and promotional tool. The popularity of these videos helped bring the television channel MTV to fame. Jackson's 1987 album Bad spawned the U.S. Billboard Hot 100 number-one singles 'I Just Can't Stop Loving You', 'Bad', 'The Way You Make Me Feel', 'Man in the Mirror', and 'Dirty Diana', becoming the first album to have five number-one singles on the Billboard Hot 100. He continued to innovate with videos such as 'Black or White' and 'Scream' throughout the 1990s, and forged a reputation as a touring solo artist. Through stage and video performances, Jackson popularized a number of complicated dance techniques, such as the robot and the moonwalk, to which he gave the name. His distinctive sound and style has influenced numerous artists of various music genres.</p>", songs: [m1,m2,m3,m4])
eros = Artist.new(name: "Eros Ramazzotti", bio: "<p>Eros Luciano Walter Ramazzotti (born 28 October 1963) is an Italian musician and singer-songwriter. Ramazzotti is popular in Italy and most European countries, and throughout the Spanish-speaking world, as he has released most of his albums in both Italian and Spanish.</p><p>Since 1984, Ramazzotti he has released 11 studio albums, one EP, three compilation albums, three live albums, and 37 singles. He has sold over 60 million records in his 30-year career. His repertoire includes duets with artists such as Cher, Tina Turner, Andrea Bocelli, Patsy Kensit, Anastacia, Joe Cocker, Lynn Davis, Ricardo Arjona, Luciano Pavarotti, Laura Pausini, Nicole Scherzinger and Ricky Martin.</p>", songs: [e1, e2, e3, e4])
dolly = Artist.new(name: "Dolly Parton", bio: "<p>Dolly Parton Dean (born Dolly Rebecca Parton on January 19, 1946), professionally known as Dolly Parton, is an American singer, songwriter, multi-instrumentalist, record producer, actress, author, businesswoman, and philanthropist, known primarily for her work in country music. After achieving success as a songwriter for others, Dolly Parton made her album debut in 1967, with her album Hello, I'm Dolly. With steady success during the remainder of the 1960s (both as a solo artist and with a series of duet albums with Porter Wagoner), her sales and chart peak came during the 1970s and continuing into the 1980s; Parton's subsequent albums in the later part of the 1990s were lower in sales. However, in the new millennium, Parton achieved commercial success again and has released albums on independent labels since 2000, including albums on her own label, Dolly Records.</p>", songs: [d1, d2, d3, d4, d5])
