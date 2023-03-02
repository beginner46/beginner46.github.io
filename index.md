@def title = "Home | JaydevSR"

<!-- -----------------
     BIOGRAPHY SECTION
     ----------------- -->

\begin{section}{name="about"}

<!-- LEFT COLUMN -->

@@col-12,col-lg-4,profile

\img{"/assets/img/jaydev_jblpr.jpg", class="avatar avatar-circle", alt="{{fill author}}"}
\portrait{
  name="{{fill author}}",
  job="{{fill jobtitle}}",
  link="{{fill affiliation_link}}",
  linkname="{{fill affiliation}}",
  twitter="{{fill twitter_user}}",
  gscholar="null",
  github="{{fill github_user}}"
}
@@ <!-- end of column -->

<!-- RIGHT COLUMN -->
@@col-12,col-lg-8,about

\begin{biography}{resume="/assets/Jaydev_Singh_Rao_CV.pdf"}
  I am an undergraduate student at [IISER Bhopal](https://iiserb.ac.in) majoring in Electrical Engineering and Computer Science. My academic interests lie at the intersection of _Physics_ and _Computer Science_. I spend most of my time learning tools and techniques in these domains in order to work on problems that interest me.
  
  Right now I am focused on learning and using computational techniques to study problems in statistical physics. Along these lines I have been involved in work on:
  - Monte-Carlo algorithms for studying the properties of classical spin systems.
  - Application of classical spin systems to other problems due to their shared symmetries. 
  - Open source development of a molecular dynamics library in Julia: [Molly.jl](https://github.com/JuliaMolSim/Molly.jl)

Apart from my academic life, my personal life consists of enjoying music, books, anime and company of good people.
\end{biography}

\shortcv{
  interests=["Statistical Physics", "Computational Physics", "Algorithms", "Open Source Scientific Software"],
  education=[
    ("Bachelor of Science (2019-2023)", "Electrical Engineering and Computer Science", "IISER Bhopal")]
}

@@ <!-- end of column -->
\end{section}

<!-- --------------
     SKILLS SECTION
     -------------- -->

<!-- \begin{section}{name="skills", class="wg-featurette", rowclass="featurette"}

\sectionheading{"Skills", class="col-md-12"}

\skill{"Julia", "90%", img="/assets/img/julia-dots.svg"}
\skill{"Machine Learning", "100%", fa="chart-line"}
\skill{"Photography", "10%", fa="camera-retro"}

\end{section} -->


<!-- ------------------
     EXPERIENCE SECTION
     ------------------ -->

<!-- \begin{section}{name="experience"}

\sectionheading{"Experience", class="col-12 col-lg-4"}

@@col-12,col-lg-8

\experience{
  title="CEO",
  company="GenCoin",
  descr="""
    Responsibilities include:
    * Analysing
    * Modelling
    * Deploying
    """,
  from="Jan 2017",
  to="Present",
  location="California",
  active=true
  }
\experience{
  title="Professor",
  company="University X",
  from="Jan 2016",
  to="Dec 2016",
  last=true,
  location="California",
  descr="Taught electronic engineering and researched semiconductor physics."
  }

@@

\end{section} -->

<!-- -----------------------
     ACCOMPLISHMENTS SECTION
     ----------------------- -->

<!-- \begin{section}{name="accomplishments"}

\sectionheading{"Accomplish­ments", class="col-12 col-lg-4"}

@@col-12,col-lg-8

\certificate{
  title="Neural Networks and Deep Learning",
  meta="Coursera",
  metalink="https://www.coursera.org",
  date="Oct 2018",
  certlink="https://www.coursera.org"
  }
\certificate{
  title="Blockchain Fundamentals",
  descr="Formulated informed **blockchain** models, hypotheses, and use cases.",
  meta="Coursera",
  metalink="https://www.edx.org",
  date="Mar 2018",
  certlink="https://www.edx.org"
  }
\certificate{
  title="Object-Oriented Programming in R: S3 and R6 Course",
  meta="DataCamp",
  metalink="https://www.datacamp.com",
  date="Jul 2017 – Dec 2017",
  certlink="https://www.datacamp.com"
}

@@

\end{section} -->

<!-- --------------------
     RECENT POSTS SECTION
     -------------------- -->

<!-- \begin{section}{name="posts", class="wg-pages"}

\sectionheading{"Recent Posts", class="col-12 col-lg-4"}

@@col-12,col-lg-8

{{recentposts 3}}

@@

\end{section} -->

<!-- -----------------
     PORTFOLIO SECTION XXX
     ----------------- -->

<!-- -------------
     TALKS SECTION XXX
     ------------- -->

<!-- --------------------
     FEATURED PUB SECTION XXX
     -------------------- -->

<!-- ---------------------------
     RECENT PUBLICATIONS SECTION XXX
     --------------------------- -->
