const shiki = require('shiki')
const fs = require('fs');
var data = fs.readFileSync(0, 'utf-8');

// const t = shiki.loadTheme('./theme.json')

shiki
  .getHighlighter({
    theme: 'github-light'
  })
  .then(highlighter => {
    console.log(highlighter.codeToHtml(data, 'cue'))
  })
