# github-comment

> Unfinished project

Leave a comment on any issue or PR on github.com or any enterprise github

### Use

#### Arguments:
    -s (optional) Enterprise github server URL Ex.:https://github.example.com/api/v3/
    -t Personal access token
    -u User name
    -o Organization
    -r Repo
    -i Issue (for post|list) or Comment number (for edit|delete|get)
    -p PR number
    -a Action, [post|edit|delete|get|list] `post` is (default)
    -c Comment message

#### Use:

Comment on an issue: `github-comment [-s server] -t b27a8...500d -u rafiki270 -o einstore -r speedster -i 28 -c "Your comment"`

Comment on a PR: `github-comment [-s server] -t b27a8...500d -u rafiki270 -o einstore -r speedster -p 12 -c "Your comment"`
