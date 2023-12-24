+++
author = "Jaydev Singh Rao"
shortauthor = "Jaydev S. Rao"
jobtitle = "Postgraducate Student (MASt in Physics)"
affiliation = "University Of Cambridge"
affiliation_link = ""
twitter_user = "https://twitter.com/JaydevSR"
github_user = "https://github.com/JaydevSR"
scholar_link = "https://scholar.google.com/citations?user=Ixrhe4gAAAAJ&hl=en&oi=sra"

mintoclevel = 2
ignore = ["node_modules/", "franklin", "franklin.pub"]

prepath = ""

hasplotly = false
hasmermaid = false

# Set global variable `dateformat` to `"post"`, `"yearmonth"`, or `"year"`
# The expected file structures are
# - `"yearmonth"`: posts/YYYY/MM/name-of-post.md
# - `"year"`: posts/YYYY/name-of-post.md
# - `"post"`: posts/name-of-post.md
dateformat = "yearmonth"
# RSS setup
website_title = "Jaydev Singh Rao | Homepage"
website_descr = "Personal homepage of Jaydev Singh Rao."
website_url   = "https://jaydevsr.github.io/"
+++

\newcommand{\callout}[1]{~~~<div class="alert alert-note"><div>~~~#1~~~</div></div>~~~}

\newcommand{\icon}[1]{~~~<i class="fas fa-~~~!#1~~~"></i>~~~}

\newcommand{\style}[2]{~~~<span style="!#1">!#2</span>~~~}

\newcommand{\twosidebox}[1]{
    ~~~
    <div style="
            border-style: hidden hidden hidden solid;
            border-image: 
                linear-gradient(
                    to bottom, 
                    var(--tertiary-color), 
                    rgba(0, 0, 0, 0)
                ) 1 100%;
            padding: 1em;
            margin-top: 0.5em;">
        !#1
    </div>
    ~~~
}