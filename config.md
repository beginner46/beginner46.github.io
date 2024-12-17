+++
author = "Shashank Singh"
shortauthor = "Shashank Singh"
twitter_user = "https://x.com/si4143"
github_user = "https://github.com/beginner46"
linkedin_user = "https://www.linkedin.com/in/shashank-singh-27366b179/"


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
website_title = "Shashank Singh | Homepage"
website_descr = "Personal homepage of Shashank Singh."
website_url   = "https://beginner46.github.io/"
+++



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
