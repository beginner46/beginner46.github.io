using Dates

function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end


function hfun_getyear()
  return year(today())
end

"""
    {{ addcomments }}

Add a comment widget, managed by utterances <https://utteranc.es>.
"""
function hfun_addcomments()
    html_str = """
        <div class="comments-back">
        <script src="https://utteranc.es/client.js"
            repo="JaydevSR/personal-website-utterances"
            issue-term="pathname"
            theme="github-light"
            crossorigin="anonymous"
            async>
        </script>
        </div>
    """
    return html_str
end