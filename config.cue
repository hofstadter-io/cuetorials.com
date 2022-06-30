package config

baseURL: "https://cuetorials.com/"

languageCode:           "en-us"
DefaultContentLanguage: "en"
title:                  "Cuetorials"

enableGitInfo: true

pygmentsCodeFences: true
pygmentsStyle:      "github"

defaultContentLanguage:               "en"
defaultContentLanguageInSubdir:       false
enableMissingTranslationPlaceholders: false

params: {
	ordersectionsby:     "weight"
	disableSearch:       false
	disableReadmoreNav:  false // set true to hide prev/next navigation, default is false
	highlightClientSide: false // set true to use highlight.pack.js instead of the default hugo chroma highlighter
	menushortcutsnewtab: true  // set true to open shortcuts links to a new tab/window
	ga:                  "UA-103579574-6"
  github_project_repo: "https://github.com/hofstadter-io/cuetorials.com"
  github_repo:         "https://github.com/hofstadter-io/cuetorials.com"
	time_format_default: "January 2, 2006"
  keywords:            ["cue","cuelang","tutorial","example"]
	hofver:              "v0.6.2"
	cuever:              "v0.4.3"
	cuedocBase:          "https://pkg.go.dev/cuelang.org/go@\(cuever)"
}

languages: {
  en: {
    title: 'Cuetorials'
    weight: 1
    languageName: 'English'
  }
  zh: {
    title: 'Cuetorials'
    weight: 2
    languageName: '简体中文'
  }
}

markup: goldmark: renderer: unsafe: true

markup: tableOfContents: {
	startLevel: 2
	endLevel:   3
}

outputs: home: ["HTML", "RSS", "JSON"]

menu: shortcuts: [{
  name: "v0.4.3 <i class='fas fa-copyright pl-2'></i> Cuelang.org"
  url: "https://cuelang.org"
  weight: 0
}, {
  name: "<i class='fab fa-github'></i> GitHub"
  url: "https://github.com/cue-lang/cue"
  weight: 1
}, {
  name: "<i class='fas fa-play-circle'></i> Playground"
  url: "https://cuelang.org/play/"
  weight: 2
}, {
  name: "<i class='fas fa-user'></i> Community"
  url: "https://cuelang.org/community/"
  weight: 3
}, {
  name: "<i class='fab fa-github'></i> Cuetorials GH"
  url: "https://github.com/hofstadter-io/cuetorials.com"
  weight: 4
}]
