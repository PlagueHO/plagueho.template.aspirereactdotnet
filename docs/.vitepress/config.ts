import { defineConfig } from 'vitepress'

export default defineConfig({
  title: '{{PROJECT_DISPLAY_NAME}}',
  description: 'Project documentation',
  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Design', link: '/design/overview' }
    ],
    sidebar: [
      {
        text: 'Design',
        items: [
          { text: 'Overview', link: '/design/overview' },
          { text: 'Technology', link: '/design/technology' },
          { text: 'Testing', link: '/design/testing' }
        ]
      }
    ]
  }
})
