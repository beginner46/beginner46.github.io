<!--
Add here global page variables to use throughout your website.
-->
+++
author = "Jaydev Singh Rao"
mintoclevel = 2

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/"]

keep_path = ["googlea78425b1c2c37f03.html"]

+++

<!--
Add here global latex commands to use throughout your pages.
-->
\newcommand{\R}{\mathbb R}
\newcommand{\scal}[1]{\langle #1 \rangle}
\newcommand{\danger}[1]{
    ~~~
    <span style="color: red;">#1</span>
    ~~~
    }
\newcommand{\note}[1]{
    ~~~
    <span style="color: slategray;">#1</span>
    ~~~
    }
\newcommand{\blue}[1]{
    ~~~
    <span style="color: blue;">#1</span>
    ~~~
}
\newcommand{\lined}[1]{
    <u>#1</u>
}
\newcommand{\description}[1]{
    ~~~
    <span style="color: slategray; margin-bottom: 10px; font-size:16px; font-weight: 300;">📋 !#1</span>
    ~~~
}

\newcommand{\date}[1]{
    ~~~
    <div style="color: slategray; margin-bottom: 10px; font-size: 16px; font-weight: 300;">📅 !#1</div>
    ~~~
}

\newcommand{\emptypar}{
    ~~~
    <p>&nbsp</p>
    ~~~
}