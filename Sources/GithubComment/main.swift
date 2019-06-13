//
//  File.swift
//  
//
//  Created by Ondrej Rafaj on 09/06/2019.
//

import Vapor
import ConsoleKit


let console = Terminal()

var commandInput = CommandInput(arguments: CommandLine.arguments)

struct Config {
    let username: String
    let token: String
    let server: String
    let organization: String
    let repo: String
    let issue: String
    let comment: String
}

func config() -> Config {
    var username: String?
    var token: String?
    var server: String?
    var organization: String?
    var repo: String?
    var issue: String?
    var comment: String?
    
    var previous: String?
    for arg in commandInput.arguments {
        switch true {
        case previous == "--user" || previous == "-u":
            username = arg
        case previous == "--token" || previous == "-t":
            token = arg
        case previous == "--server" || previous == "-s":
            server = arg
        case previous == "--org" || previous == "-o":
            organization = arg
        case previous == "--repo" || previous == "-r":
            repo = arg
        case previous == "--issue" || previous == "-i" || previous == "--pr" || previous == "-p":
            issue = arg
        case previous == "--comment" || previous == "-c":
            comment = arg
        case arg == "--help" || arg == "-h":
            print("Arguments:")
            print("    -s (optional) Enterprise github server URL Ex.:https://github.example.com/api/v3/")
            print("    -t Personal access token")
            print("    -u User name")
            print("    -o Organization")
            print("    -r Repo")
            print("    -i Issue number")
            print("    -p PR number")
            print("    -c Comment message")
            print("Use:")
            print("Comment on an issue: github-comment [-s server] -t b27a8...500d -u rafiki270 -o einstore -r speedster -i 28 -c \"Your comment\"")
            print("Comment on a PR: github-comment [-s server] -t b27a8...500d -u rafiki270 -o einstore -r speedster -p 12 -c \"Your comment\"")
            exit(0)
        default:
            previous = arg
            continue
        }
        previous = arg
    }
    
    guard let u = username else { fatalError("Missing github username (--help for more)") }
    guard let t = token else { fatalError("Missing personal access token token (--help for more)") }
    guard let o = organization else { fatalError("Missing organization name (--help for more)") }
    guard let r = repo else { fatalError("Missing repo name (--help for more)") }
    
    guard let i = issue else { fatalError("Missing issue/pr number (believe it or not, they are the same thing! mind-blown!) (--help for more)") }
    
    guard let c = comment else { fatalError("Missing comment message (--help for more)") }
    
    let s = server ?? "https://api.github.com"
    
    print("Setup:")
    print("    Server           - \(s)")
    print("    Token            - ****************")
    print("    Username         - \(u)")
    print("    Organization     - \(o)")
    print("    Repo             - \(r)")
    print("    Issue/PR number  - \(i)")
    print("    Comment          - \(c)")
    
    return Config(
        username: u,
        token: t,
        server: s,
        organization: o,
        repo: r,
        issue: i,
        comment: c
    )
}

print("github-comment by Einstore, the open source enterprise appstore solution")
print("https://github.com/Einstore/github-comment")

let _ = config()

